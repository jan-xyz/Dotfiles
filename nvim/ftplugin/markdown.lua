vim.lsp.config("remark_ls", {
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
	settings = {
		remark = { requireConfig = false },
	},
})
vim.lsp.enable("remark_ls")
