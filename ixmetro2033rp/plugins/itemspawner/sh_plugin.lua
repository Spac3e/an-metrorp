local PLUGIN = PLUGIN

PLUGIN.name = "Item Spawner System"
PLUGIN.author = "Gary Tate"
PLUGIN.description = "Allows staff to select item spawn points with great configuration."

PLUGIN.spawner = PLUGIN.spawner or {}
PLUGIN.spawner.positions = PLUGIN.spawner.positions or {}

--[[
PLUGIN.items.common = {
	"broken_flashlight",
	"flashlight",
	"tape",
	"battery",
	"gunpowder",
	"newspaper",
	"porn",
	"normal_saw",
	"normal_sciss",
	"normal_screwdriver",
	"normal_clipper",
	"normal_wrench",
	"doll",
	"milk_carton",
	"canned_soup",
	"baked_beans",
	"coffee",
	"mushroom_vodka",
	"ashot",
	"bandage",
	"melon",
	"vodka",
	"water",
	"zip_tie",
	"saw",
	"sewingkit",
	"welder",
	"stewpot",
	"tongs",
	"pot",
	"fryingpan",
	"wood",
	"steel",
	"cloth",
	"leather",
	"platics",
	"gears",
	"lead",
	"oil",
	"tincooper",
	"cooper",
	"glass",
	"plastic",
	"health_vial",
	"medic_kit",
	"pigmeat",
	"preppedsteak",
	"sardines",
}

PLUGIN.items.rare = {
	"ballisticfiber",
	"broken_bastard",
	"broken_duplet",
	"broken_ashot",
	"broken_lowlife",
	"repair_kit",
	"electronics",
	"normal_hammer",
	"weapon_parts",
	"repair_kit",
	"broken_radio",
	"tihar",
	"saiga",
	"uboinik",
	"lowlife",
	"357",
	"doublet",
	"bastard",
	"kalash",
	"kalash_special",
	"vsv",
	"guitar",
	"gold",
	"ar2ammo",
	"pistolammo",

}
]]--

ix.util.Include("sh_config.lua")
ix.util.Include("sh_commands.lua")
ix.util.Include("sv_hooks.lua")
ix.util.Include("cl_hooks.lua")
