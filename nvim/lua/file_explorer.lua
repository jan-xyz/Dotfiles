local wk = require("which-key")
wk.register({
	e = { "<cmd>NvimTreeToggle<CR>", "toggle file explorer", noremap = true },
	f = { "<cmd>NvimTreeFindFile<CR>", "find file in file explorer", noremap = true },
}, {
	prefix = "t",
})

vim.g.nvim_tree_auto_open = 0
vim.g.nvim_tree_auto_close = 0
vim.g.nvim_tree_quit_on_open = 0
vim.g.nvim_tree_add_trailing = 1
vim.g.nvim_tree_lsp_diagnostics = 1

vim.g.nvim_tree_disable_netrw = 0
vim.g.nvim_tree_hijack_netrw = 0
