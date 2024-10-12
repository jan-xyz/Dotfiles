vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.libsonned" },
	callback = function()
		vim.bo.syntax = "javascript"
	end,
})
