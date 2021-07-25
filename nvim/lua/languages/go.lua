local nvim_lsp = require("lspconfig")
local lsp = require("lsp")

-- Go
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
