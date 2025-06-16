return {
	{
		"mhartington/formatter.nvim",
		event = { "BufWritePost" },
		kyes = { "<leaver>F" },
		config = function()
			-- Utilities for creating configurations
			require("formatter").setup({
				filetype = {
					json = { require("formatter.filetypes.json").jq },
					sh = { require("formatter.filetypes.sh").shfmt },
				},
			})

			-- autoformat on save
			local id = vim.api.nvim_create_autocmd("BufWritePost", {
				callback = function()
					vim.cmd("FormatWrite")
				end,
			})

			local enabled = true
			local format_toggle = function()
				if enabled == true then
					vim.api.nvim_del_autocmd(id)
					enabled = false
					vim.notify("disabled formmatting", vim.log.levels.INFO)
					return
				end

				id = vim.api.nvim_create_autocmd("BufWritePost", {
					callback = function()
						vim.cmd("FormatWrite")
					end,
				})
				enabled = true
				vim.notify("enabled formmatting", vim.log.levels.INFO)
			end

			vim.keymap.set({ "n" }, "<leader>F", format_toggle, { noremap = true, desc = "Toggle Formatting" })
		end,
	},
}
