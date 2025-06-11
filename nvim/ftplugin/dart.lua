vim.lsp.config("dartls", {
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
	settings = {},
})
vim.lsp.enable("dartls")
