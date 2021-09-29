local packer = require("packer")
packer.use({
	"kyazdani42/nvim-tree.lua",
	requires = { "kyazdani42/nvim-web-devicons", { "folke/which-key.nvim" } },
	config = function()
		require("nvim-tree").setup({
			auto_open = 1,
			auto_close = 0,
			quit_on_open = 0,
			add_trailing = 1,
			lsp_diagnostics = 1,

			disable_netrw = 0,
			hijack_netrw = 0,
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
