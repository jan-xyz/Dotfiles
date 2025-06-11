vim.lsp.config("ccls", {
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
})
vim.lsp.enable("ccls")
