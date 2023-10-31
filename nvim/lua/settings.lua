-- global options
vim.opt.hidden = true
vim.opt.signcolumn = "yes"
vim.opt.list = true
vim.opt.listchars = "tab:⟶ "
vim.opt.mouse = "a"
vim.opt.termguicolors = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.completeopt = "menuone,noinsert,noselect"
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = true
vim.opt.foldlevelstart = 99
vim.opt.foldcolumn = "1"
vim.opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
vim.opt.scrolloff = 4

-- window options
vim.wo.number = true
vim.wo.colorcolumn = "80"

-- buffer options
vim.bo.expandtab = true
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2
vim.bo.tabstop = 2

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

-- set the title string
local function title_string()
	if vim.fn.getcwd() == vim.env.HOME then
		return "~ (nvim)"
	else
		return vim.fn.fnamemodify(vim.fn.getcwd(), ":tail") .. " (nvim)"
	end
end
vim.o.title = true                 -- activate title string
vim.o.titlestring = title_string() -- titlestring template
