vim.lsp.config("hls", {
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
})
vim.lsp.enable("hls")
