local packer = require("packer")

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
		require("languages.swift")
		require("languages.ts")
		require("languages.vim")
		require("languages.yaml")
	end,
})
