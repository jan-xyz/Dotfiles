local packer = require("packer")
packer.use({
	"kyazdani42/nvim-tree.lua",
	requires = { "kyazdani42/nvim-web-devicons", "folke/which-key.nvim" },
	config = function()
		require("nvim-tree").setup({
			open_on_setup = true,
			auto_close = false,
			quit_on_open = false,
			diagnostics = {
				enable = true,
			},
			hijack_cursor = true,
			view = {
				side = "left",
				auto_resize = true,
			},
		})

		local wk = require("which-key")
		wk.register({
			e = { "<cmd>NvimTreeToggle<CR>", "Toggle file explorer", noremap = true },
			f = { "<cmd>NvimTreeFindFile<CR>", "Find file in file explorer", noremap = true },
		}, {
			prefix = "t",
		})
	end,
})
