vim.lsp.config("vimls", {
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
})
vim.lsp.enable("vimls")
