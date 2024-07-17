return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		priority = 999,
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
		},
		config = function()
			require("which-key").setup({
				preset = "helix",
				icons = {
					separator = ">",
				},
			})
			local wk = require("which-key")
			wk.add({
				{ "<leader>g", desc = "Perform Git operations" },
				{ "<leader>z", desc = "Perform Debug operations" },
				{ "t",         desc = "Perform tests" },
			})
		end,
	},
}
