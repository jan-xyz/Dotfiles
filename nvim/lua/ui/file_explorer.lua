local packer = require("packer")

packer.use({
	"nvim-tree/nvim-tree.lua",
	requires = {
		"nvim-tree/nvim-web-devicons", -- optional, for file icons
	},
	config = function()
		require("nvim-tree").setup({
			diagnostics = { enable = true, show_on_dirs = true },
			filters = {
				dotfiles = false,
			},
			git = { ignore = false },
		})

		local wk = require("which-key")
		wk.register({
			e = { "<cmd>NvimTreeToggle<CR>", "Toggle file explorer", noremap = true },
			f = { "<cmd>NvimTreeFindFile<CR>", "Find file in file explorer", noremap = true },
		}, {
			prefix = "f",
		})
	end
	,
})
