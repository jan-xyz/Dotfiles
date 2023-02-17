local packer = require("packer")

packer.use({
	"nvim-neotest/neotest",
	requires = {
		-- General
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"antoinemadec/FixCursorHold.nvim",
		-- Languages
		"nvim-neotest/neotest-go",
		"nvim-neotest/neotest-plenary",
		"rouge8/neotest-rust",
		"stevanmilic/neotest-scala",
	},
	config = function()
		local wk = require("which-key")
		local nt = require("neotest")

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

		wk.register({
			name = "Run Tests",
			n = {
				nt.run.run,
				"Nearest",
				noremap = true,
			},
			l = {
				nt.run.run_last,
				"Last",
				noremap = true,
			},
			a = {
				function()
					nt.run.run(vim.fn.getcwd())
				end,
				"All",
				noremap = true,
			},
			o = {
				nt.output.open,
				"Show output",
				noremap = true,
			},
			f = {
				function()
					nt.run.run(vim.fn.expand("%"))
				end,
				"All in file",
				noremap = true,
			},
			d = {
				function()
					nt.run.run({ strategy = "dap" })
				end,
				"Debug test",
				noremap = true,
			},
			s = {
				nt.summary.toggle,
				"Test summary",
				noremap = true,
			},
		}, {
			prefix = "t",
		})
	end,
})

packer.use({
	"andythigpen/nvim-coverage",
	requires = "nvim-lua/plenary.nvim",
	config = function()
		require("coverage").setup()
	end,
})
