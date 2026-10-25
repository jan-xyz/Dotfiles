local header = table.concat({
	"",
	"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
	"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⠉⢳⠴⢲⠂⠀⠀⠀⠀⠀",
	"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⠤⠤⠤⠤⠤⠤⠤⠤⠤⠖⠊⠀⣠⠎⠀⡞⢹⠏⠀⠀⠀⠀",
	"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡴⠊⠁⠀⠀⠀⠀⠀⢀⡠⠤⠄⠀⠀⠀⠁⠀⠀⢀⠀⢸⠀⠀⠀⠀⠀",
	"⠀⠀⠀⠀⠀⣠⠤⠤⠄⣀⠀⠀⠀⠀⢀⣌⠀⠀⠀⠀⠀⢀⣠⣆⡁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠘⡄⠀⠀⠀⠀",
	"⠀⠀⠀⠀⡴⠁⠀⠀⠐⠛⠉⠁⠀⠀⣉⠉⠉⠉⠑⠒⠉⠁⠀⠀⢸⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢧⠀⠱⡀⠀⠀⠀",
	"⠀⠀⠀⢰⣥⠆⠀⠀⠀⣠⣴⣶⣿⣿⣿⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⢇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⡆⠀⠑⡄⠀⠀",
	"⠀⠀⢀⡜⠁⠀⠀⢀⠀⠻⣿⣿⣿⠟⠁⠀         ⢸⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⠀⠀⠸⡀⠀",
	"⠀⢀⣮⢖⣧⢠⠀⣿⠇⠀⠀⠁⠀⠀⠀⠠⠀⢀⣠⣴⣤⡀⠀⠀⠀⠈⡗⢄⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⢱⠀",
	"⠀⣼⠃⣼⣿⠘⠀⠀⠀⢠⣶⣿⡆⠀⠀⠁⣠⠊⣸⣿⣿⣿⡄⠀⠀⠀⡇⠀⢑⣄⠀⠀⠀⠀⠀⠀⢠⠃⠀⠀⠸⡆",
	"⠀⣿⢰⣿⣿⠀⠀⠀⠀⠙⠻⠿⠁⠀⠀⠠⠁⠀⣿⣿⣿⣿⡇⠀⠀⠀⠇⠀⢻⣿⣷⣦⣀⡀⣀⠠⠋⠀⠀⠀⢀⡇",
	"⠈⠉⠺⠿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⢿⣿⣿⣿⠇⠀⠀⠀⠀⠀⠈⢿⣿⣿⣿⣿⢦⡀⠀⠀⠀⠀⡸⠀",
	"⠘⣟⠦⢀⠀⠀⢠⠀⠀⡠⠀⠀⠀⠀⠀⠀⠉⠉⠉⠉⠁⣀⠔⠀⠀⠀⠀⠀⠀⠀⠛⠻⠟⠋⠀⠙⢦⠀⣠⠜⠀⠀",
	"⠀⠈⠑⠤⡙⠳⣶⣦⣤⣤⣤⣤⣤⣤⣤⣤⣴⣶⡶⠞⠁⠀⠀⣠⠖⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠈⢯⠁⠀⠀⠀",
	"⠀⠀⠀⠀⠈⢳⠤⣙⡻⠿⣿⣿⣿⣿⡿⠿⠛⠉⠀⢀⣀⡤⡚⠁⠀⠀⠀⠀⠀⠀⣧⠖⣁⣤⣦⠀⠀⠈⢇⠀⠀⠀",
	"⠀⠀⠀⠀⠀⢸⠀⢀⣩⣍⠓⠒⣒⠒⠒⠒⠒⠊⠉⠁⢀⡟⠀⠀⣾⣷⠀⠀⠀⠀⠏⢴⣿⣿⣿⠀⠀⠀⢸⠀⠀⠀",
	"⠀⠀⠀⠀⠀⠘⣶⣿⣿⣿⠀⠀⠈⠒⢄⣀⡀⠀⠀⠀⣼⣶⣿⡇⠈⠋⠀⠀⠀⡼⠀⠈⠻⣿⡿⠀⠀⠀⢸⠀⠀⠀",
	"⠀⠀⠀⠀⠀⠀⠹⡿⠿⠋⠀⠀⠀⠀⡜⠁⠈⢯⡀⢺⣿⣿⣿⠃⠀⠀⠀⢀⣼⣇⠀⠀⠀⠀⠀⠀⠀⠀⡞⠀⠀⠀",
	"⠀⠀⠀⠀⠀⠀⠀⣿⣦⣄⣠⣀⣠⠞⠀⠀⠀⠈⠛⣿⡛⠛⠁⠀⠀⠀⣠⠊⠀⠈⢦⣄⣀⣀⣀⣀⢀⡼⠁⠀⠀⠀",
	"⠀⠀⠀⠀⠀⠀⠀⠉⠉⠉⠛⠉⠀⠀⠀⠀⠀⠀⠘⠛⠿⣿⠷⡾⠗⠊⠁⠀⠀⠀⠈⠉⠙⠛⠛⠛⠉⠀⠀⠀⠀⠀",
	"",
}, "\n")

local starter = require("mini.starter")
local extra = require("mini.extra")

local function item(name, action)
	return { name = name, action = action, section = "Actions" }
end

-- plugins still on disk without a matching vim.pack.add() in this session
local function inactive_plugins()
	return vim.iter(vim.pack.get(nil, { info = false }))
		:filter(function(p)
			return not p.active
		end)
		:map(function(p)
			return p.spec.name
		end)
		:totable()
end

-- only offered when there is something to remove
local function cleanup_item()
	local names = inactive_plugins()
	if #names == 0 then
		return {}
	end
	local plural = #names == 1 and "" or "s"
	return {
		item(("Remove %d unused plugin%s"):format(#names, plural), function()
			vim.pack.del(names)
			starter.refresh()
		end),
	}
end

starter.setup({
	evaluate_single = true,
	header = header,
	footer = "",
	-- mini.starter derives each item's query prefix from its name and highlights
	-- it, so names have to start with distinct letters to stay one keypress
	items = {
		item("Open recent files", function()
			extra.pickers.oldfiles({ current_dir = true })
		end),
		item("Explore files", function()
			MiniFiles.open()
		end),
		item("Find file", function()
			MiniPick.builtin.files()
		end),
		item("Search word", function()
			MiniPick.builtin.grep_live()
		end),
		item("Update plugins", function()
			vim.pack.update()
		end),
		cleanup_item,
	},
	content_hooks = {
		starter.gen_hook.adding_bullet(""),
		starter.gen_hook.aligning("center", "center"),
	},
})

vim.api.nvim_set_hl(0, "MiniStarterHeader", { fg = "#A3BE8C", ctermfg = 2 })

vim.api.nvim_create_autocmd("User", {
	group = vim.api.nvim_create_augroup("my.starter_keys", {}),
	pattern = "MiniStarterOpened",
	callback = function(args)
		vim.keymap.set("n", "j", function()
			MiniStarter.update_current_item("next")
		end, { buffer = args.buf, desc = "Next item" })
		vim.keymap.set("n", "k", function()
			MiniStarter.update_current_item("prev")
		end, { buffer = args.buf, desc = "Previous item" })
	end,
})
