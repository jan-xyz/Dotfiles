-- macro keys:
--  - layer 1: 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
--  - layer 2: a, b, c, d, e, f, g, h, i, j
--  - layer 3: <not yet set>

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
	else
		hs.alert.show("no audio input device")
	end
end)

-- focus apps
local apps = {
	"Kitty",
	"Safari",
	"Music",
	"Steam",
}
for index, item in ipairs(apps) do
	local shortcut = tostring(index)
	local name = item
	hs.hotkey.bind({ "shift", "ctrl", "alt" }, shortcut, name, function()
		hs.application.launchOrFocus(name)
	end)
end

-- audio playback
hs.hotkey.bind({ "shift", "ctrl", "alt" }, "a", nil, function()
	hs.itunes.displayCurrentTrack()
end)
hs.hotkey.bind({ "shift", "ctrl", "alt" }, "b", nil, function()
	hs.itunes.previous()
end)
hs.hotkey.bind({ "shift", "ctrl", "alt" }, "c", nil, function()
	hs.itunes.playpause()
end)
hs.hotkey.bind({ "shift", "ctrl", "alt" }, "d", nil, function()
	hs.itunes.next()
end)

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
