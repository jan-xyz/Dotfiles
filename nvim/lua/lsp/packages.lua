local packer = require("packer")

-- Symbols config
packer.use({
	"liuchengxu/vista.vim",
	config = function()
		vim.g.vista_default_executive = "nvim_lsp"
	end,
})

-- config object

packer.use({
	"neovim/nvim-lspconfig",
	config = function()
		-- Language configs
		require("languages.cpp")
		require("languages.docker")
		require("languages.go")
		require("languages.julia")
		require("languages.kotlin")
		require("languages.lua")
		require("languages.misc")
		require("languages.python")
		require("languages.r")
		require("languages.rust")
		require("languages.scala")
		require("languages.vim")
		require("languages.yaml")
	end,
})
packer.use("nvim-lua/lsp_extensions.nvim")

-- TODO: switch back to `lua-nvim/completion-nvim once that repo is fixed
packer.use({
	"rafaelsq/completion-nvim",
	branch = "changeHandlerSignature",
})
packer.use("simrat39/rust-tools.nvim") -- LSP server extensions for Rust
packer.use("folke/lua-dev.nvim") -- LSP server extensions for Lua
-- TODO: switch back to `glepnir/lspsaga.nvim once that repo is fixed
packer.use("tami5/lspsaga.nvim")
