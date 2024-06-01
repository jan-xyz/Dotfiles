-- global mute
hs.hotkey.bind({ "shift", "ctrl", "alt" }, "0", nil, function()
	local audio = hs.audiodevice.defaultInputDevice()
	if audio then
		local muted = audio:inputMuted()
		if muted then
			hs.alert.show("unmuting " .. audio:name())
		else
			hs.alert.show("muting " .. audio:name())
		end
		audio:setInputMuted(not muted)
	end
end)

-- focus apps
local apps = {
	"Kitty", -- 1
	"Safari", -- 2
}
for index, item in ipairs(apps) do
	local shortcut = tostring(index)
	local name = item
	hs.hotkey.bind({ "shift", "ctrl", "alt" }, shortcut, name, function()
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
