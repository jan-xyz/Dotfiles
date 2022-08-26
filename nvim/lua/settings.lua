-- global options
vim.opt.hidden = true -- allow hidden buffers
vim.opt.signcolumn = "yes" -- Show signs in number column (e.g. errors and warnings)
vim.opt.list = true -- Show tabs, spaces and line ends
vim.opt.listchars = "tab:⟶ " -- Set list characters
vim.opt.mouse = "a" -- Enable all mouse support
vim.opt.termguicolors = true -- enable 24-bit colors
vim.opt.splitbelow = true -- new window below on horizontal split
vim.opt.splitright = true -- new window to the right on vertical split
vim.opt.completeopt = "menuone,noinsert,noselect" -- set the completion methods
vim.opt.foldmethod = "expr" -- set on what to fold
vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- set the function used for folding
vim.opt.foldenable = false -- do not fold on buffer opening
vim.opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal" -- setting session options

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

-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150, on_visual = true })
	end,
	buffer = 0,
})

-- move with j and k wrapped lines
vim.api.nvim_set_keymap("n", "j", "gj", { noremap = true })
vim.api.nvim_set_keymap("n", "<down>", "gj", { noremap = true })
vim.api.nvim_set_keymap("n", "k", "gk", { noremap = true })
vim.api.nvim_set_keymap("n", "<up>", "gk", { noremap = true })

vim.api.nvim_set_keymap("v", "j", "gj", { noremap = true })
vim.api.nvim_set_keymap("v", "<down>", "gj", { noremap = true })
vim.api.nvim_set_keymap("v", "k", "gk", { noremap = true })
vim.api.nvim_set_keymap("v", "<up>", "gk", { noremap = true })
