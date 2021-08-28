local packer = require("packer")

packer.reset()
packer.init({
	display = {
		open_fn = require("packer.util").float,
	},
})

-- UX
packer.use({
	"folke/which-key.nvim",
	config = function()
		require("which-key").setup({
			-- your configuration comes here
			-- or leave it empty to packer.use the default settings
			-- refer to the configuration section below
		})
	end,
})
packer.use("felipec/vim-sanegx")
