return {
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"folke/which-key.nvim",
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
				p = {
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

			-- rust/lldb config
			dap.adapters.lldb = {
				type = "executable",
				command = "/opt/homebrew/opt/llvm/bin/lldb-vscode",
				name = "lldb",
			}
			dap.configurations.rust = {
				{
					name = "Debug binary",
					type = "lldb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
					args = {},

					-- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
					--
					--    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
					--
					-- Otherwise you might get the following error:
					--
					--    Error on launch: Failed to attach to the target process
					--
					-- But you should be aware of the implications:
					-- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
					runInTerminal = false,
				},
				{
					type = "lldb",
					request = "launch",
					name = "Debug unit test",
					cargo = {
						args = {
							"test",
							"--no-run",
						},
						filter = {
							name = "libthat",
							kind = "lib",
						},
					},
					args = {},
					cwd = "${workspaceFolder}",
				},
			}
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
	{
		"leoluz/nvim-dap-go",
		dependencies = {
			"rcarriga/nvim-dap-ui",
		},
		opts = {},
	},
}
