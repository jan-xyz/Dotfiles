local nvim_lsp = require("lspconfig")
local lsp = require("lsp")

-- Kotlin
nvim_lsp.kotlin_language_server.setup({
	on_attach = lsp.on_attach,
	cmd = { "kotlin-language-server" },
})
