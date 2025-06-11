vim.lsp.config("julials", {
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
})
vim.lsp.enable("julials")
