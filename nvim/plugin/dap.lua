		vim.pack.add({
			"https://github.com/rcarriga/nvim-dap-ui",
			"https://github.com/mfussenegger/nvim-dap",
			"https://github.com/nvim-lua/plenary.nvim",
			"https://github.com/theHamsta/nvim-dap-virtual-text",
			"https://github.com/abayomi185/nvim-dap-probe-rs",
			"https://github.com/nvim-neotest/nvim-nio",

			-- Languages
			"https://github.com/julianolf/nvim-dap-lldb",
			"https://github.com/leoluz/nvim-dap-go",
		})

		vim.fn.sign_define("DapBreakpoint", { text = "⏺", texthl = "", linehl = "", numhl = "" })
		vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "", linehl = "", numhl = "" })
		vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "", linehl = "", numhl = "" })
		vim.fn.sign_define("DapLogPoint", { text = "", texthl = "", linehl = "", numhl = "" })
		-- setup
		local dap = require("dap")
		local dapui = require("dapui")
		dapui.setup()
		require("dap-lldb").setup({ codelldb_path = "/opt/homebrew/opt/llvm/bin/lldb-dap" })
		require("dap-go").setup({})
		require("nvim-dap-virtual-text").setup({
			virt_text_win_col = 90,
			highlight_changed_variables = true,
		})
		vim.keymap.set("n", "<leader>zb", dap.toggle_breakpoint, { desc = "Toggle breakpoint", noremap = true })
		vim.keymap.set("n", "<leader>zc", dap.continue, { desc = "Start/Continue debugger", noremap = true })
		vim.keymap.set("n", "<leader>zi", dap.step_into, { desc = "Step into", noremap = true })
		vim.keymap.set("n", "<leader>zo", dap.step_out, { desc = "Step out", noremap = true })
		vim.keymap.set("n", "<leader>zn", dap.step_over, { desc = "Step over", noremap = true })
		vim.keymap.set("n", "<leader>zr", dap.restart, { desc = "Restart debugger", noremap = true })
		vim.keymap.set("n", "<leader>zx", dap.terminate, { desc = "Terminate debugger", noremap = true })
		vim.keymap.set("n", "<leader>zt", dapui.toggle, { desc = "Toggle debugger UI", noremap = true })
		vim.keymap.set("n", "<leader>zl", dap.list_breakpoints, { desc = "List breakpoints", noremap = true })
