local packer = require("packer")
packer.use({
	"akinsho/nvim-bufferline.lua",
	requires = "kyazdani42/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			options = {
				diagnostics = "nvim_lsp",
				offsets = { { filetype = "NvimTree", text = "File Explorer", text_align = "left" } },
			},
		})
	end,
})
