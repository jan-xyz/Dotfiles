local function has_lsp_formatter(bufnr)
	for _, client in ipairs(vim.lsp.get_clients({ bufnr = bufnr })) do
		if client:supports_method("textDocument/formatting", bufnr) then
			return true
		end
	end
	return false
end

local function format_with_formatprg(bufnr)
	local cmd = vim.bo[bufnr].formatprg
	local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
	local result = vim.system({ "sh", "-c", cmd }, { stdin = lines, text = true }):wait()
	if result.code ~= 0 then
		vim.notify("Formatter failed: " .. vim.trim(result.stderr or ""), vim.log.levels.WARN)
		return
	end
	local formatted = vim.split(result.stdout, "\n", { plain = true })
	if formatted[#formatted] == "" then
		table.remove(formatted)
	end
	if vim.deep_equal(formatted, lines) then
		return
	end
	local view = vim.fn.winsaveview()
	vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, formatted)
	vim.fn.winrestview(view)
end

vim.api.nvim_create_autocmd("BufWritePre", {
	group = vim.api.nvim_create_augroup("my.format", {}),
	callback = function(args)
		if vim.g.autoformat == false or vim.bo[args.buf].formatprg == "" or has_lsp_formatter(args.buf) then
			return
		end
		format_with_formatprg(args.buf)
	end,
})

vim.keymap.set("n", "<leader>F", function()
	vim.g.autoformat = vim.g.autoformat == false
	vim.notify((vim.g.autoformat and "Enabled" or "Disabled") .. " formatting on save", vim.log.levels.INFO)
end, { desc = "Toggle formatting on save" })
