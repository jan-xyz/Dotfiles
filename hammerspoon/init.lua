-- focus apps
local apps = {
	{ "k", "Kitty" },
	{ "s", "Safari" },
}
for _, item in ipairs(apps) do
	local shortcut = item[1]
	local name = item[2]
	hs.hotkey.bind({ "cmd", "ctrl", "alt" }, shortcut, name, function()
		hs.application.launchOrFocus(name)
	end)
end

-- Reload the Hammerspoon configuration
local reloadConfig = function(files)
	local doReload = false
	for _, file in pairs(files) do
		if file:sub(-4) == ".lua" then
			doReload = true
		end
	end
	if doReload then
		hs.reload()
	end
end

ConfigReloadWatcher = hs.pathwatcher.new(hs.configdir, reloadConfig):start()
hs.alert.show("Config loaded")
