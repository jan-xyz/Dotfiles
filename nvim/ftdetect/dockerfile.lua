vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.dk" },
	callback = function()
		vim.bo.filetype = "dockerfile"
	end,
})
