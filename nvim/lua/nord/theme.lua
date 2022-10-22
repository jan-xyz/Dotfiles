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
-- local cursor_line_number_background = true
-- local bold_vertical_split_line = true

--"+---------------+
--"+ UI Components +
--"+---------------+
--"+--- Attributes ---+
--call s:hi("Bold", "", "", "", "", s:bold, "")
vim.api.nvim_set_hl(0, "Bold", { bold = bold })
--call s:hi("Italic", "", "", "", "", s:italic, "")
vim.api.nvim_set_hl(0, "Italic", { italic = italic })
--call s:hi("Underline", "", "", "", "", s:underline, "")
vim.api.nvim_set_hl(0, "Underline", { underline = underline })
--
--"+--- Editor ---+
--call s:hi("ColorColumn", "", s:nord1_gui, "NONE", s:nord1_gui, "", "")
vim.api.nvim_set_hl(0, "ColorColumn", { bg = nord1_gui, ctermfg = "NONE", ctermbg = nord1_term })
--call s:hi("Cursor", s:nord0_gui, s:nord4_gui, "", "NONE", "", "")
vim.api.nvim_set_hl(0, "Cursor", { fg = nord0_gui, ctermfg = "NONE" })
--call s:hi("CursorLine", "", s:nord1_gui, "NONE", s:nord1_gui, "NONE", "")
vim.api.nvim_set_hl(0, "CursorLine", { bg = nord1_gui, ctermfg = "NONE", ctermbg = nord9_term })
--call s:hi("Error", s:nord4_gui, s:nord11_gui, "", s:nord11_gui, "", "")
vim.api.nvim_set_hl(0, "Error", { fg = nord4_gui, bg = nord11_gui, ctermbg = nord11_term })
--call s:hi("iCursor", s:nord0_gui, s:nord4_gui, "", "NONE", "", "")
vim.api.nvim_set_hl(0, "iCursor", { fg = nord0_gui, bg = nord4_gui, ctermbg = "NONE" })
--call s:hi("LineNr", s:nord3_gui, "NONE", s:nord3_gui, "NONE", "", "")
vim.api.nvim_set_hl(0, "LineNr", { fg = nord3_gui, bg = "NONE", ctermfg = nord3_term, ctermbg = "NONE" })
--call s:hi("MatchParen", s:nord8_gui, s:nord3_gui, s:nord8_gui, s:nord3_gui, "", "")
vim.api.nvim_set_hl(0, "MatchParen", { fg = nord8_gui, bg = nord3_gui, ctermfg = nord8_term, ctermbg = nord3_term })
--call s:hi("NonText", s:nord2_gui, "", s:nord3_gui, "", "", "")
vim.api.nvim_set_hl(0, "NonText", { fg = nord2_gui, ctermfg = nord3_term })
--call s:hi("Normal", s:nord4_gui, s:nord0_gui, "NONE", "NONE", "", "")
vim.api.nvim_set_hl(0, "Normal", { fg = nord4_gui, bg = nord0_gui, ctermfg = "NONE", ctermbg = "NONE" })
--call s:hi("Pmenu", s:nord4_gui, s:nord2_gui, "NONE", s:nord1_gui, "NONE", "")
vim.api.nvim_set_hl(0, "Pmenu", { fg = nord4_gui, bg = nord2_gui, ctermfg = "NONE", ctermbg = nord1_term })
--call s:hi("PmenuSbar", s:nord4_gui, s:nord2_gui, "NONE", s:nord1_gui, "", "")
vim.api.nvim_set_hl(0, "PmenuSbar", { fg = nord4_gui, bg = nord2_gui, ctermfg = "NONE", ctermbg = nord1_term })
--call s:hi("PmenuSel", s:nord8_gui, s:nord3_gui, s:nord8_gui, s:nord3_gui, "", "")
vim.api.nvim_set_hl(0, "PmenuSel", { fg = nord8_gui, bg = nord3_gui, ctermfg = nord8_term, ctermbg = nord3_term })
--call s:hi("PmenuThumb", s:nord8_gui, s:nord3_gui, "NONE", s:nord3_gui, "", "")
vim.api.nvim_set_hl(0, "PmenuThumb", { fg = nord8_gui, bg = nord3_gui, ctermfg = "NONE", ctermbg = nord3_term })
--call s:hi("SpecialKey", s:nord3_gui, "", s:nord3_gui, "", "", "")
vim.api.nvim_set_hl(0, "SpecialKey", { fg = nord3_gui, ctermfg = nord3_term })
--call s:hi("SpellBad", s:nord11_gui, s:nord0_gui, s:nord11_gui, "NONE", "undercurl", s:nord11_gui)
vim.api.nvim_set_hl(
	0,
	"SpellBad",
	{
		fg = nord11_gui,
		bg = nord0_gui,
		ctermfg = nord11_term,
		ctermbg = "NONE",
		undercurl = true,
		cterm = { undercurl = true },
		sp = nord11_gui,
	}
)
--call s:hi("SpellCap", s:nord13_gui, s:nord0_gui, s:nord13_gui, "NONE", "undercurl", s:nord13_gui)
vim.api.nvim_set_hl(
	0,
	"SpellCap",
	{
		fg = nord13_gui,
		bg = nord0_gui,
		ctermfg = nord13_term,
		ctermbg = "NONE",
		undercurl = true,
		cterm = { undercurl = true },
		sp = nord13_gui,
	}
)
--call s:hi("SpellLocal", s:nord5_gui, s:nord0_gui, s:nord5_gui, "NONE", "undercurl", s:nord5_gui)
vim.api.nvim_set_hl(
	0,
	"SpellLocal",
	{
		fg = nord5_gui,
		bg = nord0_gui,
		ctermfg = nord5_term,
		ctermbg = "NONE",
		undercurl = true,
		cterm = { undercurl = true },
		sp = nord5_gui,
	}
)
--call s:hi("SpellRare", s:nord6_gui, s:nord0_gui, s:nord6_gui, "NONE", "undercurl", s:nord6_gui)
vim.api.nvim_set_hl(
	0,
	"SpellRare",
	{
		fg = nord6_gui,
		bg = nord0_gui,
		ctermfg = nord6_term,
		ctermbg = "NONE",
		undercurl = true,
		cterm = { undercurl = true },
		sp = nord6_gui,
	}
)
--call s:hi("Visual", "", s:nord2_gui, "", s:nord1_gui, "", "")
vim.api.nvim_set_hl(0, "Visual", { bg = nord2_gui, ctermbg = nord1_term })
--call s:hi("VisualNOS", "", s:nord2_gui, "", s:nord1_gui, "", "")
vim.api.nvim_set_hl(0, "VisualNOS", { bg = nord2_gui, ctermbg = nord1_term })

-- "+--- Gutter ---+
-- call s:hi("CursorColumn", "", s:nord1_gui, "NONE", s:nord1_term, "", "")
-- if g:nord_cursor_line_number_background == 0
--   call s:hi("CursorLineNr", s:nord4_gui, "", "NONE", "", "NONE", "")
-- else
--   call s:hi("CursorLineNr", s:nord4_gui, s:nord1_gui, "NONE", s:nord1_term, "NONE", "")
-- endif
-- call s:hi("Folded", s:nord3_gui, s:nord1_gui, s:nord3_term, s:nord1_term, s:bold, "")
vim.api.nvim_set_hl(
	0,
	"Folded",
	{ fg = nord3_gui, bg = nord1_gui, ctermfg = nord3_term, ctermbg = nord1_term, bold = true, cterm = { bold = true } }
)
-- call s:hi("FoldColumn", s:nord3_gui, s:nord0_gui, s:nord3_term, "NONE", "", "")
vim.api.nvim_set_hl(0, "FoldColumn", { fg = nord3_gui, bg = nord0_gui, ctermfg = nord3_term, ctermbg = "NONE" })
-- call s:hi("SignColumn", s:nord1_gui, s:nord0_gui, s:nord1_term, "NONE", "", "")
vim.api.nvim_set_hl(0, "SignColumn", { fg = nord1_gui, bg = nord0_gui, ctermfg = nord1_term, ctermbg = "NONE" })
--
-- "+--- Navigation ---+
-- call s:hi("Directory", s:nord8_gui, "", s:nord8_term, "NONE", "", "")
vim.api.nvim_set_hl(0, "Directory", { fg = nord8_gui, ctermfg = nord8_term, ctermbg = "NONE" })

-- "+--- Prompt/Status ---+
-- call s:hi("EndOfBuffer", s:nord1_gui, "", s:nord1_term, "NONE", "", "")
-- call s:hi("ErrorMsg", s:nord4_gui, s:nord11_gui, "NONE", s:nord11_term, "", "")
-- call s:hi("ModeMsg", s:nord4_gui, "", "", "", "", "")
-- call s:hi("MoreMsg", s:nord8_gui, "", s:nord8_term, "", "", "")
-- call s:hi("Question", s:nord4_gui, "", "NONE", "", "", "")
-- if g:nord_uniform_status_lines == 0
--   call s:hi("StatusLine", s:nord8_gui, s:nord3_gui, s:nord8_term, s:nord3_term, "NONE", "")
--   call s:hi("StatusLineNC", s:nord4_gui, s:nord1_gui, "NONE", s:nord1_term, "NONE", "")
--   call s:hi("StatusLineTerm", s:nord8_gui, s:nord3_gui, s:nord8_term, s:nord3_term, "NONE", "")
--   call s:hi("StatusLineTermNC", s:nord4_gui, s:nord1_gui, "NONE", s:nord1_term, "NONE", "")
-- else
--   call s:hi("StatusLine", s:nord8_gui, s:nord3_gui, s:nord8_term, s:nord3_term, "NONE", "")
--   call s:hi("StatusLineNC", s:nord4_gui, s:nord3_gui, "NONE", s:nord3_term, "NONE", "")
--   call s:hi("StatusLineTerm", s:nord8_gui, s:nord3_gui, s:nord8_term, s:nord3_term, "NONE", "")
--   call s:hi("StatusLineTermNC", s:nord4_gui, s:nord3_gui, "NONE", s:nord3_term, "NONE", "")
-- endif
-- call s:hi("WarningMsg", s:nord0_gui, s:nord13_gui, s:nord1_term, s:nord13_term, "", "")
-- call s:hi("WildMenu", s:nord8_gui, s:nord1_gui, s:nord8_term, s:nord1_term, "", "")
--
-- "+--- Search ---+
-- call s:hi("IncSearch", s:nord6_gui, s:nord10_gui, s:nord6_term, s:nord10_term, s:underline, "")
-- call s:hi("Search", s:nord1_gui, s:nord8_gui, s:nord1_term, s:nord8_term, "NONE", "")
--
-- "+--- Tabs ---+
-- call s:hi("TabLine", s:nord4_gui, s:nord1_gui, "NONE", s:nord1_term, "NONE", "")
-- call s:hi("TabLineFill", s:nord4_gui, s:nord1_gui, "NONE", s:nord1_term, "NONE", "")
-- call s:hi("TabLineSel", s:nord8_gui, s:nord3_gui, s:nord8_term, s:nord3_term, "NONE", "")
--
-- "+--- Window ---+
-- call s:hi("Title", s:nord4_gui, "", "NONE", "", "NONE", "")
--
-- if g:nord_bold_vertical_split_line == 0
--   call s:hi("VertSplit", s:nord2_gui, s:nord0_gui, s:nord3_term, "NONE", "NONE", "")
-- else
--   call s:hi("VertSplit", s:nord2_gui, s:nord1_gui, s:nord3_term, s:nord1_term, "NONE", "")
-- endif

-- "+- Diagnostics -+
--   call s:hi("DiagnosticWarn", s:nord13_gui, "", s:nord13_term, "", "", "")
vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = nord13_gui, ctermfg = nord13_term })
--   call s:hi("DiagnosticError" , s:nord11_gui, "", s:nord11_term, "", "", "")
vim.api.nvim_set_hl(0, "DiagnosticError", { fg = nord11_gui, ctermfg = nord11_term })
--   call s:hi("DiagnosticInfo" , s:nord8_gui, "", s:nord8_term, "", "", "")
vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = nord8_gui, ctermfg = nord8_term })
--   call s:hi("DiagnosticHint" , s:nord10_gui, "", s:nord10_term, "", "", "")
vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = nord10_gui, ctermfg = nord10_term })
--   call s:hi("DiagnosticUnderlineWarn" , s:nord13_gui, "", s:nord13_term, "", "undercurl", "")
vim.api.nvim_set_hl(
	0,
	"DiagnosticUnderlineWarn",
	{ fg = nord13_gui, ctermfg = nord13_term, undercurl = true, cterm = { undercurl = true } }
)
--   call s:hi("DiagnosticUnderlineError" , s:nord11_gui, "", s:nord11_term, "", "undercurl", "")
vim.api.nvim_set_hl(
	0,
	"DiagnosticUnderlineError",
	{ fg = nord11_gui, ctermfg = nord11_term, undercurl = true, cterm = { undercurl = true } }
)
--   call s:hi("DiagnosticUnderlineInfo" , s:nord8_gui, "", s:nord8_term, "", "undercurl", "")
vim.api.nvim_set_hl(
	0,
	"DiagnosticUnderlineInfo",
	{ fg = nord8_gui, ctermfg = nord8_term, undercurl = true, cterm = { undercurl = true } }
)
--   call s:hi("DiagnosticUnderlineHint" , s:nord10_gui, "", s:nord10_term, "", "undercurl", "")
vim.api.nvim_set_hl(
	0,
	"DiagnosticUnderlineHint",
	{ fg = nord10_gui, ctermfg = nord10_term, undercurl = true, cterm = { undercurl = true } }
)

-- "+- Lsp -+
--   call s:hi("LspReferenceText", "", s:nord3_gui, "", s:nord3_term, "", "")
--   call s:hi("LspReferenceRead", "", s:nord3_gui, "", s:nord3_term, "", "")
--   call s:hi("LspReferenceWrite", "", s:nord3_gui, "", s:nord3_term, "", "")
--   call s:hi("LspSignatureActiveParameter", s:nord8_gui, "", s:nord8_term, "", s:underline, "")
--   call s:hi("LspCodeLens", s:nord3_gui_bright, "", s:nord3_term, "", "", "")

-- +----------------------+
-- + Language Base Groups +
-- +----------------------+
-- call s:hi("Boolean", s:nord9_gui, "", s:nord9_gui, "", "", "")
vim.api.nvim_set_hl(0, "Boolean", { fg = nord9_gui, ctermfg = nord9_term })
-- call s:hi("Character", s:nord14_gui, "", s:nord14_gui, "", "", "")
vim.api.nvim_set_hl(0, "Character", { fg = nord14_gui, ctermfg = nord14_term })
-- call s:hi("Comment", s:nord3_gui_bright, "", s:nord3_gui, "", s:italicize_comments, "")
vim.api.nvim_set_hl(
	0,
	"Comment",
	{ fg = nord3_gui_bright, ctermfg = nord3_term, italic = true, cterm = { italic = true } }
)
-- call s:hi("Conceal", "", "NONE", "", "NONE", "", "")
vim.api.nvim_set_hl(0, "Conceal", { bg = "NONE", ctermbg = "NONE" })
-- call s:hi("Conditional", s:nord9_gui, "", s:nord9_gui, "", "", "")
vim.api.nvim_set_hl(0, "Conditional", { fg = nord9_gui, ctermfg = nord9_term })
-- call s:hi("Constant", s:nord4_gui, "", "NONE", "", "", "")
vim.api.nvim_set_hl(0, "Constant", { fg = nord4_gui, ctermfg = "NONE" })
-- call s:hi("Decorator", s:nord12_gui, "", s:nord12_gui, "", "", "")
-- hi! link Annotation Decorator
vim.api.nvim_set_hl(0, "Decorator", { fg = nord12_gui, ctermfg = nord12_term, link = "Annotation" })
-- call s:hi("Define", s:nord9_gui, "", s:nord9_gui, "", "", "")
-- hi! link Macro Define
vim.api.nvim_set_hl(0, "Define", { fg = nord9_gui, ctermfg = nord9_term, link = "Macro" })
-- call s:hi("Delimiter", s:nord6_gui, "", s:nord6_gui, "", "", "")
vim.api.nvim_set_hl(0, "Delimiter", { fg = nord6_gui, ctermfg = nord6_term })
-- call s:hi("Exception", s:nord9_gui, "", s:nord9_gui, "", "", "")
vim.api.nvim_set_hl(0, "Exception", { fg = nord9_gui, ctermfg = nord9_term })
-- call s:hi("Float", s:nord15_gui, "", s:nord15_gui, "", "", "")
vim.api.nvim_set_hl(0, "Float", { fg = nord15_gui, ctermfg = nord15_term })
-- call s:hi("Function", s:nord8_gui, "", s:nord8_gui, "", "", "")
vim.api.nvim_set_hl(0, "Function", { fg = nord8_gui, ctermfg = nord8_term })
-- call s:hi("Identifier", s:nord4_gui, "", "NONE", "", "NONE", "")
-- hi! link Variable Identifier
vim.api.nvim_set_hl(0, "Identifier", { fg = nord4_gui, ctermfg = "NONE", link = "Variable" })
-- call s:hi("Include", s:nord9_gui, "", s:nord9_gui, "", "", "")
vim.api.nvim_set_hl(0, "Include", { fg = nord9_gui, ctermfg = nord9_term })
-- call s:hi("Keyword", s:nord9_gui, "", s:nord9_gui, "", "", "")
vim.api.nvim_set_hl(0, "Keyword", { fg = nord9_gui, ctermfg = nord9_term })
-- call s:hi("Label", s:nord9_gui, "", s:nord9_gui, "", "", "")
vim.api.nvim_set_hl(0, "Label", { fg = nord9_gui, ctermfg = nord9_term })
-- call s:hi("Number", s:nord15_gui, "", s:nord15_gui, "", "", "")
vim.api.nvim_set_hl(0, "Number", { fg = nord15_gui, ctermfg = nord15_term })
-- call s:hi("Operator", s:nord9_gui, "", s:nord9_gui, "", "NONE", "")
vim.api.nvim_set_hl(0, "Operator", { fg = nord9_gui, ctermfg = nord9_term })
-- call s:hi("PreProc", s:nord9_gui, "", s:nord9_gui, "", "NONE", "")
-- hi! link PreCondit PreProc
vim.api.nvim_set_hl(0, "PreProc", { fg = nord9_gui, ctermfg = nord9_term, link = "PreCondit" })
-- call s:hi("Repeat", s:nord9_gui, "", s:nord9_gui, "", "", "")
vim.api.nvim_set_hl(0, "Repeat", { fg = nord9_gui, ctermfg = nord9_term })
-- call s:hi("Special", s:nord4_gui, "", "NONE", "", "", "")
vim.api.nvim_set_hl(0, "Special", { fg = nord4_gui, ctermfg = "NONE" })
-- call s:hi("SpecialChar", s:nord13_gui, "", s:nord13_gui, "", "", "")
vim.api.nvim_set_hl(0, "SpecialChar", { fg = nord13_gui, ctermfg = nord13_term })
-- call s:hi("SpecialComment", s:nord8_gui, "", s:nord8_gui, "", s:italicize_comments, "")
vim.api.nvim_set_hl(
	0,
	"SpecialComment",
	{ fg = nord8_gui, ctermfg = nord8_term, italic = true, cterm = { italic = true } }
)
-- call s:hi("Statement", s:nord9_gui, "", s:nord9_gui, "", "", "")
vim.api.nvim_set_hl(0, "Statement", { fg = nord9_gui, ctermfg = nord9_term })
-- call s:hi("StorageClass", s:nord9_gui, "", s:nord9_gui, "", "", "")
vim.api.nvim_set_hl(0, "StorageClass", { fg = nord9_gui, ctermfg = nord9_term })
-- call s:hi("String", s:nord14_gui, "", s:nord14_gui, "", "", "")
vim.api.nvim_set_hl(0, "String", { fg = nord14_gui, ctermfg = nord14_term })
-- call s:hi("Structure", s:nord9_gui, "", s:nord9_gui, "", "", "")
vim.api.nvim_set_hl(0, "Structure", { fg = nord9_gui, ctermfg = nord9_term })
-- call s:hi("Tag", s:nord4_gui, "", "", "", "", "")
vim.api.nvim_set_hl(0, "Tag", { fg = nord4_gui })
-- call s:hi("Todo", s:nord13_gui, "NONE", s:nord13_gui, "NONE", "", "")
vim.api.nvim_set_hl(0, "Todo", { fg = nord13_gui, bg = "NONE", ctermfg = nord13_term, ctermbg = "NONE" })
-- call s:hi("Type", s:nord9_gui, "", s:nord9_gui, "", "NONE", "")
vim.api.nvim_set_hl(0, "Type", { fg = nord9_gui, ctermfg = nord9_term })
-- call s:hi("Typedef", s:nord9_gui, "", s:nord9_gui, "", "", "")
vim.api.nvim_set_hl(0, "Typedef", { fg = nord9_gui, ctermfg = nord9_term })

-- Setup function
local M = {}

function M.setup() end

return M
