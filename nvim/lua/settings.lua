-- global options
vim.o.hidden = true -- allow hidden buffers
vim.o.signcolumn = "yes" -- Show signs in number column (e.g. errors and warnings)
vim.o.list = true -- Show tabs, spaces and line ends
vim.o.listchars = "tab:⟶ " -- Set list characters
vim.o.mouse = "a" -- Enable all mouse support
vim.o.termguicolors = true -- enable 24-bit colors

-- window options
vim.wo.number = true -- Add line numbers
vim.wo.colorcolumn = "80" -- Show a line at the 80th character

-- buffer options
vim.bo.expandtab = true -- Expand tabs to spaces per default
vim.bo.shiftwidth = 2 -- Set default auto-indent width
vim.bo.softtabstop = 2 -- Set default virtual tabstop width
vim.bo.tabstop = 2 -- Set default tabstop width

-- set Python env
vim.g.python_host_prog = "/usr/local/bin/python3"
vim.g.python3_host_prog = "/usr/local/bin/python3"

vim.opt.completeopt = "menuone,noinsert,noselect"

-- highlight on yank
vim.cmd([[au TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=150, on_visual=true}]])

-- move with j and k wrapped lines
vim.api.nvim_set_keymap("n", "j", "gj", { noremap = true })
vim.api.nvim_set_keymap("n", "<down>", "gj", { noremap = true })
vim.api.nvim_set_keymap("n", "k", "gk", { noremap = true })
vim.api.nvim_set_keymap("n", "<up>", "gk", { noremap = true })

vim.api.nvim_set_keymap("v", "j", "gj", { noremap = true })
vim.api.nvim_set_keymap("v", "<down>", "gj", { noremap = true })
vim.api.nvim_set_keymap("v", "k", "gk", { noremap = true })
vim.api.nvim_set_keymap("v", "<up>", "gk", { noremap = true })
