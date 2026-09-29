vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-neotest/nvim-nio",
	{ src = "https://github.com/nvim-neotest/neotest", version = vim.version.range("*") },
	"https://github.com/nvim-neotest/neotest-go",
	"https://github.com/nvim-neotest/neotest-plenary",
	"https://github.com/nvim-neotest/neotest-python",
	"https://github.com/rouge8/neotest-rust",
	"https://github.com/stevanmilic/neotest-scala",
	"https://github.com/mrcjkb/neotest-haskell",
	"https://github.com/andythigpen/nvim-coverage",
})

local nt = require("neotest")
local cov = require("coverage")

local neotest_ns = vim.api.nvim_create_namespace("neotest")
vim.diagnostic.config({
	virtual_text = {
		format = function(diagnostic)
			local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
			return message
		end,
	},
}, neotest_ns)

cov.setup()
---@diagnostic disable-next-line: missing-fields
nt.setup({
	adapters = {
		require("neotest-go")({
			recursive_run = true,
			experimental = {
				test_table = true,
			},
			args = { "-race", "-coverprofile=coverage.out" },
		}),
		require("neotest-plenary"),
		require("neotest-rust"),
		require("neotest-scala"),
		require("neotest-python"),
		require("neotest-haskell")({
			build_tools = { "stack", "cabal" },
			frameworks = {
				"hspec",
				-- The other two are disabled because it kept running tests with
				-- tasty and the tests crashed.
				-- "tasty",
				-- "sydtest",
			},
		}),
	},
	---@diagnostic disable-next-line: missing-fields
	quickfix = {
		enabled = false,
	},
	highlights = {
		adapter_name = "Title",
		border = "VertSplit",
		dir = "Directory",
		expand_marker = "Normal",
		failed = "DiagnosticError",
		file = "Normal",
		focused = "Underline",
		indent = "Normal",
		marked = "Bold",
		namespace = "Title",
		passed = "DiagnosticOK",
		running = "DiagnosticInfo",
		select_win = "Title",
		skipped = "DiagnosticWarn",
		target = "NeotestTarget",
		test = "String",
		unknown = "Normal",
		watching = "DiagnosticWarn",
	},
})

local run_all = function()
	nt.run.run(vim.fn.getcwd())
	cov.load(true)
end

local run_all_in_file = function()
	nt.run.run(vim.fn.expand("%"))
end

local debug_nearest_test = function()
	---@diagnostic disable-next-line: missing-fields
	nt.run.run({ strategy = "dap" })
end

local watch_current_file = function()
	require("neotest").watch.toggle(vim.fn.expand("%"))
end

vim.keymap.set("n", "<leader>tn", nt.run.run, { desc = "Run nearest test" })
vim.keymap.set("n", "<leader>tl", nt.run.run_last, { desc = "Run last test" })
vim.keymap.set("n", "<leader>to", nt.output.open, { desc = "Show output from closest test" })
vim.keymap.set("n", "<leader>ts", nt.summary.toggle, { desc = "Toggle or focus the test summary" })
vim.keymap.set("n", "<leader>ta", run_all, { desc = "Run all tests" })
vim.keymap.set("n", "<leader>tf", run_all_in_file, { desc = "Run all tests in the current file" })
vim.keymap.set("n", "<leader>td", debug_nearest_test, { desc = "Run nearest test with debugger" })
vim.keymap.set("n", "<leader>tw", watch_current_file, { desc = "Toggle watching the current file" })
