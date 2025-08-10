return {
	{
		"nvim-lualine/lualine.nvim",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("lualine").setup({
				options = {
					globalstatus = true,
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { { "branch" } },
					lualine_c = {},
					lualine_x = {},
					lualine_y = { { "diagnostics" } },
					lualine_z = { { "filetype", draw_empty = true } },
				},
				extensions = { "toggleterm" },
			})
		end,
	},
}
