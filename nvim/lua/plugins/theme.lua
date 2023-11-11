return {
	{
		"jan-xyz/nord.nvim",
		priority = 100,
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
		priority = 100,
		name = "catppuccin",
	},
}
