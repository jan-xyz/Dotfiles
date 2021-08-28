local packer = require("packer")
packer.use({ "voldikss/vim-floaterm" })

local wk = require("which-key")

-- keymaps in normal mode
wk.register({
	t = { "<cmd>FloatermToggle<CR>", "Toggle terminal", noremap = true },
}, { prefix = "<leader>" })

-- keymaps in terminal mode
wk.register({
	t = { "<cmd>FloatermToggle<CR>", "Toggle terminal", noremap = true },
}, {
	mode = "t",
	prefix = "<leader>",
})