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
		local wk = require("which-key")
		wk.setup()

		-- global keymaps
		wk.register({
			b = {
				name = "buffer",
				d = { "<cmd>bd<CR>", "delete", noremap = true },
			},
		}, {
			mode = "n",
			prefix = "<leader>",
		})
	end,
})
packer.use("felipec/vim-sanegx")
