vim.pack.add({ "https://github.com/rgroli/other.nvim" })

local files = require("mini.files")
files.setup({
	-- Customization of explorer windows
	windows = {
		-- Whether to show preview of file/directory under cursor
		preview = true,
	},
})
local pick = require("mini.pick")
pick.setup()
vim.ui.select = pick.ui_select

local extra = require("mini.extra")
extra.setup()

local current_file = function()
	MiniFiles.open(vim.api.nvim_buf_get_name(0))
end

local old_files = function()
	extra.pickers.oldfiles({ current_dir = true })
end

local km = vim.keymap
-- inspired by helix mapping: https://docs.helix-editor.com/keymap.html#space-mode
km.set("n", "<leader>f", pick.builtin.files, { desc = "Open File Picker" })
km.set("n", "<leader>e", files.open, { desc = "Toggle or focus explorer" })
km.set("n", "<leader>E", current_file, { desc = "Focus current file in explorer" })
km.set("n", "<leader>b", pick.builtin.buffers, { desc = "Open buffer picker" })
km.set("n", "<leader>/", pick.builtin.grep_live, { desc = "Global search" })
-- additional pickers
km.set("n", "<leader>o", old_files, { desc = "Open recent file picker" })

require("other-nvim").setup({
	mappings = {
		-- builtin mappings
		"golang",
		"python",
		"react",
		"rust",
		-- Lua
		{
			context = "test",
			pattern = "lua/(.*)%.lua",
			target = "tests/%1_spec.lua",
		},
		{
			context = "implementation",
			pattern = "tests/(.*)_spec%.lua",
			target = "lua/%1.lua",
		},
		-- Go
		{ context = "implementation", pattern = "(.*)_example_test%.go$", target = "%1.go" },
		{
			context = "test",
			pattern = "(.*)_example_test%.go$",
			target = "%1_test.go",
		},
		{
			context = "example",
			pattern = "(.*)%.go$",
			target = "%1_example_test.go",
		},
		{
			context = "example",
			pattern = "(.*)_test%.go$",
			target = "%1_example_test.go",
		},
		{ context = "sum file", pattern = "go%.mod", target = "go.sum" },
		{ context = "mod file", pattern = "go%.sum", target = "go.mod" },
		-- Kotlin/Java/Scala
		{
			context = "test",
			pattern = "(.*)/src/main/(.*)/(.*)%.(.*)$",
			target = "%1/src/test/%2/%3Test.%4",
		},
		{
			context = "implementation",
			pattern = "(.*)/src/test/(.*)/(.*)Test%.(.*)$",
			target = "%1/src/main/%2/%3.%4",
		},
	},
})
km.set("n", "ga", require("other-nvim").open, { desc = "Goto alternate file" })
