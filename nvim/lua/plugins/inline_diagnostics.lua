-- Disable the plugin in Lazy.nvim
vim.api.nvim_create_autocmd("FileType", {
	pattern = "lazy",
	callback = function()
		local previous = not require("lsp_lines").toggle()
		if not previous then
			require("lsp_lines").toggle()
		end
	end,
})
return {
	{
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		opts = {
			virtual_text = false,
		},
	},
}
