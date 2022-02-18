local packer = require("packer")

packer.use({
	"nvim-neorg/neorg",
	config = function()
		require("neorg").setup({
			load = {
				["core.defaults"] = {}, -- core modules
				["core.norg.completion"] = { -- completion support
					config = {
						engine = "nvim-cmp",
					},
				},
				["core.norg.concealer"] = {}, -- icon support
				["core.presenter"] = {}, -- presentation mode
			},
		})
	end,
	requires = "nvim-lua/plenary.nvim",
})
