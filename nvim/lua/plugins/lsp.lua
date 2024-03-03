return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
			{
				"aznhe21/actions-preview.nvim",
				opts = {
					telescope = {
						sorting_strategy = "ascending",
						layout_strategy = "vertical",
						layout_config = {
							width = 0.8,
							height = 0.9,
							prompt_position = "top",
							preview_cutoff = 20,
							preview_height = function(_, _, max_lines)
								return max_lines - 15
							end,
						},
					},
				},
			},
			{ "kosayoda/nvim-lightbulb", opts = { sign = { text = "" }, autocmd = { enabled = true } } },
			{ "lvimuser/lsp-inlayhints.nvim", opts = {} },

			-- Language dependencies
			{
				"folke/neodev.nvim",
				opts = {
					library = { plugins = { "neotest" }, types = true },
				},
			},
		},
		config = function()
			require("languages.bash").setup()
			require("languages.cpp").setup()
			require("languages.dart").setup()
			require("languages.docker").setup()
			require("languages.go").setup()
			require("languages.haskell").setup()
			require("languages.jsonnet").setup()
			require("languages.julia").setup()
			require("languages.kotlin").setup()
			require("languages.lua").setup()
			require("languages.proto").setup()
			require("languages.python").setup()
			require("languages.r").setup()
			require("languages.rust").setup()
			require("languages.scala").setup()
			require("languages.swift").setup()
			require("languages.ts").setup()
			require("languages.vim").setup()
			require("languages.yaml").setup()
		end,
	},
}
