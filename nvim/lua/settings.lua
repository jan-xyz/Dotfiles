local o = vim.o
local wo = vim.wo
local bo = vim.bo

-- global options
o.hidden=true         -- Enable hidden buffers
o.signcolumn='yes'    -- Show signs in number column (e.g. errors and warnings)
o.list=true           -- Show tabs, spaces and line ends
o.mouse='a'           -- Enable all mouse support
o.termguicolors=true

-- window options
wo.number=true         -- Add line numbers
wo.colorcolumn="80"      -- Show a line at the 80th character

-- buffer options
bo.expandtab=true      -- Expand tabs to spaces per default
bo.shiftwidth=2        -- Set default auto-indent width
bo.softtabstop=2       -- Set default virtual tabstop width
bo.tabstop=2           -- Set default tabstop width

vim.cmd 'colorscheme nord'  -- Set color scheme
