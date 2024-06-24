-- set neovim-remote as git editor to open git commits from the builtin terminal inside neovim
vim.env.GIT_EDITOR = "nvr -cc split --remote-wait"

-- delete git buffers directly when done with writing a commit to not make nvr wait on close.
-- if removed you need to manually delete the buffer.
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "gitcommit", "gitrebase", "gitconfig" },
	callback = function()
		vim.bo.bufhidden = "delete"
	end,
})

return {
	{
		"akinsho/git-conflict.nvim",
		event = { "BufReadPost", "BufNewFile" },
		version = "*",
		config = true,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPost", "BufNewFile" },
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
