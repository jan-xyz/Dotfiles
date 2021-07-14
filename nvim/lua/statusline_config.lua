require("lualine").setup({
	options = {
		theme = "nord",
	},
	sections = {
		lualine_c = {
			{
				"filename",
				file_status = true,
				path = 1,
			},
		},
	},
})
