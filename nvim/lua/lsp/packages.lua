local packer = require("packer")

-- config object

packer.use({
	"neovim/nvim-lspconfig",
	requires = {
		"nvim-telescope/telescope.nvim",
		"folke/which-key.nvim",
		"lvimuser/lsp-inlayhints.nvim",
	},
	config = function()
		require("lsp-inlayhints").setup()
		-- Language configs
		require("languages.cpp")
		require("languages.dart")
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
		require("languages.swift")
		require("languages.ts")
		require("languages.vim")
		require("languages.yaml")
	end,
})
