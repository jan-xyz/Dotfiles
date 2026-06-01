vim.pack.add({
	"https://github.com/f-person/auto-dark-mode.nvim",
	{ src = "https://github.com/catppuccin/nvim",  name = "catppuccin" },
	{ src = "https://github.com/rose-pine/neovim", name = "rose-pine" },
})

require("auto-dark-mode").setup({
	set_dark_mode = function()
		vim.api.nvim_set_option_value("background", "dark", {})
	end,
	set_light_mode = function()
		vim.api.nvim_set_option_value("background", "light", {})
	end,
	update_interval = 1000,
	fallback = "dark",
})
vim.cmd.colorscheme("catppuccin")
