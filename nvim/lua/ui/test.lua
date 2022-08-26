local packer = require("packer")

packer.use({
	"nvim-neotest/neotest",
	requires = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-neotest/neotest-go",
		"nvim-neotest/neotest-plenary",
		"rouge8/neotest-rust",
	},
	config = function()
		local wk = require("which-key")
		local nt = require("neotest")

		nt.setup({
			adapters = {
				require("neotest-go"),
				require("neotest-rust"),
				require("neotest-plenary"),
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
