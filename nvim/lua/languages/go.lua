local nvim_lsp = require("lspconfig")
local lsp = require("lsp.config")
local dap = require("dap")
local completion = require("ui.completion")

-- organise imports on safe
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.go" },
	callback = function()
		local params = vim.lsp.util.make_range_params(nil, "utf-16")
		params.context = { only = { "source.organizeImports" } }
		local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
		for _, res in pairs(result or {}) do
			for _, r in pairs(res.result or {}) do
				if r.edit then
					vim.lsp.util.apply_workspace_edit(r.edit, "utf-16")
				else
					vim.lsp.buf.execute_command(r.command)
				end
			end
		end
	end,
})

-- LSP config
nvim_lsp.gopls.setup({
	capabilities = completion.capabilities,
	on_attach = lsp.on_attach,
	settings = {
		gopls = {
			usePlaceholders = true,
			gofumpt = true,
			analyses = {
				shadow = true,
				unusedparams = true,
				unusedwrite = true,
				nilness = true,
			},
			staticcheck = true,
		},
	},
})

-- DAP config
dap.adapters.go = function(callback, config)
	local handle
	local pid_or_err
	local port = 38697
	handle, pid_or_err = vim.loop.spawn("dlv", {
		args = { "dap", "-l", "127.0.0.1:" .. port },
		detached = true,
	}, function(code)
		handle:close()
		print("Delve exited with exit code: " .. code)
	end)
	-- Wait 100ms for delve to start
	vim.defer_fn(function()
		--dap.repl.open()
		callback({ type = "server", host = "127.0.0.1", port = port })
	end, 100)

	--callback({type = "server", host = "127.0.0.1", port = port})
end
-- Go default launch configs
dap.configurations.go = {
	{
		type = "go",
		name = "Debug current file",
		request = "launch",
		program = "${fileDirname}",
	},
	{
		type = "go",
		name = "Debug tests in current dir", -- configuration for debugging test files
		request = "launch",
		mode = "test",
		program = "${fileDirname}",
	},
}
