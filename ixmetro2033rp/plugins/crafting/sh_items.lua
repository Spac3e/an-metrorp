//To add a new item or remove an item, this is the file to do it.

local ITEMS = {}

    --[[Example]]--
--[[
ITEMS.licenciapistola = {
	["name"] = "Licencia de Pistolas Blasters",
	["model"] = "models/props_lab/clipboard.mdl",
	["description"] = "Licencia.",
	["width"] = 1,
	["category"] = "Permits",
	["height"] = 1,
	["chance"] = 0
}
--]]

--[[Tools]]--

ITEMS.tongs = {
	["name"] = "Tongs",
	["model"] = "models/mosi/fallout4/props/junk/tongs.mdl",
	["description"] = "Iron tongs.",
	["category"] = "Tools",
	["width"] = 1,
	["height"] = 2,
	["chance"] = 60
}

ITEMS.normal_screwdriver = {
	["name"] = "Screwdriver",
	["model"] = "models/mosi/fallout4/props/junk/screwdriver.mdl",
	["description"] = "A full fledged screwdriver.",
	["category"] = "Tools",
	["width"] = 1,
	["height"] = 1,
	["chance"] = 42,

}

ITEMS.sewingkit = {
	["name"] = "Sewing kit",
	["model"] = "models/mosi/fallout4/props/junk/bobbypinbox.mdl",
	["description"] = "A basic sewing kit.",
	["category"] = "Tools",
	["width"] = 1,
	["height"] = 1,
	["chance"] = 39
}

ITEMS.welder = {
	["name"] = "Welder",
	["model"] = "models/mosi/fallout4/props/junk/blowtorch.mdl",
	["description"] = "Combustion tool for the application of flame and heat for various applications, usually metallurgy.",
	["category"] = "Tools",
	["width"] = 1,
	["height"] = 2,
	["chance"] = 27
}

ITEMS.fryingpan = {
	["name"] = "Frying pan",
	["model"] = "models/mosi/fallout4/props/junk/fryingpan.mdl",
	["description"] = "For cooking.",
	["category"] = "Tools",
	["width"] = 2,
	["height"] = 1,
	["chance"] = 70
}

ITEMS.saw = {
	["name"] = "Saw",
	["model"] = "models/mosi/fallout4/props/junk/bonesaw.mdl",
	["description"] = "A somewhat sharp saw, useful for cutting certain materials.",
	["category"] = "Tools",
	["width"] = 2,
	["height"] = 1,
	["chance"] = 50
}

ITEMS.pot = {
	["name"] = "Pot",
	["model"] = "models/mosi/fallout4/props/junk/pot.mdl",
	["description"] = "For cooking.",
	["category"] = "Tools",
	["width"] = 2,
	["height"] = 2,
	["chance"] = 47
}

ITEMS.stewpot = {
	["name"] = "Stewpot",
	["model"] = "models/mosi/fallout4/props/junk/saucepan01.mdl",
	["description"] = "For cooking.",
	["category"] = "Tools",
	["width"] = 2,
	["height"] = 2,
	["chance"] = 50
}

	--Workstations--

ITEMS.industrial_furnace = {
	["name"] = "Industrial furnace.",
	["model"] = "models/props_forest/furnace01.mdl",
	["description"] = "Used to melt metals and plastics.",
	["category"] = "Workstation",
	["width"] = 2,
	["height"] = 3,
	["chance"] = 0
}

ITEMS.worktable = {
	["name"] = "Work-table.",
	["model"] = "models/props_wasteland/controlroom_desk001b.mdl",
	["description"] = "Used to work metal, cloth, leather and plastic.",
	["category"] = "Workstation",
	["width"] = 4,
	["height"] = 3,
	["chance"] = 1
}

ITEMS.stovetop = {
	["name"] = "Stove",
	["model"] = "models/props_c17/furniturestove001a.mdl",
	["description"] = "A stovetop modified to be used with either charcoal, wood, or gas connections.",
	["category"] = "Workstation",
	["width"] = 4,
	["height"] = 4,
	["chance"] = 1
}

	--Scrap--
ITEMS.steel_pipe = {
    ["name"] = "Steel Pipe",
    ["model"] = "models/props_lab/pipesystem03c.mdl",
    ["description"] = "A steel pipe from an old pipe system. Used to craft types of scrap weapons.",
    ["category"] = "Scrap",
    ["width"] = 2,
    ["height"] = 1,
    ["chance"] = 37
}


-- Scrap

ITEMS.water_filter = {
	["name"] = "Water Filter",
	["model"] = "models/illusion/eftcontainers/waterfilter.mdl",
	["description"] = "A basic water water filter used for small-scale purification operations.",
	["width"] = 1,
	["height"] = 1,
	["chance"] = 29
}

ITEMS.string = {
	["name"] = "String",
	["model"] = "models/illusion/eftcontainers/silicontube.mdl",
	["description"] = "A long, bundle of string, offering a one time use in some cases.",
	["width"] = 1,
	["height"] = 1,
	["chance"] = 49
}


ITEMS.wood = {
	["name"] = "Wood",
	["model"] = "models/mosi/fallout4/props/junk/components/wood.mdl",
	["description"] = "A pair of wooden planks.",
	["category"] = "Scrap",
	["width"] = 1,
	["height"] = 1,
	["chance"] = 41
}

ITEMS.steel = {
	["name"] = "Steel",
	["model"] = "models/mechanics/solid_steel/plank_4.mdl",
	["description"] = "A steel plank.",
	["category"] = "Scrap",
	["width"] = 1,
	["height"] = 1,
	["chance"] = 31
}

ITEMS.welding_fuel = {
	["name"] = "Welding Fuel",
	["model"] = "models/kek1ch/balloon_poison_gas.mdl",
	["description"] = "A single use cannister filled with Argon Gas for the purpose of welding.",
	["category"] = "Scrap",
	["width"] = 1,
	["height"] = 1,
	["chance"] = 32
}

ITEMS.ceramic = {
	["name"] = "Ceramic",
	["model"] = "models/mosi/fallout4/props/junk/components/ceramic.mdl",
	["description"] = "A pair of clay bricks for pottery.",
	["category"] = "Scrap",
	["width"] = 1,
	["height"] = 1,
	["chance"] = 39
}

ITEMS.asbestos = {
	["name"] = "Asbestos",
	["model"] = "models/mosi/fallout4/props/junk/components/asbestos.mdl",
	["description"] = "A cancer-causing chemical that is useful in some items.",
	["category"] = "Scrap",
	["width"] = 1,
	["height"] = 1,
	["chance"] = 40
}

ITEMS.cloth = {
	["name"] = "Cloth",
	["model"] = "models/mosi/fallout4/props/junk/components/cloth.mdl",
	["description"] = "A roll of cloth.",
	["category"] = "Scrap",
	["width"] = 1,
	["height"] = 1,
	["chance"] = 53
}

ITEMS.leather = {
	["name"] = "Leather",
	["model"] = "models/mosi/fallout4/props/junk/components/leather.mdl",
	["description"] = "A roll of leather.",
	["category"] = "Scrap",
	["width"] = 1,
	["height"] = 1,
	["chance"] = 20
}

ITEMS.plastic = {
	["name"] = "Plastic",
	["model"] = "models/mosi/fallout4/props/junk/pizzabox.mdl",
	["description"] = "A piece of plastic.",
	["category"] = "Scrap",
	["width"] = 1,
	["height"] = 1,
	["chance"] = 40
}

ITEMS.ballisticfiber = {
	["name"] = "Balistic fiber.",
	["model"] = "models/mosi/fallout4/props/junk/components/ballisticfiber.mdl",
	["description"] = "A roll of ballistic fiber.",
	["category"] = "Scrap",
	["width"] = 1,
	["height"] = 1,
	["chance"] = 17
}

ITEMS.glass = {
	["name"] = "Glass.",
	["model"] = "models/mosi/fallout4/props/junk/components/glass.mdl",
	["description"] = "Broken glass.",
	["category"] = "Scrap",
	["width"] = 1,
	["height"] = 1,
	["chance"] = 50
}

ITEMS.cooper = {
	["name"] = "Cooper",
	["model"] = "models/mosi/fallout4/props/junk/components/copper.mdl",
	["description"] = "A cooper ingot.",
	["category"] = "Scrap",
	["width"] = 2,
	["height"] = 1,
	["chance"] = 41
}

ITEMS.gold = {
	["name"] = "Gold",
	["model"] = "models/mosi/fallout4/props/junk/components/gold.mdl",
	["description"] = "A gold ingot.",
	["category"] = "Scrap",
	["width"] = 2,
	["height"] = 1,
	["chance"] = 5
}

ITEMS.lead = {
	["name"] = "Lead",
	["model"] = "models/mosi/fallout4/props/junk/components/lead.mdl",
	["description"] = "A lead ingot.",
	["category"] = "Scrap",
	["width"] = 2,
	["height"] = 1,
	["chance"] = 27
}


ITEMS.gears = {
	["name"] = "Gears box",
	["model"] = "models/mosi/fallout4/props/junk/components/gears.mdl",
	["description"] = "Box that include inside gears.",
	["category"] = "Scrap",
	["width"] = 1,
	["height"] = 1,
	["chance"] = 35
}

ITEMS.oil = {
	["name"] = "Oil",
	["model"] = "models/mosi/fallout4/props/junk/components/oil.mdl",
	["description"] = "A bottle with oil.",
	["category"] = "Scrap",
	["width"] = 1,
	["height"] = 1,
	["chance"] = 27
}

ITEMS.acid = {
	["name"] = "Acid",
	["model"] = "models/mosi/fallout4/props/junk/components/acid.mdl",
	["description"] = "A bottle with acid.",
	["category"] = "Scrap",
	["width"] = 1,
	["height"] = 1,
	["chance"] = 28,
	["rare"] = true
}

ITEMS.tincooper = {
	["name"] = "Tin of cooper",
	["model"] = "models/mosi/fallout4/props/junk/tincan01.mdl",
	["description"] = "A tin of cooper.",
	["category"] = "Scrap",
	["width"] = 1,
	["height"] = 1,
	["chance"] = 35
}

ITEMS.chemical_components = {
	["name"] = "Chemical Components",
	["model"] = "models/mosi/fallout4/props/junk/aluminumcannister.mdl",
	["description"] = "An alluminum cannister that appears to be filled with chemicals.",
	["category"] = "Scrap",
	["width"] = 1,
	["height"] = 1,
	["chance"] = 40
}

ITEMS.fuse = {
	["name"] = "Fuse",
	["model"] = "models/mosi/fallout4/props/junk/fuse.mdl",
	["description"] = "A metallic fuse intended for use in electriconics.",
	["category"] = "Scrap",
	["width"] = 1,
	["height"] = 1,
	["chance"] = 32
}

ITEMS.medal = {
	["name"] = "Prospekt Militia Medal of Heroism",
	["model"] = "models/kek1ch/tfw_badge_monolith.mdl",
	["description"] = "A sewn patch with a print of a medal. Inscribed on it, reads; 'Recognition of Service, Valour, and Protection.'",
	["category"] = "Scrap",
	["width"] = 1,
	["height"] = 1,
}

---------------------------------


--------------------------------
-- Weapon Parts

ITEMS.rifle_barrel = {
	["name"] = "Rifle Barrel Part",
	["model"] = "models/props_c17/TrapPropeller_Lever.mdl",
	["description"] = "A barrel made for rifle rounds.",
	["width"] = 2,
	["height"] = 1,
	["chance"] = 13

}

ITEMS.smg_barrel = {
	["name"] = "Submachine Barrel Part",
	["model"] = "models/kek1ch/toolkit_p.mdl",
	["description"] = "A barrel made for heavier pistol rounds.",
	["width"] = 1,
	["height"] = 1,
	["chance"] = 10

}

ITEMS.pistol_barrel = {
	["name"] = "Pistol Barrel Part",
	["model"] = "models/props_c17/TrapPropeller_Lever.mdl",
	["description"] = "A barrel made for small pistol rounds.",
	["width"] = 1,
	["height"] = 1,
	["chance"] = 19

}

ITEMS.kalash_receiver = {
	["name"] = "Kalash Receiver Parts",
	["model"] = "models/illusion/eftcontainers/ammocase.mdl",
	["description"] = "Parts designed and made for the receiver of a Kalash.",
	["width"] = 2,
	["height"] = 1,
	["chance"] = 3

}

ITEMS.bastard_receiver = {
	["name"] = "Bastard Receiver Parts",
	["model"] = "models/illusion/eftcontainers/weaponparts.mdl",
	["description"] = "Useful scrap weapon parts that can be fitted to make the receiver of a Bastard.",
	["width"] = 1,
	["height"] = 1,
	["chance"] = 10

}

ITEMS.lowlife_receiver = {
	["name"] = "Lowlife Receiver Parts",
	["model"] = "models/weapons/w_defuser.mdl",
	["description"] = "Useful scrap weapon parts that can be fitted to make the receiver of a Lowlife.",
	["width"] = 1,
	["height"] = 1,
	["chance"] = 14

}

ITEMS.pistol_handguard = {
	["name"] = "Pistol Handguard Part",
	["model"] = "models/kek1ch/waste_small.mdl",
	["description"] = "Useful scrap weapon parts that can be fitted to make the handguard of a pistol-like weapon.",
	["width"] = 1,
	["height"] = 1,
	["chance"] = 10

}

ITEMS.kalash_handguard = {
	["name"] = "Kalash Handguard Part",
	["model"] = "models/kek1ch/waste_large.mdl",
	["description"] = "Parts that resemble a Kalash-style handguard.",
	["width"] = 2,
	["height"] = 1,
	["chance"] = 5

}

ITEMS.kalash_blowback = {
	["name"] = "Kalash Blowback Mechanisms",
	["model"] = "models/illusion/eftcontainers/ammocase.mdl",
	["description"] = "Parts that appear to be for a Kalash-style gas blowback system.",
	["width"] = 2,
	["height"] = 1,
	["chance"] = 2

}

ITEMS.bastard_slider = {
	["name"] = "Bastard Slider Mechanism",
	["model"] = "models/kek1ch/dev_hand_rolling_tobacco.mdl",
	["description"] = "Useful scrap that can be fitted to make a slide mechanism for a bastard receiver.",
	["width"] = 1,
	["height"] = 1,
	["chance"] = 10

}

ITEMS.lowlife_loader = {
	["name"] = "Lowlife Self-Loading Mechanism",
	["model"] = "models/kek1ch/toolkit_r.mdl",
	["description"] = "Useful scrap and spare parts that can be fitted to make a self-loading mechanism for a Lowlife pistol.",
	["width"] = 1,
	["height"] = 1,
	["chance"] = 8

}

ITEMS.tihar_stock = {
	["name"] = "Tihar Wood Stock",
	["model"] = "models/gibs/wood_gib01e.mdl",
	["description"] = "Some wood that can be easily carved to shape a stock and house Tihar internals.",
	["width"] = 2,
	["height"] = 1,
	["chance"] = 29

}

ITEMS.tihar_receiver = {
	["name"] = "Tihar Receiver",
	["model"] = "models/z-o-m-b-i-e/st/box/st_box_metall_01.mdl",
	["description"] = "A box filled with useful junk that can be manipulated int a Tihar receiver and its internals.",
	["width"] = 2,
	["height"] = 2,
	["chance"] = 7

}

ITEMS.tihar_barrel = {
	["name"] = "Tihar Barrel",
	["model"] = "models/illusion/eftcontainers/silicontube.mdl",
	["description"] = "Some tubing that can be straightened to make a Tihar barrel.",
	["width"] = 1,
	["height"] = 1,
	["chance"] = 20

}

--Blueprint Model: models/props/coop_autumn/autumn_intel/autumn_mailing_tube.mdl--
--only to be added if we decide to add blueprints/schematics for learning how to craft weapons--

ITEMS.tihar_pressure_gauge = {
    ["name"] = "Pressure Gauge",
    ["model"] = "models/illusion/eftcontainers/pressuregauge.mdl",
    ["description"] = "A pressure gauge, often used in Pneumatic Weapons.",
    ["category"] = "Scrap",
    ["width"] = 1,
    ["height"] = 1,
    ["chance"] = 41
}

ITEMS.tihar_pump_lever = {
    ["name"] = "Tihar Pump Lever",
    ["model"] = "models/mosi/fallout4/props/junk/connectingrod.mdl",
    ["description"] = "A pump lever for a Tihar.",
    ["category"] = "Scrap",
    ["width"] = 2,
    ["height"] = 1,
    ["chance"] = 22
}

ITEMS.tihar_air_canister = {
    ["name"] = "Air Canister",
    ["model"] = "models/props_junk/garbage_plasticbottle003a.mdl",
    ["description"] = "An air canister which is often used in pneumatic rifles.",
    ["category"] = "Scrap",
    ["width"] = 2,
    ["height"] = 1,
    ["chance"] = 29
}

ITEMS.ashot_receiver = {
    ["name"] = "Ashot Reciever Part",
    ["model"] = "models/gibs/wood_gib01e.mdl",
    ["description"] = "A receiver used for a single-shot shotgun.",
    ["category"] = "Scrap",
    ["width"] = 1,
    ["height"] = 1,
    ["chance"] = 6
}

ITEMS.ashot_handguard = {
    ["name"] = "Ashot Handguard",
    ["model"] = "models/props/cs_office/Snowman_arm.mdl",
    ["description"] = "A pistol handguard for a shotgun.",
    ["category"] = "Scrap",
    ["width"] = 1,
    ["height"] = 1,
    ["chance"] = 35
}

ITEMS.shotgun_receiver = {
    ["name"] = "Shotgun Reciever Part",
    ["model"] = "models/gibs/wood_gib01e.mdl",
    ["description"] = "A receiver used for a typical shotgun.",
    ["category"] = "Scrap",
    ["width"] = 2,
    ["height"] = 1,
    ["chance"] = 20
}

ITEMS.uboinik_stock = {
    ["name"] = "Uboinik Stock",
    ["model"] = "models/kek1ch/toolkit_p.mdl",
    ["description"] = "This can sawed in half for a shotgun stock.",
    ["category"] = "Scrap",
    ["width"] = 2,
    ["height"] = 1,
    ["chance"] = 31,
    ["rare"] = true
}

ITEMS.uboinik_handguard = {
    ["name"] = "Uboinik Handguard",
    ["model"] = "models/kek1ch/toolkit_p.mdl",
    ["description"] = "This is part of a Uboinik Rifle containing the trigger mechanisms.",
    ["category"] = "Scrap",
    ["width"] = 1,
    ["height"] = 1,
    ["chance"] = 23
}

ITEMS.uboinik_revolving_mechanism = {
    ["name"] = "Uboinik Revolving Mechanism",
    ["model"] = "models/kek1ch/cleaning_kit_p.mdl",
    ["description"] = "A revolver-like mechanism that is meant for the Uboinik.",
    ["category"] = "Scrap",
    ["width"] = 2,
    ["height"] = 2,
    ["chance"] = 10,
    ["rare"] = true
}


ITEMS.long_barrel = {
	["name"] = "Long Barrel Pieces",
	["model"] = "models/Items/CrossbowRounds.mdl",
	["description"] = "A long rifle barrel cut down to pieces to make room. ",
	["width"] = 4,
	["height"] = 1,
	["chance"] = 40,
	["rare"] = true

}

ITEMS.valve_bolt_mechanism = {
	["name"] = "Long Bolt Mechanism",
	["model"] = "models/redux/weapons/preved_bolt.mdl",
	["description"] = "A long bolting mechanism suitable for a Valve or long-barreled weapon. ",
	["width"] = 3,
	["height"] = 1,
	["chance"] = 12,

}

ITEMS.valve_receiver = {
	["name"] = "Large Receiver",
	["model"] = "models/z-o-m-b-i-e/metro_2033/library_props/m33_box_01.mdl",
	["description"] = "A medium sized box of spare weapon parts for a large calibre weapon. ",
	["width"] = 1,
	["height"] = 1,
	["chance"] = 26,

}

ITEMS.heavy_dwood = {
	["name"] = "Heavy Duty Wood",
	["model"] = "models/props_junk/harpoon002a.mdl",
	["description"] = "A chunk of sturdy wood infused with steel bits that can be used to absorb shock or be made into low strength armor. ",
	["width"] = 2,
	["height"] = 1,
	["chance"] = 10,

}

ITEMS.heavy_dwstockframe = {
	["name"] = "Heavy Duty Stock Frame",
	["model"] = "models/z-o-m-b-i-e/metro_2033/library_props/m33_box_03_2.mdl",
	["description"] = "A frame for the stock of large calibre weapon. Stored in a cardboard box for ease of travel. ",
	["width"] = 2,
	["height"] = 1,
	["chance"] = 9,

}


-- Broken Weapons

ITEMS.broken_kalash = {
	["name"] = "Broken Kalash",
	["model"] = "models/ninja/signalvariance/weapons/akm.mdl",
	["description"] = "It's broken, maybe jammed or something else, but it can still be repaired.",
	["width"] = 3,
	["height"] = 2,
	["chance"] = 27,
	["rare"] = true
}


ITEMS.broken_bastard = {
	["name"] = "Broken Bastard",
	["model"] = "models/devcon/mrp/weapons/w_bastard.mdl",
	["description"] = "It's broken, maybe jammed or something else, but it can still be repaired.",
	["width"] = 3,
	["height"] = 1,
	["chance"] = 27
}

ITEMS.broken_duplet = {
	["name"] = "Broken Duplet",
	["model"] = "models/kali/weapons/metro 2033/duplet.mdl",
	["description"] = "The mechanisms are badly damaged, you can’t shoot from it, but you can still fix it.",
	["width"] = 3,
	["height"] = 1,
	["chance"] = 21
}

ITEMS.broken_lowlife = {
	["name"] = "Broken Lowlife",
	["model"] = "models/kali/weapons/metro 2033/lolife.mdl",
	["description"] = "The mechanisms are badly damaged, you can’t shoot from it, but you can still fix it.",
	["width"] = 2,
	["height"] = 1,
	["chance"] = 30
}

ITEMS.broken_ashot = {
	["name"] = "Broken Ashot",
	["model"] = "models/redux/weapons/ashot.mdl",
	["description"] = "The mechanisms are badly damaged, you can’t shoot from it, but you can still fix it.",
	["width"] = 2,
	["height"] = 1,
	["chance"] = 22
}


ITEMS.broken_vsv = {
	["name"] = "Broken VSV",
	["model"] = "models/redux/weapons/vsv.mdl",
	["description"] = "The mechanisms are badly damaged, you can’t shoot from it, but you can still fix it.",
	["width"] = 2,
	["height"] = 1,
	["chance"] = 12,
	["rare"] = true
}

ITEMS.broken_uboinik = {
	["name"] = "Broken Uboinik",
	["model"] = "models/devcon/mrp/props/broken_shotgun.mdl",
	["description"] = "The mechanisms are badly damaged, you can’t shoot from it, but you can still fix it.",
	["width"] = 2,
	["height"] = 1,
	["chance"] = 8,
	["rare"] = true
}

ITEMS.broken_flashlight = {
	["name"] = "Broken Flashlight",
	["model"] = "models/lagmite/lagmite.mdl",
	["description"] = "Flashlight with broken glass and no batteries. However, it can still be fixed.",
	["width"] = 1,
	["height"] = 1,
	["chance"] = 60
}

ITEMS.metal = {
	["name"] = "Scrap metal",
	["model"] = "models/gibs/manhack_gib01.mdl",
	["description"] = "The basic material for creating anything is appreciated everywhere.",
	["width"] = 1,
	["height"] = 1,
	["chance"] = 40 --This is used for the 'item spawner plugin' this defines how many 'tickets' the item gets to spawn.
}

ITEMS.tape = {
	["name"] = "Insulating tape",
	["model"] = "models/mosi/fallout4/props/junk/ducttape.mdl",
	["description"] = "Insulating tape.",
	["width"] = 1,
	["height"] = 1,
	["chance"] = 40 --This is used for the 'item spawner plugin' this defines how many 'tickets' the item gets to spawn.
}

ITEMS.spring = {
	["name"] = "Spring",
	["model"] = "models/mosi/fallout4/props/junk/components/springs.mdl",
	["description"] = "A somewhat rusty spring which is able to function.",
	["width"] = 1,
	["height"] = 1,
	["chance"] = 47
}


ITEMS.gunpowder = {
	["name"] = "Gunpowder",
	["model"] = "models/kek1ch/dev_antirad.mdl",
	["description"] = "Gunpowder in a pouch.",
	["width"] = 1,
	["height"] = 1,
	["chance"] = 37,
	["rare"] = true
}

ITEMS.weapon_parts = {
	["name"] = "Weapon Pieces",
	["model"] = "models/props_lab/box01a.mdl",
	["description"] = "Old weapon parts.",
	["width"] = 1,
	["height"] = 1,
	["chance"] = 38
}

ITEMS.newspaper = {
	["name"] = "Pre-war newspaper",
	["model"] = "models/props_junk/garbage_newspaper001a.mdl",
	["description"] = "An old newspaper that went out before the war.",
	["width"] = 1,
	["height"] = 1,
	["chance"] = 82
}

ITEMS.broken_radio = {
	["name"] = "Broken Handheld Radio",
	["model"] = "models/deadbodies/dead_male_civilian_radio.mdl",
	["description"] = "A broken radio without batteries and some wires sticking out of it.",
	["width"] = 1,
	["height"] = 1,
	["chance"] = 50,
	["rare"] = true
}

ITEMS.doll = {
	["name"] = "Doll",
	["model"] = "models/props_c17/doll01.mdl",
	["description"] = "An old shabby doll.",
	["width"] = 1,
	["height"] = 1,
	["chance"] = 80
}

ITEMS.porn = {
	["name"] = "Porn magazine",
	["model"] = "models/kek1ch/porn.mdl",
	["description"] = "Strongly appreciated among Metro residents.",
	["width"] = 1,
	["height"] = 1,
	["chance"] = 78
}

ITEMS.fabric = {
	["name"] = "Fabric",
	["model"] = "models/devcon/mrp/props/carpet_roll_2.mdl",
	["description"] = "There are many things you can do with it.",
	["width"] = 1,
	["height"] = 1,
	["chance"] = 50
}

ITEMS.electronics = {
	["name"] = "Electronics",
	["model"] = "models/mosi/fallout4/props/junk/modbox.mdl",
	["description"] = "One of the important components for a lot of things.",
	["width"] = 1,
	["height"] = 1,
	["chance"] = 23,
	["rare"] = true
}

ITEMS.normal_hammer = {
	["name"] = "Hammer",
	["model"] = "models/props_c17/TrapPropeller_Lever.mdl",
	["description"] = "A hammer devised of several tools.",
	["width"] = 1,
	["height"] = 2,
	["chance"] = 57,

}

ITEMS.normal_saw = {
	["name"] = "Circular saw",
	["model"] = "models/props/cs_militia/circularsaw01.mdl",
	["description"] = "Heavy circular saw. You know what it's for.",
	["width"] = 1,
	["height"] = 1,
	["chance"] = 47,

}

ITEMS.normal_sciss = {
	["name"] = "Scissors",
	["model"] = "models/mosi/fallout4/props/junk/scissors02.mdl",
	["description"] = "A very sharp tool.",
	["width"] = 1,
	["height"] = 1,
	["chance"] = 60,


}

ITEMS.normal_clipper = {
	["name"] = "Clippers",
	["model"] = "models/props_c17/tools_pliers01a.mdl",
	["description"] = "This seems like an useful thing.",
	["width"] = 2,
	["height"] = 1,
	["chance"] = 37,

}

ITEMS.normal_wrench = {
	["name"] = "Wrench",
	["model"] = "models/props_c17/tools_wrench01a.mdl",
	["description"] = "A very uselful tool.",
	["width"] = 2,
	["height"] = 1,
	["chance"] = 63,

}

ITEMS.glue = {
	["name"] = "Glue",
	["model"] = "models/mosi/fallout4/props/junk/wonderglue_large.mdl",
	["description"] = "A sticky white substance with a faded label.",
	["width"] = 1,
	["height"] = 1,
	["chance"] = 43,
	["rare"] = true
}

for k, v in pairs(ITEMS) do
	local ITEM = ix.item.Register(k, nil, false, nil, true)
	ITEM.name = v.name
	ITEM.model = v.model
	ITEM.description = v.description
	ITEM.category = v.category or "Materiales"
	ITEM.width = v.width or 1
	ITEM.height = v.height or 1
	ITEM.chance = v.chance or 0
	ITEM.isTool = v.tool or false
	ITEM.rare = v.rare or false
end
