vim.bo.tabstop = 4
vim.bo.expandtab = false
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4
vim.bo.autoindent = true

vim.lsp.config("kotlin_lsp", {
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
})
vim.lsp.enable("kotlin_lsp")
