vim.lsp.config("remark_ls", {
	settings = {
		remark = { requireConfig = false },
	},
})
vim.lsp.enable("remark_ls")
