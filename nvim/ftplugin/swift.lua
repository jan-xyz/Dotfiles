vim.lsp.config("sourcekit", {
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
})
vim.lsp.enable("sourcekit")
