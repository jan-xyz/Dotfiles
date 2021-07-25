local nvim_lsp = require("lspconfig")
local lsp = require("lsp")

nvim_lsp.vimls.setup({
	on_attach = lsp.on_attach,
})
