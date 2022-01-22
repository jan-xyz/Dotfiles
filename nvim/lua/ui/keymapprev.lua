local packer = require("packer")

-- Keymap highlighting
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
