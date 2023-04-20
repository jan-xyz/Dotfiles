local packer = require("packer")

packer.use({
	"nvim-neorg/neorg",
	requires = { "nvim-lua/plenary.nvim", "folke/zen-mode.nvim" },
	config = function()
		require("neorg").setup({
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
		})
	end,
})
