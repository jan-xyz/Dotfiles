local term_buf = nil

local function toggle_terminal()
	if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
		local win = vim.fn.bufwinid(term_buf)
		if win ~= -1 then
			vim.api.nvim_win_hide(win)
			return
		end
		vim.cmd("botright 15split")
		vim.api.nvim_win_set_buf(0, term_buf)
	else
		vim.cmd("botright 15split | terminal")
		term_buf = vim.api.nvim_get_current_buf()
		vim.bo[term_buf].buflisted = false
	end
	vim.cmd.startinsert()
end

vim.keymap.set({ "n", "t" }, "<C-n>", toggle_terminal, { desc = "Focus or toggle terminal" })
