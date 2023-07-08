return {
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"folke/which-key.nvim",
			{ "leoluz/nvim-dap-go", opts = {} },
		},
		config = function()
			vim.fn.sign_define("DapBreakpoint", { text = "⏺", texthl = "", linehl = "", numhl = "" })
			vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "", linehl = "", numhl = "" })
			vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "", linehl = "", numhl = "" })
			vim.fn.sign_define("DapLogPoint", { text = "", texthl = "", linehl = "", numhl = "" })
			-- setup
			require("dapui").setup()
			-- keymap
			local wk = require("which-key")
			local dap = require("dap")
			local dapui = require("dapui")
			wk.register({
				d = {
					name = "Debugger", -- optional group name
					b = { dap.toggle_breakpoint, "Toggle breakpoint", noremap = true },
					c = { dap.continue, "Start/continue", noremap = true },
					i = { dap.step_into, "Step into", noremap = true },
					u = { dap.step_out, "Step out", noremap = true },
					o = { dap.step_over, "Step over", noremap = true },
					r = { dap.repl.open, "REPL", noremap = true },
					t = { dapui.toggle, "Toggle UI", noremap = true },
					p = {
						function()
							dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
						end,
						"Set log point",
						noremap = true,
					},
					e = {
						function()
							dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
						end,
						"set conditional break point",
						noremap = true,
					},
					l = { dap.list_breakpoints, "List breakpoints", noremap = true },
				},
			}, {
				mode = "n",
				prefix = "<leader>",
			})

			-- Support launch.json (Do after setting the default values)
			require("dap.ext.vscode").load_launchjs()
		end,
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		dependencies = { "mfussenegger/nvim-dap" },
		config = function()
			require("nvim-dap-virtual-text").setup({
				virt_text_win_col = 90,
				highlight_changed_variables = true,
			})
		end,
	},
	{
		"nvim-telescope/telescope-dap.nvim",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			-- Telescop integration
			require("telescope").load_extension("dap")
		end,
	},
}
