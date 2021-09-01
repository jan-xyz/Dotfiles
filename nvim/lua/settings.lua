-- global options
vim.o.hidden = true -- allow hidden buffers
vim.o.signcolumn = "yes" -- Show signs in number column (e.g. errors and warnings)
vim.o.list = true -- Show tabs, spaces and line ends
vim.o.listchars = "tab:⟶ " -- Set list characters
vim.o.mouse = "a" -- Enable all mouse support
vim.o.termguicolors = true -- enable 24-bit colors
vim.o.title = true -- activate title string
vim.o.titlestring = "nvim %{fnamemodify(getcwd(), ':t')}" -- titlestring template expected: "nvim my-directory"
vim.o.titlelen = 10 -- titlestring length

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
