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
			local dap = require("dap")
			local dapui = require("dapui")
			require("which-key").register({ p = { name = "Perform debug actions" } })
			vim.keymap.set("n", "<leader>pb", dap.toggle_breakpoint, { desc = "Toggle breakpoint", noremap = true })
			vim.keymap.set("n", "<leader>pc", dap.continue, { desc = "Start/Continue debugger", noremap = true })
			vim.keymap.set("n", "<leader>pi", dap.step_into, { desc = "Step into", noremap = true })
			vim.keymap.set("n", "<leader>po", dap.step_out, { desc = "Step out", noremap = true })
			vim.keymap.set("n", "<leader>pn", dap.step_over, { desc = "Step over", noremap = true })
			vim.keymap.set("n", "<leader>pr", dap.restart, { desc = "Restart debugger", noremap = true })
			vim.keymap.set("n", "<leader>px", dap.terminate, { desc = "Terminate debugger", noremap = true })
			vim.keymap.set("n", "<leader>pt", dapui.toggle, { desc = "Toggle debugger UI", noremap = true })
			vim.keymap.set("n", "<leader>pl", dap.list_breakpoints, { desc = "List breakpoints", noremap = true })

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
