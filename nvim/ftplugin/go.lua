vim.bo.autoindent = true
vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.bo.expandtab = false

-- run code actions on safe
vim.api.nvim_create_autocmd("BufWritePre", {
	buffer = 0,
	callback = function(_)
		vim.lsp.buf.format()
		vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true })
	end,
})

vim.lsp.config("gopls", {
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
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
vim.lsp.enable("gopls")
