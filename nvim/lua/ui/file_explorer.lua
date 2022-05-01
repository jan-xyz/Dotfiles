local packer = require("packer")
packer.use({
	"kyazdani42/nvim-tree.lua",
	requires = { "kyazdani42/nvim-web-devicons", "folke/which-key.nvim" },
	config = function()
		require("nvim-tree").setup({
			diagnostics = {
				enable = true,
				show_on_dirs = true,
			},
			git = { ignore = false },
			hijack_cursor = true,
			view = {
				side = "left",
			},
		})

		local wk = require("which-key")
		wk.register({
			e = { "<cmd>NvimTreeToggle<CR>", "Toggle file explorer", noremap = true },
			f = { "<cmd>NvimTreeFindFile<CR>", "Find file in file explorer", noremap = true },
		}, {
			prefix = "f",
		})
	end,
})
