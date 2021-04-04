-- global options
vim.o.hidden=true         -- Enable hidden buffers
vim.o.signcolumn='yes'    -- Show signs in number column (e.g. errors and warnings)
vim.o.list=true           -- Show tabs, spaces and line ends
vim.o.mouse='a'           -- Enable all mouse support
vim.o.termguicolors=true  -- enable 24-bit colors

-- window options
vim.wo.number=true      -- Add line numbers
vim.wo.colorcolumn="80" -- Show a line at the 80th character

-- buffer options
vim.bo.expandtab=true -- Expand tabs to spaces per default
vim.bo.shiftwidth=2   -- Set default auto-indent width
vim.bo.softtabstop=2  -- Set default virtual tabstop width
vim.bo.tabstop=2      -- Set default tabstop width

vim.cmd 'colorscheme nord'  -- Set color scheme