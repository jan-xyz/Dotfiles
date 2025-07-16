vim.lsp.config("kotlin_lsp", {
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
})
vim.lsp.enable("kotlin_lsp")
