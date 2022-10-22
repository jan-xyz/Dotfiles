-- Port of https://github.com/arcticicestudio/nord-vim

local nord0_gui = "#2E3440"
local nord1_gui = "#3B4252"
local nord2_gui = "#434C5E"
local nord3_gui = "#4C566A"
local nord3_gui_bright = "#616E88"
local nord4_gui = "#D8DEE9"
local nord5_gui = "#E5E9F0"
local nord6_gui = "#ECEFF4"
local nord7_gui = "#8FBCBB"
local nord8_gui = "#88C0D0"
local nord9_gui = "#81A1C1"
local nord10_gui = "#5E81AC"
local nord11_gui = "#BF616A"
local nord12_gui = "#D08770"
local nord13_gui = "#EBCB8B"
local nord14_gui = "#A3BE8C"
local nord15_gui = "#B48EAD"

local nord1_term = 0
local nord3_term = 8
local nord5_term = 7
local nord6_term = 15
local nord7_term = 14
local nord8_term = 6
local nord9_term = 4
local nord10_term = 12
local nord11_term = 1
local nord12_term = 11
local nord13_term = 3
local nord14_term = 2
local nord15_term = 5

vim.g.terminal_color_0 = nord1_gui
vim.g.terminal_color_1 = nord11_gui
vim.g.terminal_color_2 = nord14_gui
vim.g.terminal_color_3 = nord13_gui
vim.g.terminal_color_4 = nord9_gui
vim.g.terminal_color_5 = nord15_gui
vim.g.terminal_color_6 = nord8_gui
vim.g.terminal_color_7 = nord5_gui
vim.g.terminal_color_8 = nord3_gui
vim.g.terminal_color_9 = nord11_gui
vim.g.terminal_color_10 = nord14_gui
vim.g.terminal_color_11 = nord13_gui
vim.g.terminal_color_12 = nord9_gui
vim.g.terminal_color_13 = nord15_gui
vim.g.terminal_color_14 = nord7_gui
vim.g.terminal_color_15 = nord6_gui

-- +---------------+
-- +    Config     +
-- +---------------+
local bold = true
local italic = true
local underline = true
local cursor_line_number_background = true
local uniform_status_lines = true
local bold_vertical_split_line = false

-- +---------------+
-- + UI Components +
-- +---------------+

-- +--- Attributes ---+
vim.api.nvim_set_hl(0, "Bold", { bold = bold })
vim.api.nvim_set_hl(0, "Italic", { italic = italic })
vim.api.nvim_set_hl(0, "Underline", { underline = underline })

-- +--- Editor ---+
vim.api.nvim_set_hl(0, "ColorColumn", { bg = nord1_gui, ctermfg = "NONE", ctermbg = nord1_term })
vim.api.nvim_set_hl(0, "Cursor", { fg = nord0_gui, ctermfg = "NONE" })
vim.api.nvim_set_hl(0, "CursorLine", { bg = nord1_gui, ctermfg = "NONE", ctermbg = nord9_term })
vim.api.nvim_set_hl(0, "Error", { fg = nord4_gui, bg = nord11_gui, ctermbg = nord11_term })
vim.api.nvim_set_hl(0, "iCursor", { fg = nord0_gui, bg = nord4_gui, ctermbg = "NONE" })
vim.api.nvim_set_hl(0, "LineNr", { fg = nord3_gui, bg = "NONE", ctermfg = nord3_term, ctermbg = "NONE" })
vim.api.nvim_set_hl(0, "MatchParen", { fg = nord8_gui, bg = nord3_gui, ctermfg = nord8_term, ctermbg = nord3_term })
vim.api.nvim_set_hl(0, "NonText", { fg = nord2_gui, ctermfg = nord3_term })
vim.api.nvim_set_hl(0, "Normal", { fg = nord4_gui, bg = nord0_gui, ctermfg = "NONE", ctermbg = "NONE" })
vim.api.nvim_set_hl(0, "Pmenu", { fg = nord4_gui, bg = nord2_gui, ctermfg = "NONE", ctermbg = nord1_term })
vim.api.nvim_set_hl(0, "PmenuSbar", { fg = nord4_gui, bg = nord2_gui, ctermfg = "NONE", ctermbg = nord1_term })
vim.api.nvim_set_hl(0, "PmenuSel", { fg = nord8_gui, bg = nord3_gui, ctermfg = nord8_term, ctermbg = nord3_term })
vim.api.nvim_set_hl(0, "PmenuThumb", { fg = nord8_gui, bg = nord3_gui, ctermfg = "NONE", ctermbg = nord3_term })
vim.api.nvim_set_hl(0, "SpecialKey", { fg = nord3_gui, ctermfg = nord3_term })
vim.api.nvim_set_hl(0, "SpellBad", {
	fg = nord11_gui,
	bg = nord0_gui,
	ctermfg = nord11_term,
	ctermbg = "NONE",
	undercurl = true,
	cterm = { undercurl = true },
	sp = nord11_gui,
})
vim.api.nvim_set_hl(0, "SpellCap", {
	fg = nord13_gui,
	bg = nord0_gui,
	ctermfg = nord13_term,
	ctermbg = "NONE",
	undercurl = true,
	cterm = { undercurl = true },
	sp = nord13_gui,
})
vim.api.nvim_set_hl(0, "SpellLocal", {
	fg = nord5_gui,
	bg = nord0_gui,
	ctermfg = nord5_term,
	ctermbg = "NONE",
	undercurl = true,
	cterm = { undercurl = true },
	sp = nord5_gui,
})
vim.api.nvim_set_hl(0, "SpellRare", {
	fg = nord6_gui,
	bg = nord0_gui,
	ctermfg = nord6_term,
	ctermbg = "NONE",
	undercurl = true,
	cterm = { undercurl = true },
	sp = nord6_gui,
})
vim.api.nvim_set_hl(0, "Visual", { bg = nord2_gui, ctermbg = nord1_term })
vim.api.nvim_set_hl(0, "VisualNOS", { bg = nord2_gui, ctermbg = nord1_term })

-- +--- Gutter ---+
vim.api.nvim_set_hl(0, "CursorColumn", { bg = nord1_gui, ctermbg = nord1_term })
if cursor_line_number_background then
	vim.api.nvim_set_hl(0, "CursorLineNr", { fg = nord4_gui, bg = nord1_gui, ctermbg = nord1_term })
else
	vim.api.nvim_set_hl(0, "CursorLineNr", { fg = nord4_gui })
end
vim.api.nvim_set_hl(
	0,
	"Folded",
	{ fg = nord3_gui, bg = nord1_gui, ctermfg = nord3_term, ctermbg = nord1_term, bold = true, cterm = { bold = true } }
)
vim.api.nvim_set_hl(0, "FoldColumn", { fg = nord3_gui, bg = nord0_gui, ctermfg = nord3_term, ctermbg = "NONE" })
vim.api.nvim_set_hl(0, "SignColumn", { fg = nord1_gui, bg = nord0_gui, ctermfg = nord1_term, ctermbg = "NONE" })

-- +--- Navigation ---+
vim.api.nvim_set_hl(0, "Directory", { fg = nord8_gui, ctermfg = nord8_term, ctermbg = "NONE" })

-- +--- Prompt/Status ---+
vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = nord1_gui, ctermfg = nord1_term, ctermbg = "NONE" })
vim.api.nvim_set_hl(0, "ErrorMsg", { fg = nord4_gui, bg = nord11_gui, ctermfg = "NONE", ctermbg = nord11_term })
vim.api.nvim_set_hl(0, "ModeMsg", { fg = nord4_gui })
vim.api.nvim_set_hl(0, "MoreMsg", { fg = nord8_gui, ctermfg = nord8_term })
vim.api.nvim_set_hl(0, "Question", { fg = nord4_gui, ctermfg = "NONE" })
if uniform_status_lines then
	vim.api.nvim_set_hl(0, "StatusLine", { fg = nord8_gui, bg = nord3_gui, ctermfg = nord8_term, ctermbg = nord3_term })
	vim.api.nvim_set_hl(0, "StatusLineNC", { fg = nord4_gui, bg = nord3_gui, ctermfg = "NONE", ctermbg = nord3_term })
	vim.api.nvim_set_hl(
		0,
		"StatusLineTerm",
		{ fg = nord8_gui, bg = nord3_gui, ctermfg = nord8_term, ctermbg = nord3_term }
	)
	vim.api.nvim_set_hl(
		0,
		"StatusLineTermNC",
		{ fg = nord4_gui, bg = nord3_gui, ctermfg = "NONE", ctermbg = nord3_term }
	)
else
	vim.api.nvim_set_hl(0, "StatusLine", { fg = nord8_gui, bg = nord3_gui, ctermfg = nord8_term, ctermbg = nord3_term })
	vim.api.nvim_set_hl(0, "StatusLineNC", { fg = nord4_gui, bg = nord1_gui, ctermfg = "NONE", ctermbg = nord1_term })
	vim.api.nvim_set_hl(
		0,
		"StatusLineTerm",
		{ fg = nord8_gui, bg = nord3_gui, ctermfg = nord8_term, ctermbg = nord3_term }
	)
	vim.api.nvim_set_hl(
		0,
		"StatusLineTermNC",
		{ fg = nord4_gui, bg = nord1_gui, ctermfg = "NONE", ctermbg = nord1_term }
	)
end
vim.api.nvim_set_hl(0, "WarningMsg", { fg = nord0_gui, bg = nord13_gui, ctermfg = nord1_term, ctermbg = nord13_term })
vim.api.nvim_set_hl(0, "WildMenu", { fg = nord8_gui, bg = nord1_gui, ctermfg = nord8_term, ctermbg = nord1_term })

-- +--- Search ---+
vim.api.nvim_set_hl(0, "IncSearch", {
	fg = nord6_gui,
	bg = nord10_gui,
	ctermfg = nord6_term,
	ctermbg = nord10_term,
	underline = true,
	cterm = { underline = true },
})
vim.api.nvim_set_hl(0, "Search", { fg = nord1_gui, bg = nord8_gui, ctermfg = nord1_term, ctermbg = nord8_term })

-- +--- Tabs ---+
vim.api.nvim_set_hl(0, "TabLine", { fg = nord4_gui, bg = nord1_gui, ctermfg = "NONE", ctermbg = "NONE" })
vim.api.nvim_set_hl(0, "TabLineFill", { fg = nord4_gui, bg = nord1_gui, ctermfg = "NONE", ctermbg = "NONE" })
vim.api.nvim_set_hl(0, "TabLineSel", { fg = nord8_gui, bg = nord3_gui, ctermfg = nord8_term, ctermbg = nord3_term })

-- +--- Window ---+
vim.api.nvim_set_hl(0, "Title", { fg = nord4_gui })
if bold_vertical_split_line then
	vim.api.nvim_set_hl(0, "VertSplit", { fg = nord2_gui, bg = nord1_gui, ctermfg = nord3_term, ctermbg = nord1_term })
else
	vim.api.nvim_set_hl(0, "VertSplit", { fg = nord2_gui, bg = nord0_gui, ctermfg = nord3_term })
end

-- +- Diagnostics -+
vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = nord13_gui, ctermfg = nord13_term })
vim.api.nvim_set_hl(0, "DiagnosticError", { fg = nord11_gui, ctermfg = nord11_term })
vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = nord8_gui, ctermfg = nord8_term })
vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = nord10_gui, ctermfg = nord10_term })
vim.api.nvim_set_hl(
	0,
	"DiagnosticUnderlineWarn",
	{ fg = nord13_gui, ctermfg = nord13_term, undercurl = true, cterm = { undercurl = true } }
)
vim.api.nvim_set_hl(
	0,
	"DiagnosticUnderlineError",
	{ fg = nord11_gui, ctermfg = nord11_term, undercurl = true, cterm = { undercurl = true } }
)
vim.api.nvim_set_hl(
	0,
	"DiagnosticUnderlineInfo",
	{ fg = nord8_gui, ctermfg = nord8_term, undercurl = true, cterm = { undercurl = true } }
)
vim.api.nvim_set_hl(
	0,
	"DiagnosticUnderlineHint",
	{ fg = nord10_gui, ctermfg = nord10_term, undercurl = true, cterm = { undercurl = true } }
)

-- +- Git -+
vim.api.nvim_set_hl(0, "DiffAdd", { fg = nord14_gui, ctermfg = nord14_term })
vim.api.nvim_set_hl(0, "DiffChange", { fg = nord13_gui, ctermfg = nord13_term })
vim.api.nvim_set_hl(0, "DiffText", { fg = nord11_gui, ctermfg = nord11_term })
vim.api.nvim_set_hl(0, "DiffDelete", { fg = nord11_gui, ctermfg = nord11_term })

-- +- Lsp -+
vim.api.nvim_set_hl(0, "LspReferenceText", { bg = nord3_gui, ctermbg = nord3_term })
vim.api.nvim_set_hl(0, "LspReferenceRead", { bg = nord3_gui, ctermbg = nord3_term })
vim.api.nvim_set_hl(0, "LspReferenceWrite", { bg = nord3_gui, ctermbg = nord3_term })
vim.api.nvim_set_hl(
	0,
	"LspSignatureActiveParameter",
	{ fg = nord8_gui, ctermfg = nord8_term, underline = true, cterm = { underline = true } }
)
vim.api.nvim_set_hl(0, "LspCodeLens", { fg = nord3_gui_bright, ctermfg = nord3_term })

-- +----------------------+
-- + Language Base Groups +
-- +----------------------+
vim.api.nvim_set_hl(0, "Boolean", { fg = nord9_gui, ctermfg = nord9_term })
vim.api.nvim_set_hl(0, "Character", { fg = nord14_gui, ctermfg = nord14_term })
vim.api.nvim_set_hl(
	0,
	"Comment",
	{ fg = nord3_gui_bright, ctermfg = nord3_term, italic = true, cterm = { italic = true } }
)
vim.api.nvim_set_hl(0, "Conceal", { bg = "NONE", ctermbg = "NONE" })
vim.api.nvim_set_hl(0, "Conditional", { fg = nord9_gui, ctermfg = nord9_term })
vim.api.nvim_set_hl(0, "Constant", { fg = nord4_gui, ctermfg = "NONE" })
vim.api.nvim_set_hl(0, "Decorator", { fg = nord12_gui, ctermfg = nord12_term, link = "Annotation" })
vim.api.nvim_set_hl(0, "Define", { fg = nord9_gui, ctermfg = nord9_term, link = "Macro" })
vim.api.nvim_set_hl(0, "Delimiter", { fg = nord6_gui, ctermfg = nord6_term })
vim.api.nvim_set_hl(0, "Exception", { fg = nord9_gui, ctermfg = nord9_term })
vim.api.nvim_set_hl(0, "Float", { fg = nord15_gui, ctermfg = nord15_term })
vim.api.nvim_set_hl(0, "Function", { fg = nord8_gui, ctermfg = nord8_term })
vim.api.nvim_set_hl(0, "Identifier", { fg = nord4_gui, ctermfg = "NONE", link = "Variable" })
vim.api.nvim_set_hl(0, "Include", { fg = nord9_gui, ctermfg = nord9_term })
vim.api.nvim_set_hl(0, "Keyword", { fg = nord9_gui, ctermfg = nord9_term })
vim.api.nvim_set_hl(0, "Label", { fg = nord9_gui, ctermfg = nord9_term })
vim.api.nvim_set_hl(0, "Number", { fg = nord15_gui, ctermfg = nord15_term })
vim.api.nvim_set_hl(0, "Operator", { fg = nord9_gui, ctermfg = nord9_term })
vim.api.nvim_set_hl(0, "PreProc", { fg = nord9_gui, ctermfg = nord9_term, link = "PreCondit" })
vim.api.nvim_set_hl(0, "Repeat", { fg = nord9_gui, ctermfg = nord9_term })
vim.api.nvim_set_hl(0, "Special", { fg = nord4_gui, ctermfg = "NONE" })
vim.api.nvim_set_hl(0, "SpecialChar", { fg = nord13_gui, ctermfg = nord13_term })
vim.api.nvim_set_hl(
	0,
	"SpecialComment",
	{ fg = nord8_gui, ctermfg = nord8_term, italic = true, cterm = { italic = true } }
)
vim.api.nvim_set_hl(0, "Statement", { fg = nord9_gui, ctermfg = nord9_term })
vim.api.nvim_set_hl(0, "StorageClass", { fg = nord9_gui, ctermfg = nord9_term })
vim.api.nvim_set_hl(0, "String", { fg = nord14_gui, ctermfg = nord14_term })
vim.api.nvim_set_hl(0, "Structure", { fg = nord9_gui, ctermfg = nord9_term })
vim.api.nvim_set_hl(0, "Tag", { fg = nord4_gui })
vim.api.nvim_set_hl(0, "Todo", { fg = nord13_gui, bg = "NONE", ctermfg = nord13_term, ctermbg = "NONE" })
vim.api.nvim_set_hl(0, "Type", { fg = nord9_gui, ctermfg = nord9_term })
vim.api.nvim_set_hl(0, "Typedef", { fg = nord9_gui, ctermfg = nord9_term })

-- Setup function
local M = {}

function M.setup() end

return M
