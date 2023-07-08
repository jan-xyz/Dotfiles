return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"folke/which-key.nvim",
			"nvim-lua/plenary.nvim",
			"lvimuser/lsp-inlayhints.nvim",

			-- Language dependencies
			{ "folke/neodev.nvim", opts = {} },
		},
		config = function()
			require("languages.bash").setup()
			require("languages.cpp").setup()
			require("languages.dart").setup()
			require("languages.docker").setup()
			require("languages.go").setup()
			--require("languages.julia")
			--require("languages.kotlin")
			require("languages.lua").setup()
			--require("languages.misc")
			--require("languages.proto")
			--require("languages.python")
			--require("languages.r")
			--require("languages.rust")
			--require("languages.scala")
			--require("languages.swift")
			--require("languages.ts")
			--require("languages.vim")
			--require("languages.yaml")
		end,
	},
}
