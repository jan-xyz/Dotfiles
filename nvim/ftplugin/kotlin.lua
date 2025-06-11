vim.lsp.config("kotlin_language_server", {
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
	cmd = { "kotlin-language-server" },
})
vim.lsp.enable("kotlin_language_server")
