return {
	{
		"mfussenegger/nvim-lint",
		config = function()
			require("lint").linters_by_ft = {
				markdown = { "markdownlint" },
				proto = { "buf_lint" },
			}
			-- lint on enter and save
			vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "BufWinEnter" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},
}
