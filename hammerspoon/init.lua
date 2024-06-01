-- macro keys:
--  - layer 1: 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
--  - layer 2: a, b, c, d, e, f, g, h, i, j
--  - layer 3: <not yet set>

-- global mute
local global_mute = function()
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
end

local app_launcher = function(name)
	return function()
		hs.application.launchOrFocus(name)
	end
end

-- focus apps
local layer_1 = {
	-- main key
	global_mute,
	-- row 1
	app_launcher("Kitty"),
	app_launcher("Safari"),
	app_launcher("Music"),
	-- row 2
	app_launcher("Activity Monitor"),
	app_launcher("Mail"),
	app_launcher("Calendar"),
	-- row 3
	app_launcher("Steam"),
	app_launcher("Maps"),
	app_launcher("Weather"),
}
for index, keypressfn in ipairs(layer_1) do
	local shortcut = tostring(index - 1)
	hs.hotkey.bind({ "shift", "ctrl", "alt" }, shortcut, nil, keypressfn)
end


-- audio playback
local layer_2 = {
	-- main key
	hs.itunes.displayCurrentTrack,
	-- row 1
	hs.itunes.previous,
	hs.itunes.playpause,
	hs.itunes.next,
	-- row 2
	-- row 3
}
for index, keypressfn in ipairs(layer_2) do
	-- this starts with the letter 'a' and iterates through it
	local shortcut = string.char(96 + index)
	hs.hotkey.bind({ "shift", "ctrl", "alt" }, shortcut, nil, keypressfn)
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
