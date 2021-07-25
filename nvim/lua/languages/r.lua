local nvim_lsp = require("lspconfig")
local lsp = require("lsp")

nvim_lsp.r_language_server.setup({
	on_attach = lsp.on_attach,
})
