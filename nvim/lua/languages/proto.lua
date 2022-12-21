local nvim_lsp = require("lspconfig")
local lsp = require("lsp.config")
local completion = require("ui.completion")

-- LSP config
nvim_lsp.bufls.setup({
	capabilities = completion.capabilities,
	on_attach = lsp.on_attach,
	settings = {
	},
})
