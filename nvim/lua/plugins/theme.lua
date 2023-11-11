return {
	{
		"jan-xyz/nord.nvim",
		priority = 1000,
		lazy = false,
		config = function()
			vim.cmd("colorscheme nord")
		end,
	},
	-- {
	-- 	"nordtheme/vim",
	-- 	priority = 100,
	-- 	name = "nord-vim",
	-- },
	{
		"catppuccin/nvim",
		priority = 1000,
		name = "catppuccin",
	},
	{
		"projekt0n/github-nvim-theme",
		lazy = false,
		priority = 1000,
	},
	{
		"neanias/everforest-nvim",
		version = false,
		lazy = false,
		priority = 1000,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
}
