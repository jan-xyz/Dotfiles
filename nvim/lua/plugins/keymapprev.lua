return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		priority = 999,
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,

		config = function()
			require("which-key").setup({
				-- [top, right, bottom, left]
				window = {
					border = "single",
					margin = { 1, 0, 0, 0.6 },
				},
				layout = { height = { min = 4, max = 75 } },
			})
			local wk = require("which-key")
			wk.register({
				["<leader>g"] = { name = "Perform Git operations" },
				["<leader>z"] = { name = "Perform Debug operations" },
				["t"] = { name = "Perform tests" },
			})
		end,
	},
}
