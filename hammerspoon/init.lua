-- macro keys:
--  - layer 0: 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 (ASCII 48 - 57)
--  - layer 1: a, b, c, d, e, f, g, h, i, j (ASCII 97 - 106)
--  - layer 2: k, l, m, n, o, p, q, r, s, t (ASCII 107 - 116)
--  - layer 3: <not set>
--
--  layer buttons:
--  - layer 0: no key
--  - layer 1: left
--  - layer 2: right
--  - layer 3: left + right

local modifier = { "shift", "ctrl", "alt" }

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

-- base layer
local layer_0 = {
	-- main key
	global_mute,
	-- row 1
	app_launcher("Kitty"),
	app_launcher("Safari"),
	app_launcher("Activity Monitor"),
	-- row 2
	app_launcher("Mail"),
	app_launcher("Calendar"),
	app_launcher("Music"),
	-- row 3
	app_launcher("Steam"),
	app_launcher("Maps"),
	app_launcher("Weather"),
}
for index, keypressfn in ipairs(layer_0) do
	local shortcut = tostring(index - 1)
	hs.hotkey.bind(modifier, shortcut, nil, keypressfn)
end

-- first layer
local layer_1 = {
	-- main key
	hs.itunes.playpause,
	-- row 1
	hs.itunes.previous,
	hs.itunes.displayCurrentTrack,
	hs.itunes.next,
	-- row 2
	-- vol down, vol up,
	-- row 3
}
for index, keypressfn in ipairs(layer_1) do
	-- this starts with the letter 'a' and iterates through it
	local shortcut = string.char(96 + index)
	hs.hotkey.bind(modifier, shortcut, nil, keypressfn)
end

ScreenProfiles = {
	["LG HDR 4K"] = { h = 1710, w = 1112, scale = 2, freq = 60, depth = 8 },
	["Built-in Retina Display"] = { h = 3008, w = 1692, scale = 2, freq = 60, depth = 8 },
}

local screen_setup = function()
	local all_screens = hs.screen.allScreens()
	for _, screen in ipairs(all_screens) do
		hs.alert.show("setting mode...")
		local newMode = ScreenProfiles[screen:name()]
		if newMode ~= nil then
			local set = screen:setMode(newMode.w, newMode.h, newMode.scale, newMode.freq, newMode.depth)
			if not set then
				hs.dialog.alert(
					200,
					200,
					function() end,
					"Failed to set mode",
					screen:name() .. ": " .. screen:currentMode().desc
				)
			end
		end
	end
	if string.match(hs.screen.primaryScreen():name(), "Built%-in") and #all_screens > 1 then
		hs.alert.show("setting primary...")
		for _, screen in ipairs(all_screens) do
			hs.alert.show(screen:name() .. ": " .. tostring(screen:id()))
			if not string.match(screen:name(), "Built%-in") then
				screen:setPrimary()
			end
		end
	end
end

-- second layer
local layer_2 = {
	screen_setup,
}
for index, keypressfn in ipairs(layer_2) do
	-- this starts with the letter 'a' and iterates through it
	local shortcut = string.char(106 + index)
	hs.hotkey.bind(modifier, shortcut, nil, keypressfn)
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

hs.ipc.cliInstall()
hs.alert.show("Config loaded")
hs.loadSpoon("EmmyLua")
