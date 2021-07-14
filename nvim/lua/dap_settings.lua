local dap = require("dap")

-- keymap
local wk = require("which-key")
wk.register({
	d = {
		name = "debugger", -- optional group name
		b = { "<cmd>lua require'dap'.toggle_breakpoint()<CR>", "toggle breakpoint", noremap = true },
		c = { "<cmd>lua require'dap'.continue()<CR>", "start/continue", noremap = true },
		i = { "<cmd>lua require'dap'.step_into()<CR>", "step into", noremap = true },
		u = { "<cmd>lua require'dap'.step_out()<CR>", "step out", noremap = true },
		o = { "<cmd>lua require'dap'.step_over()<CR>", "step over", noremap = true },
		r = { "<cmd>lua require'dap'.repl.open()<CR>", "REPL", noremap = true },
		p = {
			"<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
			"set log point",
			noremap = true,
		},
		e = {
			"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
			"set conditional break point",
			noremap = true,
		},
		l = { "<cmd>lua require'dap'.list_breakpoints()<CR>", "list breakpoints", noremap = true },
	},
}, {
	prefix = "<leader>",
})

-- add autocompletion to DAP repl
vim.cmd([[autocmd FileType dap-repl lua require('dap.ext.autocompl').attach()]])

-- inline DAP informatino during debugging
vim.g.dap_virtual_text = true

-- Telescop integration
require("telescope").load_extension("dap")

-- Go support
dap.adapters.go = function(callback, config)
	local handle
	local pid_or_err
	local port = 38697
	handle, pid_or_err = vim.loop.spawn("dlv", {
		args = { "dap", "-l", "127.0.0.1:" .. port },
		detached = true,
	}, function(code)
		handle:close()
		print("Delve exited with exit code: " .. code)
	end)
	-- Wait 100ms for delve to start
	vim.defer_fn(function()
		--dap.repl.open()
		callback({ type = "server", host = "127.0.0.1", port = port })
	end, 100)

	--callback({type = "server", host = "127.0.0.1", port = port})
end
-- Go default launch configs
dap.configurations.go = {
	{
		type = "go",
		name = "Debug current file",
		request = "launch",
		program = "${file}",
	},
	{
		type = "go",
		name = "Debug tests in current dir", -- configuration for debugging test files
		request = "launch",
		mode = "test",
		program = "${fileDirname}",
	},
}

-- Support launch.json (Do after setting the default values)
require("dap.ext.vscode").load_launchjs()
