vim.lsp.config("r_language_server", {
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
})
vim.lsp.enable("r_language_server")
