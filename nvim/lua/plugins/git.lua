return {
	{
		"pwntester/octo.nvim",
		opts = {},
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"folke/which-key.nvim",
		},
		opts = {
			signcolumn = false,
			numhl = true,
			word_diff = false,
		},
		config = function()
			require("gitsigns").setup({})
			local wk = require("which-key")
			local gitsigns = require("gitsigns")
			-- normal mode
			wk.register({
				g = {
					name = "Git",
					b = { gitsigns.blame_line, "Blame", noremap = true },
					d = { gitsigns.preview_hunk, "Diff", noremap = true },
					r = { gitsigns.reset_hunk, "Reset Hunk", noremap = true },
					s = { gitsigns.stage_hunk, "Stage Hunk", noremap = true },
					u = { gitsigns.undo_stage_hunk, "Undo Stage Hunk", noremap = true },
				},
			}, {
				mode = "n",
				prefix = "<leader>",
			})
			-- visual mode
			wk.register({
				g = {
					name = "Git",
					r = {
						function()
							gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
						end,
						"Reset Hunk",
						noremap = true,
					},
					s = {
						function()
							gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
						end,
						"Stage Hunk",
						noremap = true,
					},
				},
			}, {
				mode = "v",
				prefix = "<leader>",
			})
		end,
	},
}
