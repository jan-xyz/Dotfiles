vim.lsp.config("jsonnet_ls", {
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
})
vim.lsp.enable("jsonnet_ls")
