vim.pack.add({ { src = "https://github.com/catppuccin/nvim", name = "catppuccin" } })

-- :terminal gets the Ghostty palette, because the catppuccin terminal colours
-- differ from it and starship and fzf pick their colours by palette index
local terminal_palettes = {
	["catppuccin-frappe"] = {
		"#51576d",
		"#e78284",
		"#a6d189",
		"#e5c890",
		"#8caaee",
		"#f4b8e4",
		"#81c8be",
		"#a5adce",
		"#626880",
		"#e67172",
		"#8ec772",
		"#d9ba73",
		"#7b9ef0",
		"#f2a4db",
		"#5abfb5",
		"#b5bfe2",
	},
	["catppuccin-latte"] = {
		"#5c5f77",
		"#d20f39",
		"#40a02b",
		"#df8e1d",
		"#1e66f5",
		"#ea76cb",
		"#179299",
		"#acb0be",
		"#6c6f85",
		"#de293e",
		"#49af3d",
		"#eea02d",
		"#456eff",
		"#fe85d8",
		"#2d9fa8",
		"#bcc0cc",
	},
}

vim.api.nvim_create_autocmd("ColorScheme", {
	group = vim.api.nvim_create_augroup("my.terminal_palette", {}),
	pattern = "catppuccin*",
	callback = function()
		for index, color in ipairs(terminal_palettes[vim.g.colors_name] or {}) do
			vim.g["terminal_color_" .. (index - 1)] = color
		end
	end,
})

require("catppuccin").setup({
	background = { light = "latte", dark = "frappe" },
})
vim.cmd.colorscheme("catppuccin")
