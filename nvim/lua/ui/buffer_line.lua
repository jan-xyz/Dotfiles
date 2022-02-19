local packer = require("packer")
packer.use({
	"akinsho/nvim-bufferline.lua",
	requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" },
	config = function()
		require("bufferline").setup({
			options = {
				diagnostics = "nvim_lsp",
				offsets = { { filetype = "NvimTree", text = "File Explorer", text_align = "left" } },
				close_command = "Bdelete! %d", -- comes from moll/vim-bbye
				right_mouse_command = "Bdelete! %d", -- comes from moll/vim-bbye
			},
		})
	end,
})
