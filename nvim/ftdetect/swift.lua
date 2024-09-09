vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.swiftinterface" },
	callback = function()
		vim.bo.filetype = "swift"
	end,
})
