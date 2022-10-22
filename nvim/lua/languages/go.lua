local nvim_lsp = require("lspconfig")
local lsp = require("lsp.config")
local completion = require("ui.completion")
local packer = require("packer")

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
			hints = {
				assignVariableTypes = true,
				compositeLiteralFields = true,
				constantValues = true,
				functionTypeParameters = true,
				parameterNames = true,
				rangeVariableTypes = true,
			},
		},
	},
})

-- DAP config
packer.use({
	"leoluz/nvim-dap-go",
	requires = { "mfussenegger/nvim-dap" },
	config = function()
		local dap_go = require("dap-go")
		dap_go.setup()
	end,
})
