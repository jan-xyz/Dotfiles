return { {
	"mhartington/formatter.nvim",
	config = function()
		-- Utilities for creating configurations
		require("formatter").setup({
			filetype = {
				proto = { { exe = "buf", args = { "format" }, stdin = true } },
				sh = { require("formatter.filetypes.sh").shfmt },
				markdown = { { exe = "markdownlint", args = { "--fix" }, ignore_exitcode = true } },
			}

		})

		-- autoformat on save
		vim.api.nvim_create_autocmd("BufWritePost", {
			callback = function()
				vim.cmd("FormatWrite")
			end,
		})
	end
} }
