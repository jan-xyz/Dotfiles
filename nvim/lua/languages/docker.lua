local nvim_lsp = require("lspconfig")
local lsp = require("lsp.config")

-- Docker
nvim_lsp.dockerls.setup({
	on_attach = lsp.on_attach,
})
