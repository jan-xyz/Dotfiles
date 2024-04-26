return {
	{
		"nvim-neorg/neorg",
		dependencies = { "vhyrro/luarocks.nvim", priority = 1000, config = true },
		version = "*",
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
