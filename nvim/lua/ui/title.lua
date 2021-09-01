local function title_string()
	if vim.fn.getcwd() == vim.env.HOME then
		return "~ (nvim)"
	else
		return vim.fn.fnamemodify(vim.fn.getcwd(), ":tail") .. " (nvim)"
	end
end

vim.o.title = true -- activate title string
vim.o.titlestring = title_string() -- titlestring template
