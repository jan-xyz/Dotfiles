return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			-- General
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-neotest/neotest-plenary",
			-- Languages
			"nvim-neotest/neotest-go",
			"rouge8/neotest-rust",
			"stevanmilic/neotest-scala",
			-- UX
			"andythigpen/nvim-coverage",
			"folke/which-key.nvim",
		},
		config = function()
			local wk = require("which-key")
			local nt = require("neotest")
			local cov = require("coverage")

			cov.setup()
			nt.setup({
				adapters = {
					require("neotest-go")({
						experimental = {
							test_table = true,
						},
						args = { "-race", "-coverprofile=coverage.out" },
					}),
					require("neotest-plenary"),
					require("neotest-rust"),
					require("neotest-scala"),
				},
				quickfix = {
					enabled = false,
				},
			})

			wk.register({ t = { name = "Run Test(s)" } })
			vim.keymap.set("n", "tn", nt.run.run, { desc = "Nearest", noremap = true })
			vim.keymap.set("n", "tl", nt.run.run_last, { desc = "Last", noremap = true })
			vim.keymap.set("n", "to", nt.output.open, { desc = "Show output", noremap = true })
			vim.keymap.set("n", "ts", nt.summary.toggle, { desc = "Test summary", noremap = true })

			vim.keymap.set("n", "ta", function()
				nt.run.run(vim.fn.getcwd())
				cov.load(true)
			end, { desc = "All", noremap = true })

			vim.keymap.set("n", "tf", function()
				nt.run.run(vim.fn.expand("%"))
			end, { desc = "All in file", noremap = true })

			vim.keymap.set("n", "td", function()
				nt.run.run({ strategy = "dap" })
			end, { desc = "Debug", noremap = true })
		end,
	},
	{
		"andythigpen/nvim-coverage",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("coverage").setup()
		end,
	},
}
