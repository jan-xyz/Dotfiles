return {
	{
		"nvim-neorg/neorg",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"folke/zen-mode.nvim",
			"hrsh7th/nvim-cmp",
			"nvim-treesitter/nvim-treesitter",
		},
		build = ":Neorg sync-parsers",
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
