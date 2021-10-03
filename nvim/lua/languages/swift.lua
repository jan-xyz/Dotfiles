local nvim_lsp = require("lspconfig")
local lsp = require("lsp.config")

nvim_lsp.sourcekit.setup({
	on_attach = lsp.on_attach,
	cmd = { "xcrun", "sourcekit-lsp" },
})
