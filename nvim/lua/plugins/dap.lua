return {
	{
		"rcarriga/nvim-dap-ui",
		keys = {
			{ "<leader>zb", desc = "Toggle breakpoint" },
			{ "<leader>zc", desc = "Start/Continue debugger" },
			{ "<leader>zi", desc = "Step into" },
			{ "<leader>zo", desc = "Step out" },
			{ "<leader>zn", desc = "Step over" },
			{ "<leader>zr", desc = "Restart debugger" },
			{ "<leader>zx", desc = "Terminate debugger" },
			{ "<leader>zt", desc = "Toggle debugger UI" },
			{ "<leader>zl", desc = "List breakpoints" },
		},
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-lua/plenary.nvim",
			"theHamsta/nvim-dap-virtual-text",
			"abayomi185/nvim-dap-probe-rs",

			-- Languages
			{ "julianolf/nvim-dap-lldb", opts = { codelldb_path = "/opt/homebrew/opt/llvm/bin/lldb-dap" } },
			{ "leoluz/nvim-dap-go", opts = {} },
		},
		config = function()
			require("nvim-dap-virtual-text").setup({
				virt_text_win_col = 90,
				highlight_changed_variables = true,
			})
			local dap = require("dap")
			local dapui = require("dapui")

			vim.fn.sign_define("DapBreakpoint", { text = "⏺", texthl = "", linehl = "", numhl = "" })
			vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "", linehl = "", numhl = "" })
			vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "", linehl = "", numhl = "" })
			vim.fn.sign_define("DapLogPoint", { text = "", texthl = "", linehl = "", numhl = "" })
			-- setup
			require("dapui").setup()
			vim.keymap.set("n", "<leader>zb", dap.toggle_breakpoint, { desc = "Toggle breakpoint", noremap = true })
			vim.keymap.set("n", "<leader>zc", dap.continue, { desc = "Start/Continue debugger", noremap = true })
			vim.keymap.set("n", "<leader>zi", dap.step_into, { desc = "Step into", noremap = true })
			vim.keymap.set("n", "<leader>zo", dap.step_out, { desc = "Step out", noremap = true })
			vim.keymap.set("n", "<leader>zn", dap.step_over, { desc = "Step over", noremap = true })
			vim.keymap.set("n", "<leader>zr", dap.restart, { desc = "Restart debugger", noremap = true })
			vim.keymap.set("n", "<leader>zx", dap.terminate, { desc = "Terminate debugger", noremap = true })
			vim.keymap.set("n", "<leader>zt", dapui.toggle, { desc = "Toggle debugger UI", noremap = true })
			vim.keymap.set("n", "<leader>zl", dap.list_breakpoints, { desc = "List breakpoints", noremap = true })
		end,
	},
}
