return {
	{
		"pwntester/octo.nvim",
		opts = {},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("gitsigns").setup({
				signcolumn = false,
				numhl = true,
				word_diff = false,
			})
			local gitsigns = require("gitsigns")
			vim.keymap.set("n", "<leader>gb", gitsigns.blame_line, { noremap = true, desc = "Open blame" })
			vim.keymap.set("n", "<leader>gd", gitsigns.preview_hunk, { noremap = true, desc = "Preview diff" })
			vim.keymap.set({ "n", "v" }, "<leader>gr", gitsigns.reset_hunk, { noremap = true, desc = "Reset hunk" })
			vim.keymap.set({ "n", "v" }, "<leader>gs", gitsigns.stage_hunk, { noremap = true, desc = "Stage hunk" })
			vim.keymap.set("n", "<leader>gu", gitsigns.undo_stage_hunk, { noremap = true, desc = "Unstage hunk" })
		end,
	},
}
