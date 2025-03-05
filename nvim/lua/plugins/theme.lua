return {
	{
		"f-person/auto-dark-mode.nvim",
		dependencies = {
			{ "jan-xyz/nord.nvim",           priority = 1000, lazy = true },
			{ "catppuccin/nvim",             priority = 1000, lazy = true, name = "catppuccin" },
			{ "rose-pine/neovim",            priority = 1000, lazy = true, name = "rose-pine" },
			{ "projekt0n/github-nvim-theme", priority = 1000, lazy = true },
			{ "neanias/everforest-nvim",     priority = 1000, lazy = true, version = false },
			{ "folke/tokyonight.nvim",       priority = 1000, lazy = true, opts = {} },
		},
		config = function()
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
		end,
	},
}
