local nvim_lsp = require("lspconfig")
local lsp = require("lsp.config")
local completion = require("ui.completion")

-- Docker
nvim_lsp.dockerls.setup({
	capabilities = completion.capabilities,
	on_attach = lsp.on_attach,
})
