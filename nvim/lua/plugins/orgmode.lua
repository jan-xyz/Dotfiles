return {
	{
		"nvim-neorg/neorg",
		version = "*",
		ft = "norg",
		opts = {
			load = {
				["core.defaults"] = {}, -- core modules
				["core.completion"] = { -- completion support
					config = {
						engine = "nvim-cmp",
					},
				},
				["core.concealer"] = {}, -- icon support
				["core.presenter"] = {
					config = {
						zen_mode = "zen-mode",
					},
				}, -- presentation mode
			},
		},
	},
}
