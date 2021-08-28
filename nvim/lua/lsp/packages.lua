local packer = require("packer")

-- Symbols config
packer.use({
	"liuchengxu/vista.vim",
	config = function()
		vim.g.vista_default_executive = "nvim_lsp"
	end,
})

-- config object

packer.use("neovim/nvim-lspconfig")
packer.use("nvim-lua/lsp_extensions.nvim")
packer.use("nvim-lua/completion-nvim")
packer.use("simrat39/rust-tools.nvim") -- LSP server extensions for Rust
packer.use("folke/lua-dev.nvim") -- LSP server extensions for Lua
packer.use("glepnir/lspsaga.nvim")
