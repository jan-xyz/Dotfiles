local packer = require("packer")

-- Debugger
packer.use({
	"rcarriga/nvim-dap-ui",
	requires = {
		"mfussenegger/nvim-dap",
		"folke/which-key.nvim",
	},
	config = function()
		-- setup
		require("dapui").setup()
		-- keymap
		local wk = require("which-key")
		wk.register({
			d = {
				name = "Debugger", -- optional group name
				b = { "<cmd>lua require'dap'.toggle_breakpoint()<CR>", "Toggle breakpoint", noremap = true },
				c = { "<cmd>lua require'dap'.continue()<CR>", "Start/continue", noremap = true },
				i = { "<cmd>lua require'dap'.step_into()<CR>", "Step into", noremap = true },
				u = { "<cmd>lua require'dap'.step_out()<CR>", "Step out", noremap = true },
				o = { "<cmd>lua require'dap'.step_over()<CR>", "Step over", noremap = true },
				r = { "<cmd>lua require'dap'.repl.open()<CR>", "REPL", noremap = true },
				t = { "<cmd>lua require'dapui'.toggle()<CR>", "Toggle UI", noremap = true },
				p = {
					"<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
					"Set log point",
					noremap = true,
				},
				e = {
					"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
					"set conditional break point",
					noremap = true,
				},
				l = { "<cmd>lua require'dap'.list_breakpoints()<CR>", "List breakpoints", noremap = true },
			},
		}, {
			mode = "n",
			prefix = "<leader>",
		})

		wk.register({
			c = { "<cmd>lua require'dap'.continue()<CR>", "Start/continue", noremap = true },
		}, {
			mode = "v",
			prefix = "<leader>",
		})

		-- add autocompletion to DAP repl
		vim.cmd([[autocmd FileType dap-repl lua require('dap.ext.autocompl').attach()]])
		-- Support launch.json (Do after setting the default values)
		require("dap.ext.vscode").load_launchjs()
	end,
})
packer.use({
	"theHamsta/nvim-dap-virtual-text",
	requires = { "mfussenegger/nvim-dap" },
	config = function()
		require("nvim-dap-virtual-text").setup({
			virt_text_win_col = 90,
			highlight_changed_variables = true,
		})
	end,
})
packer.use({
	"nvim-telescope/telescope-dap.nvim",
	requires = "mfussenegger/nvim-dap",
	config = function()
		-- Telescop integration
		require("telescope").load_extension("dap")
	end,
})
