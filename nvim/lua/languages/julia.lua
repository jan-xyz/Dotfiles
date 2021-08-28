local nvim_lsp = require("lspconfig")
local lsp = require("lsp.config")
nvim_lsp.julials.setup({
	on_attach = lsp.on_attach,
})
