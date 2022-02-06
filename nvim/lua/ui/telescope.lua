local packer = require("packer")
packer.use({
	"nvim-telescope/telescope.nvim",
	requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" }, { "folke/which-key.nvim" } },
	config = function()
		require("telescope").setup({
			defaults = {
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--hidden",
					"--smart-case",
				},
				file_ignore_patterns = {
					"%.git/.*",
					"%.vim/.*",
					"node_modules/.*",
					"%.idea/.*",
					"%.vscode/.*",
					"%.history/.*",
				},
			},
		})
		local wk = require("which-key")
		local telescope_builtin = require("telescope.builtin")
		wk.register({
			f = {
				name = "File", -- optional group name
				f = {
					function()
						telescope_builtin.find_files({ hidden = true })
					end,
					"Find File",
					noremap = true,
				},
				g = { telescope_builtin.live_grep, "Find in File", noremap = true },
				o = { telescope_builtin.oldfiles, "Open Recent File", noremap = true },
				r = { telescope_builtin.resume, "Resume last picker", noremap = true },
				p = { telescope_builtin.pickers, "List all pickers", noremap = true },
				b = { telescope_builtin.buffers, "List open buffers", noremap = true },
			},
		}, {
			prefix = "<leader>",
		})
	end,
})
