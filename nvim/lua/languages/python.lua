local nvim_lsp = require("lspconfig")
local lsp = require("lsp.config")

nvim_lsp.pylsp.setup({
	on_attach = lsp.on_attach,
})
