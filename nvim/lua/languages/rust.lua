local lsp = require("lsp")
local dap = require("dap")

-- LSP config
vim.cmd(
	[[autocmd InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *.rs :lua require'lsp_extensions'.inlay_hints{ prefix = ' » ', highlight = "NonText", enabled = {"ChainingHint"} }]]
)
require("rust-tools").setup({
	server = {
		on_attach = lsp.on_attach,
		settings = {
			assist = {
				importGranularity = "item",
				importPrefix = "by_self",
				importEnforceGranularity = true,
			},
		},
	},
})

-- DAP config
dap.adapters.lldb = {
	type = "executable",
	command = "/usr/local/Cellar/llvm/12.0.1/bin/lldb-vscode",
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
