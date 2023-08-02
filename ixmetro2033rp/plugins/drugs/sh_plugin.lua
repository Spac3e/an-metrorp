local PLUGIN = PLUGIN

PLUGIN.name = "Drugs"
PLUGIN.author = "Huargenn"
PLUGIN.description = "Add drugs."

ix.char.RegisterVar("drugTimer", {
	field = "drugTimer",
	fieldType = ix.type.number,
	default = 600,
	isLocal = true,
	bNoDisplay = true
})

ix.util.Include("sv_hooks.lua")