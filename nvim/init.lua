vim.g.mapleader = " "

-- global options
vim.o.signcolumn = "yes"
vim.o.list = true
vim.o.listchars = "tab:⟶ "
vim.o.mouse = "a"
vim.o.splitbelow = false
vim.o.splitright = true
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldenable = true
vim.o.foldlevelstart = 99
vim.o.foldcolumn = "1"
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
vim.o.scrolloff = 4
vim.o.undofile = true
vim.o.smoothscroll = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.colorcolumn = "80"
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.tabstop = 2
vim.o.title = true
vim.o.titlestring = "%{fnamemodify(getcwd(), ':~:t')} (nvim)"

vim.diagnostic.config({
	virtual_lines = { severity = { min = vim.diagnostic.severity.INFO } },
})

vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("my.highlight_yank", {}),
	desc = "Highlight selection on yank",
	callback = function()
		vim.hl.on_yank({ higroup = "IncSearch", timeout = 300 })
	end,
})

-- a count must move by real lines, so relative line numbers stay usable
vim.keymap.set({ "n", "x" }, "j", function()
	return vim.v.count == 0 and "gj" or "j"
end, { expr = true, desc = "Down (wrapped lines)" })
vim.keymap.set({ "n", "x" }, "k", function()
	return vim.v.count == 0 and "gk" or "k"
end, { expr = true, desc = "Up (wrapped lines)" })

for _, key in ipairs({ "<Up>", "<Down>", "<Left>", "<Right>" }) do
	vim.keymap.set({ "i", "n", "v" }, key, "<Nop>", { silent = true })
end
