-- neovim-remote opens commits from the built-in terminal in this instance
vim.env.GIT_EDITOR = "nvr -cc split --remote-wait"

-- nvr waits until the buffer is gone, so it must not stay hidden
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("my.git_buffers", {}),
	pattern = { "gitcommit", "gitrebase", "gitconfig" },
	callback = function()
		vim.bo.bufhidden = "delete"
	end,
})

require("mini.git").setup()
require("mini.diff").setup({ view = { style = "number" } })

vim.keymap.set("n", "<leader>gd", function()
	MiniDiff.toggle_overlay(0)
end, { desc = "Toggle diff overlay" })
vim.keymap.set("n", "<leader>gb", "<Cmd>vertical Git blame -- %<CR>", { desc = "Open blame" })
vim.keymap.set("n", "<leader>gg", "<Cmd>Git status<CR>", { desc = "Open Git status" })
