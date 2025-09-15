-- global options
vim.opt.hidden = true
vim.opt.signcolumn = "yes"
vim.opt.list = true
vim.opt.listchars = "tab:⟶ "
vim.opt.mouse = "a"
vim.opt.termguicolors = true
vim.opt.splitbelow = false
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
vim.opt.undofile = true
vim.g.smoothscroll = true
vim.g.mapleader = " "

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

-- default LSP support
vim.lsp.enable("codebook")

-- diagnostics
vim.diagnostic.config({
	virtual_lines = {
		severity = { vim.diagnostic.severity.INFO, vim.diagnostic.severity.WARN, vim.diagnostic.severity.ERROR },
	},
})

-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", {}),
	desc = "Hightlight selection on yank",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 300 })
	end,
})

-- move with j and k wrapped lines
vim.keymap.set({ "n", "v" }, "j", "gj", { noremap = true })
vim.keymap.set({ "n", "v" }, "<down>", "gj", { noremap = true })
vim.keymap.set({ "n", "v" }, "k", "gk", { noremap = true })
vim.keymap.set({ "n", "v" }, "k", "gk", { noremap = true })
vim.keymap.set({ "n", "v" }, "<up>", "gk", { noremap = true })

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

-- Disable arrow keys
vim.keymap.set({ "i", "n", "v" }, "<Up>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set({ "i", "n", "v" }, "<Down>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set({ "i", "n", "v" }, "<Left>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set({ "i", "n", "v" }, "<Right>", "<Nop>", { noremap = true, silent = true })
