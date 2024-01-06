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
			"nvim-neotest/neotest-python",
			"rouge8/neotest-rust",
			"stevanmilic/neotest-scala",
			"mrcjkb/neotest-haskell",
			-- UX
			{
				"andythigpen/nvim-coverage",
				dependencies = "nvim-lua/plenary.nvim",
			},
		},
		config = function()
			local nt = require("neotest")
			local cov = require("coverage")

			cov.setup()
			---@diagnostic disable-next-line: missing-fields
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
					require("neotest-python"),
					require("neotest-haskell")({
						build_tools = { "stack", "cabal" },
						frameworks = {
							"hspec",
							-- The other two are disabled because it kept running tests with
							-- tasty and the tests crashed.
							-- "tasty",
							-- "sydtest",
						},
					}),
				},
				---@diagnostic disable-next-line: missing-fields
				quickfix = {
					enabled = false,
				},
				highlights = {
					adapter_name = "Title",
					border = "VertSplit",
					dir = "Directory",
					expand_marker = "Normal",
					failed = "DiagnosticError",
					file = "Normal",
					focused = "Underline",
					indent = "Normal",
					marked = "Bold",
					namespace = "Title",
					passed = "DiagnosticOK",
					running = "DiagnosticInfo",
					select_win = "Title",
					skipped = "DiagnosticWarn",
					target = "NeotestTarget",
					test = "String",
					unknown = "Normal",
					watching = "DiagnosticWarn",
				},
			})

			local run_all = function()
				nt.run.run(vim.fn.getcwd())
				cov.load(true)
			end

			local run_all_in_file = function()
				nt.run.run(vim.fn.expand("%"))
			end

			local debug_nearest_test = function()
				---@diagnostic disable-next-line: missing-fields
				nt.run.run({ strategy = "dap" })
			end

			local watch_current_file = function()
				require("neotest").watch.toggle(vim.fn.expand("%"))
			end

			vim.keymap.set("n", "tn", nt.run.run, { desc = "Run nearest test", noremap = true })
			vim.keymap.set("n", "tl", nt.run.run_last, { desc = "Run last test", noremap = true })
			vim.keymap.set("n", "to", nt.output.open, { desc = "Show output from closest test", noremap = true })
			vim.keymap.set("n", "ts", nt.summary.toggle, { desc = "Toggle or focus the test summary", noremap = true })
			vim.keymap.set("n", "ta", run_all, { desc = "Run all tests", noremap = true })
			vim.keymap.set("n", "tf", run_all_in_file, { desc = "Run all tests in the current file", noremap = true })
			vim.keymap.set("n", "td", debug_nearest_test, { desc = "Run nearest test with debugger", noremap = true })
			vim.keymap.set("n", "tw", watch_current_file, { desc = "Toggle watching the current file", noremap = true })
		end,
	},
}
