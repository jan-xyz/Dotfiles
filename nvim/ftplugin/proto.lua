vim.lsp.config("buf_ls", {
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
	settings = {},
})
vim.lsp.enable("buf_ls")
