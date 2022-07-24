local packer = require("packer")
packer.use({
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v2.x",
	requires = {
		"nvim-lua/plenary.nvim",
		"kyazdani42/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					hide_dotfiles = false,
					hide_gitignored = false,
					hide_hidden = true,
				},
			},
		})

		local wk = require("which-key")
		wk.register({
			e = { "<cmd>Neotree toggle=true<CR>", "Toggle file explorer", noremap = true },
			f = { "<cmd>Neotree action=focus reveal=true<CR>", "Find file in file explorer", noremap = true },
		}, {
			prefix = "f",
		})
	end,
})
