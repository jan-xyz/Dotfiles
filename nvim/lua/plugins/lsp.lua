return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"folke/which-key.nvim",
			"nvim-lua/plenary.nvim",
			{ "lvimuser/lsp-inlayhints.nvim", opts = {} },

			-- Language dependencies
			{ "folke/neodev.nvim", opts = {} },
		},
		config = function()
			require("languages.bash").setup()
			require("languages.cpp").setup()
			require("languages.dart").setup()
			require("languages.docker").setup()
			require("languages.go").setup()
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
	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			local lsp = require("lsp.config")
			require("null-ls").setup({
				on_attach = lsp.on_attach,
				sources = {

					-- Diagnostics
					require("null-ls").builtins.diagnostics.buf,
					require("null-ls").builtins.diagnostics.markdownlint,
					-- Formatting
					require("null-ls").builtins.formatting.shfmt,
					require("null-ls").builtins.formatting.markdownlint,
				},
			})
		end,
	},
}
