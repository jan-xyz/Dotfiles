local nvim_lsp = require("lspconfig")
local lsp = require("lsp")
local dap = require("dap")

-- LSP config
nvim_lsp.gopls.setup({
	on_attach = lsp.on_attach,
	settings = {
		gopls = {
			gofumpt = true,
			analyses = {
				shadow = true,
				unusedparams = true,
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
