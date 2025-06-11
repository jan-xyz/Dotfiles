vim.lsp.config("metals", {
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
})
vim.lsp.enable("metals")
