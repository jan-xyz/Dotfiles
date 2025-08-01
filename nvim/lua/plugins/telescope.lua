-- this auto command and the local function work together
-- to format and color a path output in Telescope.
-- See: https://github.com/nvim-telescope/telescope.nvim/issues/2014#issuecomment-1873229658
vim.api.nvim_create_autocmd("FileType", {
	pattern = "TelescopeResults",
	callback = function(ctx)
		vim.api.nvim_buf_call(ctx.buf, function()
			vim.fn.matchadd("TelescopeParent", "\t\t.*$")
			vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
		end)
	end,
})

return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/popup.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-lua/plenary.nvim",

			-- Plugins
			"nvim-telescope/telescope-file-browser.nvim",
			"otavioschwanck/telescope-alternate",
		},
		cmd = { "Telescope" },
		keys = {
			{ "<leader>f" },
			{ "<leader>e" },
			{ "<leader>E" },
			{ "<leader>b" },
			{ "<leader>j" },
			{ "<leader>'" },
			{ "<leader>/" },
			{ "<leader>?" },
			{ "<leader>o" },
			{ "<leader>g?" },
			{ "ga" },
		},
		config = function()
			require("telescope").setup({
				pickers = {
					diagnostics = {
						layout_strategy = "vertical",
						line_width = "full",
					},
					buffers = {
						mappings = {
							i = {
								["<c-d>"] = "delete_buffer",
							},
							n = {
								["D"] = "delete_buffer",
							},
						},
					},
				},
				defaults = {
					path_display = { "filename_first" },
					wrap_results = true,
					layout_config = {
						vertical = {
							height = 0.9,
							width = 0.9,
						},
						center = {
							height = 0.9,
							width = 0.9,
						},
					},
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
				extensions = {
					file_browser = {
						-- disables netrw and use telescope-file-browser in its place
						hijack_netrw = true,
						git_status = true,
						hidden = true,
						-- group by type
						grouped = true,
					},
					["telescope-alternate"] = {
						presets = { "go" },
						mappings = {
							-- Kotlin
							{ "(.*)/src/main/(.*).kt", { { "[1]/src/test/[2]Test.kt", "Test", true } } },
							{ "(.*)/src/test/(.*)Test.kt", { { "[1]/src/main/[2].kt", "Original", true } } },
							-- Lua
							{ "lua/(.*).lua", { { "tests/[1]_spec.lua", "Test", true } } },
							{ "tests/(.*)_spec.lua", { { "lua/[1].lua", "Original", true } } },
							-- Gomod
							{ "go.mod", { { "go.sum", "Sum file", false } } },
							{ "go.sum", { { "go.mod", "Module file", false } } },
						},
					},
				},
			})

			require("telescope").load_extension("file_browser")
			require("telescope").load_extension("telescope-alternate")

			local telescope_builtin = require("telescope.builtin")

			local file_browser = function()
				require("telescope").extensions.file_browser.file_browser({})
			end

			local current_file = function()
				require("telescope").extensions.file_browser.file_browser({ path = "%:p:h" })
			end

			local find_file = function()
				telescope_builtin.find_files({ hidden = true })
			end

			local alternate = function()
				require("telescope-alternate.telescope").alternate({})
			end

			local recent_files = function()
				telescope_builtin.oldfiles({ cwd_only = true })
			end

			local km = vim.keymap

			-- inspired by helix mapping: https://docs.helix-editor.com/keymap.html#space-mode
			km.set("n", "<leader>f", find_file, { noremap = true, desc = "Open File Picker" })
			km.set("n", "<leader>e", file_browser, { noremap = true, desc = "Toggle or focus explorer" })
			km.set("n", "<leader>E", current_file, { noremap = true, desc = "Focus current file in explorer" })
			km.set("n", "<leader>b", telescope_builtin.buffers, { noremap = true, desc = "Open buffer picker" })
			km.set("n", "<leader>j", telescope_builtin.jumplist, { noremap = true, desc = "Open jumplist picker" })
			km.set("n", "<leader>'", telescope_builtin.resume, { noremap = true, desc = "Resume last picker" })
			km.set("n", "<leader>/", telescope_builtin.live_grep, { noremap = true, desc = "Global search" })
			km.set("n", "<leader>?", telescope_builtin.keymaps, { noremap = true, desc = "Open command palette" })
			-- additional pickers
			km.set("n", "<leader>o", recent_files, { noremap = true, desc = "Open recent file picker" })
			km.set("n", "<leader>g?", telescope_builtin.git_status, { noremap = true, desc = "status" })
			km.set("n", "ga", alternate, { noremap = true, desc = "Goto alternate file" })
		end,
	},
}
