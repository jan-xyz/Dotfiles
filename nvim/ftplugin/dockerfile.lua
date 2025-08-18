vim.lsp.config("docker_language_server", {
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
})
vim.lsp.enable("docker_language_server")
