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
vim.opt.foldenable = true -- set wether folding is enabled on buffer opening
vim.opt.foldlevelstart = 99 -- set the initial fold level of a new buffer (0=all,99=none)
vim.opt.foldcolumn = "auto:5" -- how many fold levels are included in the gutter
vim.opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal" -- setting session options
vim.opt.scrolloff = 4 -- Minimum number of screen lines to keep above and below the cursor

-- window options
vim.wo.number = true -- Add line numbers
vim.wo.colorcolumn = "80" -- Show a line at the 80th character

-- buffer options
vim.bo.expandtab = true -- Expand tabs to spaces per default
vim.bo.shiftwidth = 2 -- Set default auto-indent width
vim.bo.softtabstop = 2 -- Set default virtual tabstop width
vim.bo.tabstop = 2 -- Set default tabstop width

-- set Python env
vim.g.python3_host_prog = "/opt/homebrew/bin/python3"

-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = vim.highlight.on_yank,
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

-- colorscheme
vim.cmd("colorscheme nord")
