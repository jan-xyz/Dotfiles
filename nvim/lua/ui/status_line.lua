local packer = require("packer")

packer.use({
	"nvim-lualine/lualine.nvim",
	requires = { "kyazdani42/nvim-web-devicons", "arkav/lualine-lsp-progress" },
	config = function()
		require("lualine").setup({
			options = {
				globalstatus = true,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { { "filename", path = 1 } },
				lualine_c = {},
				lualine_x = { "lsp_progress" },
				lualine_y = { "diagnostics" },
				lualine_z = { "filetype" },
			},
			extensions = { "toggleterm", "nvim-tree", "aerial" },
		})
	end,
})
