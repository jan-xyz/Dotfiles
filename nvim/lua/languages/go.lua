local M = {}

function M.setup()
	local nvim_lsp = require("lspconfig")
	local lsp = require("lsp.config")
	local completion = require("cmp_nvim_lsp")
	-- organise imports on safe
	vim.api.nvim_create_autocmd("BufWritePre", {
		pattern = { "*.go" },
		callback = function()
			vim.lsp.buf.code_action({
				apply = true,
				context = { only = { "source.organizeImports" } },
			})
		end,
	})

	-- LSP config
	nvim_lsp.gopls.setup({
		capabilities = completion.default_capabilities(),
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
end

return M
