local packer = require("packer")

-- rename and other input boxes
packer.use({ "stevearc/dressing.nvim" })

-- setup (un-)commenting lines and selection
packer.use({
	"b3nj5m1n/kommentary",
	config = function()
		require("kommentary.config").configure_language("default", {
			prefer_single_line_comments = true,
		})
	end,
})

-- setup surround text objects
packer.use({
	"kylechui/nvim-surround",
	config = function()
		require("nvim-surround").setup({
			-- Configuration here, or leave empty to use defaults
		})
	end,
})

-- setup register management
packer.use({
	"AckslD/nvim-neoclip.lua",
	requires = { "nvim-telescope/telescope.nvim", "folke/which-key.nvim" },
	config = function()
		require("neoclip").setup()
		-- keymap
		local wk = require("which-key")
		wk.register({
			p = {
				name = "registers", -- optional group name
				p = { require("telescope").extensions.neoclip.default, "pick register", noremap = true },
			},
		}, {
			mode = "n",
			prefix = "<leader>",
		})
	end,
})

-- setup session management
packer.use {
	"rmagatti/auto-session",
	config = function()
		require("auto-session").setup {
			log_level = "error",
			auto_session_suppress_dirs = { "~/" }
		}
	end
}

-- changing the default notification boxes
packer.use({
	"rcarriga/nvim-notify",
	config = function()
		require("notify").setup({ level = "info" })
		vim.notify = require("notify")

		-- LSP load progress
		-- https://github.com/mitinarseny/dotfiles/blob/4c78f07c0d046d491d086651aea6cf65ea9e6a1a/.config/nvim/after/plugin/lsp.lua#L185-L233
		-- https://github.com/mitinarseny/dotfiles/blob/4c78f07c0d046d491d086651aea6cf65ea9e6a1a/.config/nvim/lua/spinner.lua
		local client_notifs = {}
		local spinner_frames = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" } -- spinners

		local function update_spinner(notif_data) -- update spinner helper function to defer
			if notif_data.spinner then
				local new_spinner = (notif_data.spinner + 1) % #spinner_frames
				notif_data.spinner = new_spinner

				notif_data.notification = vim.notify(nil, nil, {
					hide_from_history = true,
					icon = spinner_frames[new_spinner],
					replace = notif_data.notification,
				})

				vim.defer_fn(function()
					update_spinner(notif_data)
				end, 100)
			end
		end

		vim.api.nvim_create_augroup("lsp_notify", { clear = true }) -- create augroup
		vim.api.nvim_create_autocmd("User", {
			pattern = "LspProgressUpdate", -- LSP Progress Update autocommand
			group = "lsp_notify",
			desc = "LSP progress notification",
			callback = function()
				local bufnr = vim.api.nvim_get_current_buf() -- get buffer number
				for _, client in pairs(vim.lsp.buf_get_clients()) do -- loop over each client to check notifications
					if not client_notifs[bufnr] then -- create buffer specific notification table if not exists
						client_notifs[bufnr] = {}
					end
					if not client_notifs[bufnr][client.id] then -- create buffers client  specific  notification table if not exists
						client_notifs[bufnr][client.id] = {}
					end
					local notif_data = client_notifs[bufnr][client.id] -- set notif_data variable
					local progress = nil
					for _, progress_msg in pairs(client.messages.progress) do
						progress = true -- expose if a progress exists
						if not progress_msg.done then
							progress = progress_msg -- get clients first not done progress messages
							break
						end
					end
					if type(progress) == "table" and progress.percentage and progress.percentage ~= 0 then -- if there is a progress message
						local notify_opts = {} -- define notification options
						local new_msg = notif_data.notification == nil -- if it's a new message set different options
						if new_msg then -- for new messages set a title, initialize icone and disable timeout
							notify_opts = {
								title = client.name .. (#progress.title > 0 and ": " .. progress.title or ""),
								icon = spinner_frames[1],
								timeout = false,
							}
						else -- for existing messages just update the existing notification
							notify_opts = { replace = notif_data.notification }
						end
						notif_data.notification = vim.notify( -- notify with percentage and message
							(progress.percentage and progress.percentage .. "%\t" or "") .. (progress.message or ""),
							"info",
							notify_opts
						)
						if new_msg then -- if it's a new message, start the update spinner background job
							update_spinner(notif_data)
						end
					elseif progress and not vim.tbl_isempty(notif_data) then -- if there is finished progress and a notification, complete it
						notif_data.notification = vim.notify(
							"Complete",
							"info",
							{ icon = "", replace = notif_data.notification, timeout = 3000 }
						)
						notif_data = {} -- clear notification data
					end
				end
			end,
		})
	end,
})
