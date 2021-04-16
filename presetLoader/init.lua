-- _                       __          ___                       
-- | |                      \ \        / / |                      
-- | | _____  __ _ _ __  _   \ \  /\  / /| |__   ___  ___ _______ 
-- | |/ / _ \/ _` | '_ \| | | \ \/  \/ / | '_ \ / _ \/ _ \_  / _ \
-- |   <  __/ (_| | | | | |_| |\  /\  /  | | | |  __/  __// /  __/
-- |_|\_\___|\__,_|_| |_|\__,_| \/  \/   |_| |_|\___|\___/___\___|
-------------------------------------------------------------------------------------------------------------------------------
-- This mod was created by keanuWheeze from CP2077 Modding Tools Discord. 
--
-- You are free to use this mod as long as you follow the following license guidelines:
--    * It may not be uploaded to any other site without my express permission.
--    * Using any code contained herein in another mod requires full credits / asking me.
--    * You may not fork this code and make your own competing version of this mod available for download without my permission.
--    
------------------------------------------------------------------------------------------------------------------------------- 

presetLoader = {
	isUIVisible = false,
	ui = require("modules/ui"),
	fileSys = require("modules/fileSys"),
	GameSettings = require("modules/GameSettings"), -- Made by psiberx, https://github.com/psiberx/cp2077-cet-kit
	CPS = nil,
	CPSinstalled = false,

	presets = {},
	hks = {}
}

function presetLoader:new()

registerForEvent("onInit", function()
	pcall(function ()
		presetLoader.CPS = GetMod("CPStyling"):New()
	end)
	if presetLoader.CPS ~= nil then
		presetLoader.CPSinstalled = true
	end
	presetLoader.fileSys.tryCreateConfig("config.json", {hk1 = "", hk2 = "", hk3 = "", hk4 = "", hk5 = ""})
	presetLoader.hks = presetLoader.fileSys.loadFile("config.json")   
end)

registerForEvent("onDraw", function()
	if presetLoader.isUIVisible then	
		presetLoader.ui.draw(presetLoader)
	end
end)

registerForEvent("onOverlayOpen", function()
    presetLoader.isUIVisible = true
end)

registerForEvent("onOverlayClose", function()
    presetLoader.isUIVisible = false
end)

registerHotkey('settingsHK1', 'Settings preset: Hotkey 1', function()
	presetLoader.GameSettings.ImportFrom(tostring("presets/" .. presetLoader.hks.hk1))
	presetLoader.GameSettings.Save()
end)

registerHotkey('settingsHK2', 'Settings preset: Hotkey 2', function()
	presetLoader.GameSettings.ImportFrom(tostring("presets/" .. presetLoader.hks.hk2))
	presetLoader.GameSettings.Save()
end)

registerHotkey('settingsHK3', 'Settings preset: Hotkey 3', function()
	presetLoader.GameSettings.ImportFrom(tostring("presets/" .. presetLoader.hks.hk3))
	presetLoader.GameSettings.Save()
end)

registerHotkey('settingsHK3', 'Settings preset: Hotkey 4', function()
	presetLoader.GameSettings.ImportFrom(tostring("presets/" .. presetLoader.hks.hk4))
	ppresetLoaderL.GameSettings.Save()
end)

registerHotkey('settingsHK3', 'Settings preset: Hotkey 5', function()
	presetLoader.GameSettings.ImportFrom(tostring("presets/" .. presetLoader.hks.hk5))
	presetLoader.GameSettings.Save()
end)

end

return presetLoader:new()