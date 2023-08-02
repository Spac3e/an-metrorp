
local PLUGIN = PLUGIN

PLUGIN.name = "Metro UI"
PLUGIN.author = "Gary Tate"
PLUGIN.description = "Adds a custom Metro UI"

if (CLIENT) then
	PLUGIN.iconWhitelist = {
		DEFAULT = "tabmenu/settings",
		SETTINGS = "tabmenu/settings",
		SCOREBOARD = "tabmenu/scoreboard",
		INVENTORY = "tabmenu/inventory",
		RETURN = "tabmenu/return",
		CHARACTERS = "tabmenu/characters",
		FABRICATION = "tabmenu/fabrication",
		HELP = "tabmenu/help",
		YOU = "tabmenu/you",
		CONFIG = "tabmenu/config"
	}

	function PLUGIN:LoadFonts(font, genericFont)
		surface.CreateFont("ixMetroMenuFontSmall", {
			font = "Capture Smallz",
			size = ScreenScale(6),
			extended = true,
			weight = 100
		})

		surface.CreateFont("ixMetroMenuFont", {
			font = "Capture Smallz",
			size = ScreenScale(12),
			extended = true,
			weight = 100
		})
	end
end
