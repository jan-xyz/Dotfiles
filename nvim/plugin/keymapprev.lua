vim.pack.add({ "https://github.com/folke/which-key.nvim", "https://github.com/nvim-tree/nvim-web-devicons" })
vim.o.timeout = true
vim.o.timeoutlen = 300
local wk = require("which-key")
wk.setup({
	preset = "helix",
	icons = {
		separator = ">",
	},
})
wk.add({
	{ "<leader>g", desc = "Perform Git operations" },
	{ "<leader>z", desc = "Perform Debug operations" },
	{ "<leader>t", desc = "Perform tests" },
})
