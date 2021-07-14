local wk = require("which-key")
wk.register({
	e = { "<cmd>NvimTreeToggle<CR>", "toggle file explorer", noremap = true },
}, { prefix = "<leader>" })

vim.g.nvim_tree_auto_open = 1
vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_quit_on_open = 0
vim.g.nvim_tree_add_trailing = 1
vim.g.nvim_tree_lsp_diagnostics = 1
