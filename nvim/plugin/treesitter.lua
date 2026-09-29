vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == "nvim-treesitter" and kind == "update" then
			if not ev.data.active then
				vim.cmd.packadd("nvim-treesitter")
			end
			vim.cmd("TSUpdate")
		end
	end,
})

vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	"https://github.com/nvim-treesitter/nvim-treesitter-context",
})

require("nvim-treesitter").install({
	"bash",
	"cpp",
	"dart",
	"dockerfile",
	"fish",
	"go",
	"gomod",
	"gosum",
	"gotmpl",
	"haskell",
	"javascript",
	"json",
	"jsonnet",
	"kotlin",
	"lua",
	"markdown",
	"markdown_inline",
	"proto",
	"python",
	"query",
	"rust",
	"scala",
	"swift",
	"tsx",
	"typescript",
	"vim",
	"vimdoc",
	"yaml",
})

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("my.treesitter", {}),
	callback = function(args)
		pcall(vim.treesitter.start, args.buf)
	end,
})

require("treesitter-context").setup({
	enable = true,
	mode = "topline",
	max_lines = 3,
})
