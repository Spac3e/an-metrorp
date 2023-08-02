--TODO: POPULATE CRAFTING ITEMS AND RECIPES
PLUGIN.name = "Crafting"
PLUGIN.author = "Huargenn"
PLUGIN.desc = "Replacing the business menu with crafting because that's a more sensible thing to do."
STORED_RECIPES = {}

function PLUGIN:AddRecipe(name, model, desc, requirements, results, id, skills, blueprint, workstation, tools, tier, entity, category)
	if type(name) ~= "table" then
		local RECIPE = {}
		RECIPE["id"] = id --Unique ID of the recipe.
		RECIPE["name"] = name -- Name of the recipe.
		RECIPE["model"] = model -- Model it uses in the menu.
		RECIPE["desc"] = desc -- Description of what it is.
		RECIPE["req"] = requirements --Requirements to craft it(use item id's)
		RECIPE["results"] = results --Results of the craft (use item id's)
		RECIPE["blueprint"] = blueprint or false
		RECIPE["entity"] = entity or false
		RECIPE["category"] = category or "Miscellaneous"
		RECIPE["workstation"] = workstation or false
		RECIPE["tools"] = tools or false
		RECIPE["tier"] = tier or "I"

		if skills then
			RECIPE["skills"] = skills
		end

		STORED_RECIPES[id] = RECIPE
	else
		for k, v in pairs(name) do
			RECIPE["id"] = k --Unique ID of the recipe.
			RECIPE["name"] = v.name -- Name of the recipe.
			RECIPE["model"] = v.model -- Model it uses in the menu.
			RECIPE["desc"] = v.desc -- Description of what it is.
			RECIPE["req"] = v.requirements --Requirements to craft it(use item id's)
			RECIPE["results"] = v.results --Results of the craft (use item id's)
			RECIPE["blueprint"] = v.blueprint or false --Whether or not it uses a blueprint
			RECIPE["entity"] = v.entity or false --FUTURE: Whether or not it will use an entity.
			RECIPE["category"] = v.category or "Miscellaneous" --FUTURE: The Category
			RECIPE["workstation"] = v.workstation or false
			RECIPE["tools"] = v.tools or false
			RECIPE["tier"] = v.tier or "I"

			if skills then
				RECIPE["skills"] = skills
			end
		end
	end
end
--[[-------------------------------------------------------------------------
TODO: For release, demonstrate full capacity of plugin.
---------------------------------------------------------------------------]]
local NEW_RECIPES = {

	--Unique ID = name of the folders of attributes


	    --[[For example]]--


	--[[
	["nucleo_ia"] = {
		["name"] = "Droide: Núcleo de I.A.",
		["model"] = "models/props/starwars/weapons/ap_mine.mdl",
		["desc"] = "Un núcleo de Inteligencia Artificial.",
		["requirements"] = {["lingote_titanio"] = 2, ["circuito_cobre"] = 3, ["tabla_circuitos_oro_cobre"] = 2, ["sensor"] = 2, ["conjunto_piezas_metalicas"] = 4},
		["skills"] = {["eng"] = 35, ["des"] = 30},
		["tools"] = {"planos_nucleo_ia", "destornillador", "soldador", "tijeras", "martillo"},
		["results"] = {["nucleo_ia"] = 1},
		["workstation"] = "estacion_droides",
		["tier"] = "I",
		["category"] = "Ingenieria",
	},
	]]
	-- Weapons & Ammo
	["wep_bow"] = {
		["name"] = "Weapon: Bow",
		["model"] = "models/weapons/yurie_rustalpha/wm-huntingbow.mdl",
		["desc"] = "Create a bow which utilizes makeshift arrows from scratch.",
		["requirements"] = {["wood"] = 2, ["string"] = 1},
		["tools"] = {["normal_screwdriver"] = 1},
		["results"] = {["bow"] = 1},
		["skills"] = {["eng"] = 26},
		["workstation"] = "worktable",
		["category"] = "Weapons",
	},
	
	["wep_handcannon"] = {
		["name"] = "Weapon: Handcannon",
		["model"] = "models/weapons/yurie_rustalpha/wm-handcannon.mdl",
		["desc"] = "Create a relatively makeshift weapon, appearing to be a shittier version of the Ashot.",
		["requirements"] = {["wood"] = 2, ["gears"] = 1, ["gunpowder"] = 1},
		["tools"] = {["normal_screwdriver"] = 1},
		["results"] = {["handcannon"] = 1},
		["skills"] = {["eng"] = 32, ["wea"] = 34},
		["workstation"] = "worktable",
		["category"] = "Weapons",
	},

	["wep_ashot"] = {
		["name"] = "Weapon: Ashot",
		["model"] = "models/redux/weapons/ashot.mdl",
		["desc"] = "Creates a single-shot shotgun.",
		["requirements"] = {["ashot_receiver"] = 1, ["ashot_handguard"] = 1, ["welding_fuel"] = 1},
		["tools"] = {["normal_screwdriver"] = 1, ["welder"] = 1},
		["results"] = {["ashot"] = 1},
		["skills"] = {["wea"] = 27, ["eng"] = 34},
		["workstation"] = "worktable",
		["category"] = "Weapons",
	},

 	 ["wep_kalash"] = {
        ["name"] = "Weapon: Kalash",
        ["model"] = "models/redux/weapons/ak74.mdl",
        ["desc"] = "Creates a Kalash assault-rifle from scratch.",
        ["requirements"] = {["rifle_barrel"] = 1, ["kalash_receiver"] = 1, ["welding_fuel"] = 1, ["kalash_handguard"] = 1, ["kalash_blowback"] = 1},
        ["tools"] = {["normal_screwdriver"] = 1, ["welder"] = 1},
        ["results"] = {["kalash"] = 1},
        ["skills"] = {["wea"] = 45, ["eng"] = 30},
        ["workstation"] = "worktable",
        ["category"] = "Weapons",
    },
    
	["wep_bastard"] = {
		["name"] = "Weapon: Bastard",
		["model"] = "models/redux/weapons/bastarda.mdl",
		["desc"] = "Create a Bastard SMG from scratch.",
		["requirements"] = {["smg_barrel"] = 1, ["bastard_receiver"] = 1, ["pistol_handguard"] = 1, ["bastard_slider"] = 1, ["welding_fuel"] = 1},
		["tools"] = {["normal_screwdriver"] = 1, ["welder"] = 1},
		["results"] = {["bastard"] = 1},
		["skills"] = {["wea"] = 30, ["eng"] = 20},
		["workstation"] = "worktable",
		["category"] = "Weapons",
	},

	["wep_duplet"] = {
		["name"] = "Weapon: Duplet",
		["model"] = "models/kali/weapons/metro 2033/duplet.mdl",
		["desc"] = "Create a new double barrel shotgun from scratch.",
		["requirements"] = {["shotgun_receiver"] = 1, ["wood"] = 2, ["pistol_handguard"] = 1, ["welding_fuel"] = 1},
		["tools"] = {["normal_screwdriver"] = 1, ["welder"] = 1},
		["results"] = {["doublet"] = 1},
		["skills"] = {["wea"] = 20, ["eng"] = 35},
		["workstation"] = "worktable",
		["category"] = "Weapons",
	},

	["wep_lowlife"] = {
		["name"] = "Weapon: Lowlife",
		["model"] = "models/ishi/weapons/w_lowlife.mdl",
		["desc"] = "Create a Lowlife pistol from scratch you filthy animal.",
		["requirements"] = {["pistol_handguard"] = 1, ["lowlife_receiver"] = 1, ["lowlife_loader"] = 1, ["pistol_barrel"] = 1, ["welding_fuel"] = 1},
		["tools"] = {["normal_screwdriver"] = 1, ["welder"] = 1},
		["results"] = {["lowlife"] = 1},
		["skills"] = {["wea"] = 20, ["eng"] = 35},
		["workstation"] = "worktable",
		["category"] = "Weapons",
	},

	["wep_tihar"] = {
		["name"] = "Weapon: Tihar",
		["model"] = "models/redux/weapons/tihar.mdl",
		["desc"] = "Create a Tihar Pneumatic Rifle from scratch.",
		["requirements"] = {["tihar_barrel"] = 1, ["tihar_receiver"] = 1, ["tihar_stock"] = 1, ["tihar_pressure_gauge"] = 1, ["tihar_pump_lever"] = 1, ["tihar_air_canister"] = 1, ["pistol_handguard"] = 1, ["welding_fuel"] = 1},
		["tools"] = {["normal_screwdriver"] = 1, ["welder"] = 1},
		["results"] = {["tihar"] = 1},
		["skills"] = {["wea"] = 40, ["eng"] = 22},
		["workstation"] = "worktable",
		["category"] = "Weapons",
	},

	["wep_uboinik"] = {
		["name"] = "Weapon: Uboinik Shotgun",
		["model"] = "models/redux/weapons/uboinik.mdl",
		["desc"] = "Create a Revolving Automatic Shotgun",
		["requirements"] = {["uboinik_revolving_mechanism"] = 1, ["uboinik_stock"] = 1, ["uboinik_handguard"] = 1, ["welding_fuel"] = 1},
		["tools"] = {["normal_screwdriver"] = 1, ["welder"] = 1},
		["results"] = {["uboinik"] = 1},
		["skills"] = {["wea"] = 42, ["eng"] = 45},
		["workstation"] = "worktable",
		["category"] = "Weapons",
	},

	["wep_valve"] = {
		["name"] = "Weapon: Valve 2027",
		["model"] = "models/redux/weapons/valve_weapon.mdl",
		["desc"] = "Create a Tsar Style Valve 2027 Rifle.",
		["requirements"] = {["valve_bolt_mechanism"] = 1, ["valve_receiver"] = 1, ["heavy_dwstockframe"] = 1, ["long_barrel"] = 1, ["welding_fuel"] = 1},
		["tools"] = {["normal_screwdriver"] = 1, ["welder"] = 1},
		["results"] = {["valve2027"] = 1},
		["skills"] = {["wea"] = 20, ["eng"] = 45},
		["workstation"] = "worktable",
		["category"] = "Weapons",
	},

	--[[ ["craft_arrow"] = {
		["name"] = "Ammunition: Arrow",
		["model"] = "models/weapons/yurie_rustalpha/wm-huntingbow.mdl",
		["desc"] = "Creates ten arrows which can be used in a bow.",
		["requirements"] = {["wood"] = 3, ["metal"] = 1},
		["results"] = {["arrows"] = 1},
		["skills"] = {["eng"] = 28, ["wea"] = 25},
		["workstation"] = "worktable",
		["category"] = "Weapons",
	},
 			Need to find a TFA compat for ammo for these to work aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
	["ammo_handcannon"] = {
		["name"] = "Ammunition: Handcannon Shells",
		["model"] = "models/weapons/yurie_rustalpha/wm-handcannon.mdl",
		["desc"] = "Create 15 relatively makeshift shells from scratch.",
		["requirements"] = {["metal"] = 3, ["welding_fuel"] = 1, ["gunpowder"] = 2},
		["tools"] = {["welder"] = 1},
		["results"] = {["handcannonshells"] = 1, ["welder"] = 1},
		["skills"] = {["eng"] = 32, ["wea"] = 34},
		["workstation"] = "worktable",
		["category"] = "Weapons",
	},
--]]
		-- Weapon Parts

-- Tihar Stuff
	["craft_tihar_receiver"] = {
		["name"] = "Part: Tihar Receiver",
		["model"] = "models/kek1ch/ammo.mdl",
		["desc"] = "Creates a receiver for the Tihar Pneumatic Rifle",
		["requirements"] = {["metal"] = 1, ["lead"] = 1, ["tape"] = 1, ["spring"] = 2, ["weapon_parts"] = 1, ["glue"] = 1},
		["tools"] = {["normal_screwdriver"] = 1},
		["results"] = {["tihar_receiver"] = 1, ["glue"] = 1},
		["skills"] = {["wea"] = 30, ["eng"] = 15},
		["workstation"] = "worktable",
		["category"] = "Utilities",
	},

		["craft_tihar_barrel"] = {
		["name"] = "Part: Tihar Barrel",
		["model"] = "models/kali/weapons/metro 2033/duplet cleaning rod.mdl",
		["desc"] = "Creates a long steel tube for the Tihar Pneumatic Rifle.",
		["requirements"] = {["metal"] = 4, ["welding_fuel"] = 1},
		["tools"] = {["welder"] = 1},
		["results"] = {["tihar_receiver"] = 1},
		["skills"] = {["wea"] = 30, ["eng"] = 15},
		["workstation"] = "worktable",
		["category"] = "Utilities",
	},
	["craft_tihar_stock"] = {
		["name"] = "Part: Tihar Stock",
		["model"] = "models/props_debris/detail_debris_wood3.mdl",
		["desc"] = "Creates a wooden stock for the Tihar Pneumatic Rifle.",
		["requirements"] = {["wood"] = 4, ["metal"] = 1, ["welding_fuel"] = 1},
		["tools"] = {["welder"] = 1},
		["results"] = {["tihar_stock"] = 1},
		["skills"] = {["eng"] = 10},
		["workstation"] = "worktable",
		["category"] = "Utilities",
	},
	["craft_pistol_handguard"] = {
		["name"] = "Part: Tihar Stock",
		["model"] = "models/weapons/tfa_ins2/upgrades/w_foregrip_wood_1.mdl",
		["desc"] = "Creates a handguard used in most weapons.",
		["requirements"] = {["wood"] = 2, ["metal"] = 1},
		["results"] = {["pistol_handguard"] = 1},
		["skills"] = {["wea"] = 10, ["eng"] = 14},
		["workstation"] = "worktable",
		["category"] = "Utilities",
	},

-- Uboinik Stuff
	["craft_uboinik_revolving_mechanism"] = {
		["name"] = "Part: Revolving Mechanism - Uboinik",
		["model"] = "models/weapons/tfa_ins2/upgrades/w_foregrip_wood_1.mdl",
		["desc"] = "Creates a revolving mechanism for the Uboinik Shotgun",
		["requirements"] = {["wood"] = 1, ["metal"] = 2, ["welding_fuel"] = 1, ["welder"] = 1, ["weapon_parts"] = 1, ["spring"] = 1},
		["results"] = {["uboinik_revolving_mechanism"] = 1},
		["skills"] = {["wea"] = 20, ["eng"] = 30},
		["workstation"] = "worktable",
		["category"] = "Utilities",
	},


  ["craft_rifle_barrel"] = {
        ["name"] = "Part: Rifle Barrel",
        ["model"] = "models/props_c17/TrapPropeller_Lever.mdl",
        ["desc"] = "Creates a generic Rifle Barrel.",
        ["requirements"] = {["steel_pipe"] = 1},
        ["tools"] = {["tongs"] = 1, ["saw"] = 1},
        ["results"] = {["rifle_barrel"] = 1, ["saw"] = 1},
        ["skills"] = {["wea"] = 15, ["eng"] = 20},
        ["workstation"] = "worktable",
        ["category"] = "Utilities",
    },
    -- Kalash Stuff
  ["craft_kalash_receiver"] = {
        ["name"] = "Part: Kalash Reciever",
        ["model"] = "models/illusion/eftcontainers/ammocase.mdl",
        ["desc"] = "Creates a receiver for a Kalash.",
        ["requirements"] = {["metal"] = 1, ["gears"] = 1, ["weapon_parts"] = 1, ["welding_fuel"] = 1},
        ["skills"] = {["wep"] = 30, ["eng"] = 28},
        ["tools"] = {["normal_screwdriver"] = 1, ["saw"] = 1, ["welder"] = 1},
        ["results"] = {["kalash_receiver"] = 1},
        ["workstation"] = "worktable",
        ["category"] = "Utilities",
    },

  ["craft_kalash_handguard"] = {
        ["name"] = "Part: Kalash Handguard",
        ["model"] = "models/kek1ch/waste_large.mdl",
        ["desc"] = "Creates a handguard for a Kalash.",
        ["requirements"] = {["wood"] = 1, ["metal"] = 1},
        ["tools"] = {["normal_screwdriver"] = 1, ["saw"] = 1},
        ["results"] = {["kalash_handguard"] = 1},
        ["skills"] = {["eng"] = 28},
        ["workstation"] = "worktable",
        ["category"] = "Utilities",
    },

  ["craft_kalash_blowback"] = {
        ["name"] = "Part: Kalash Blowback Mechanisms",
        ["model"] = "models/illusion/eftcontainers/ammocase.mdly",
        ["desc"] = "Creates a blowback mechanisms for a Kalash.",
        ["requirements"] = {["metal"] = 1, ["weapon_parts"] = 1},
        ["tools"] = {["normal_screwdriver"] = 1},
        ["results"] = {["kalash_blowback"] = 1},
        ["skills"] = {["eng"] = 30},
        ["workstation"] = "worktable",
        ["category"] = "Utilities",
    },

    -- Bastard Stuff
  ["craft_pistol_barrel"] = {
        ["name"] = "Part: Pistol Barrel",
        ["model"] = "models/props_c17/TrapPropeller_Lever.mdl",
        ["desc"] = "Creates a generic Pistol Barrel.",
        ["requirements"] = {["steel_pipe"] = 1},
        ["tools"] = {["saw"] = 1, ["tongs"] = 1},
        ["results"] = {["pistol_barrel"] = 1},
        ["skills"] = {["eng"] = 15},
        ["workstation"] = "worktable",
        ["category"] = "Utilities",
    },

    ["craft_smg_barrel"] = {
        ["name"] = "Part: SMG Barrel",
        ["model"] = "models/kek1ch/toolkit_p.mdl",
        ["desc"] = "Creates a generic SMG Barrel from scrap metal.",
        ["requirements"] = {["metal"] = 2, ["welding_fuel"] = 1},
        ["tools"] = {["welder"] = 1},
        ["results"] = {["smg_barrel"] = 1},
        ["skills"] = {["eng"] = 8},
        ["workstation"] = "worktable",
        ["category"] = "Utilities",
    },

    ["craft_bastard_receiver"] = {
        ["name"] = "Part: Bastard Receiver",
        ["model"] = "models/illusion/eftcontainers/weaponparts.mdl",
        ["desc"] = "Creates a receiver used by the infamous Bastard SMG.",
        ["requirements"] = {["plastic"] = 2, ["metal"] = 3, ["weapon_parts"] = 1, ["gears"] = 1},
        ["results"] = {["bastard_receiver"] = 1},
        ["skills"] = {["wea"] = 17, ["eng"] = 9},
        ["workstation"] = "worktable",
        ["category"] = "Utilities",
    },

    ["craft_bastard_slider"] = {
        ["name"] = "Part: Bastard Slider",
        ["model"] = "models/kek1ch/dev_hand_rolling_tobacco.mdl",
        ["desc"] = "Creates a scrap metal slider used by the infamous Bastard SMG.",
        ["requirements"] = {["metal"] = 1, ["gears"] = 1},
        ["results"] = {["bastard_slider"] = 1},
        ["skills"] = {["eng"] = 5},
        ["workstation"] = "worktable",
        ["category"] = "Utilities",
    },
    -- Lowlife
  ["craft_lowlife_loader"] = {
        ["name"] = "Part: Lowlife Loader",
        ["model"] = "models/kek1ch/toolkit_r.mdl",
        ["desc"] = "Creates a loader for a Lowlife pistol.",
        ["requirements"] = {["metal"] = 1, ["weapon_parts"] = 1, ["welding_fuel"] = 1},
        ["tools"] = {["normal_screwdriver"] = 1, ["welder"] = 1},
        ["results"] = {["lowlife_loader"] = 1},
        ["skills"] = {["eng"] = 26, ["wea"] = 5},
        ["workstation"] = "worktable",
        ["category"] = "Utilities",
    },
    -- Ashot
  ["craft_ashot_handguard"] = {
        ["name"] = "Part: Ashot Handguard",
        ["model"] = "models/props/cs_office/Snowman_arm.mdl",
        ["desc"] = "Creates a handguard for an Ashot Shotgun.",
        ["requirements"] = {["metal"] = 1, ["welding_fuel"] = 1},
        ["tools"] = {["normal_screwdriver"] = 1, ["welder"] = 1},
        ["results"] = {["ashot_handguard"] = 1},
        ["skills"] = {["eng"] = 29},
        ["workstation"] = "worktable",
        ["category"] = "Utilities",
    },

  ["craft_ashot_receiver"] = {
        ["name"] = "Part: Ashot Reciever",
        ["model"] = "models/gibs/wood_gib01e.mdl",
        ["desc"] = "Creates a receiver for an Ashot Shotgun.",
        ["requirements"] = {["metal"] = 1, ["gears"] = 1, ["welding_fuel"] = 1},
        ["tools"] = {["normal_screwdriver"] = 1, ["welder"] = 1},
        ["results"] = {["ashot_receiver"] = 1}, 
        ["skills"] = {["eng"] = 18},
        ["workstation"] = "worktable",
        ["category"] = "Utilities",
    },

		-- Weapon Repairs
	["repair_lowlife"] = {
		["name"] = "Weapon Repairs: Lowlife",
		["model"] = "models/kali/weapons/metro 2033/lolife.mdl",
		["desc"] = "Repair a previously broken pistol.",
		["requirements"] = {["broken_lowlife"] = 1, ["metal"] = 2, ["weapon_parts"] = 1, ["lowlife_loader"] = 1},
		["tools"] = {["normal_screwdriver"] = 1},
		["results"] = {["lowlife"] = 1},
		["skills"] = {["wea"] = 7, ["eng"] = 3},
		["category"] = "Weapons"
	},
	["repair_bastard"] = {
		["name"] = "Weapon Repairs: Bastard",
		["model"] = "models/redux/weapons/bastarda.mdl",
		["desc"] = "Repair a previously broken Bastard SMG.",
		["requirements"] = {["broken_bastard"] = 1, ["metal"] = 3, ["weapon_parts"] = 1, ["smg_barrel"] = 1},
		["tools"] = {["normal_screwdriver"] = 1},
		["results"] = {["bastard"] = 1},
		["skills"] = {["wea"] = 10}, {["eng"] = 15},
		["category"] = "Weapons",
	},
	["repair_duplet"] = {
		["name"] = "Weapon Repairs: Duplet",
		["model"] = "models/kali/weapons/metro 2033/duplet.mdl",
		["desc"] = "Repair a previously broken Double Barrel Shotgun.",
		["requirements"] = {["broken_duplet"] = 1, ["shotgun_receiver"] = 1, ["metal"] = 2, ["weapon_parts"] = 1},
		["tools"] = {["normal_screwdriver"] = 1},
		["results"] = {["doublet"] = 1},
		["skills"] = {["wea"] = 10}, {["eng"] = 15},
		["workstation"] = "worktable",
		["category"] = "Weapons",
	},
	["repair_vsv"] = {
		["name"] = "Weapon Repairs: VSV",
		["model"] = "models/kali/weapons/metro 2033/lolife.mdl",
		["desc"] = "Repair a previosuly broken VSV rifle.",
		["requirements"] = {["broken_vsv"] = 1, ["metal"] = 2, ["weapon_parts"] = 1, ["pistol_handguard"] = 1, ["kalash_blowback"] = 1},
		["tools"] = {["normal_screwdriver"] = 1},
		["results"] = {["vsv"] = 1},
		["skills"] = {["wea"] = 27, ["eng"] = 13},
		["category"] = "Weapons"
	},

	-- Ammo (( TODO: FIX TOKEN AS REQUIREMENT ))
	--[[
	["ammo_conversion_ar"] = {
		["name"] = "Ammunition Conversion - Rifle: MGR to Crude",
		["model"] = "models/ninja/signalvariance/weapons/akm_mag.mdl",
		["desc"] = "Utilize MGR within your rifle (NON-REFUNDABLE)",
		["requirements"] = {["mgr"] = 30},
		["results"] = {["assaultammo"] = 1},
		["category"] = "Utilities"
	},
	["ammo_conversion_pistol"] = {
		["name"] = "Ammunition Conversion - Pistol: MGR to Crude",
		["model"] = "models/kali/weapons/metro 2033/magazines/10rd lolife magazine.mdl",
		["desc"] = "Utilize MGR within your pistol (NON-REFUNDABLE)",
		["requirements"] = {["mgr"] = 10},
		["results"] = {["crudepistolammo"] = 1},
		["category"] = "Utilities",
	},
	]]--
		-- Cooking Recipes

	["cook_mushroom_stew"] = {
		["name"] = "Food: Mushroom Stew",
		["model"] = "models/mosi/fallout4/props/food/moleratstew.mdl",
		["desc"] = "Sometimes stews are the way to the soul. Perhaps you just learned how to make one?",
		["requirements"] = {["mushroom"] = 2, ["mushroom_water"] = 1, ["nosalismeat"] = 1},
		["tools"] = {["pot"] = 1},
		["results"] = {["mushroom_stew"] = 1, ["pot"] = 1},
		["workstation"] = "stovetop",
		["category"] = "Utilities",
	},
	["cooked_dog_meat"] = {
		["name"] = "Food: Cooked Dog Meat",
		["model"] = "models/kek1ch/meat_dog.mdl",
		["desc"] = "Make a mighty fine stir fry of dog, and other nutritious substances",
		["requirements"] = {["pigmeat"] = 2, ["carrot"] = 3, ["mushroom_vodka"] = 1},
		["tools"] = {["fryingpan"] = 1},
		["results"] = {["dogmeat"] = 1},
		["workstation"] = "stovetop",
		["category"] = "Utilities",
	},

	["nosburg"] = {
		["name"] = "Food: Nosalis Burger",
		["model"] = "models/food/burger.mdl",
		["desc"] = "Creating the most patriotic thing of Russia! A burger!",
		["requirements"] = {["meatpatty"] = 1, ["cheese"] = 1},
		["tools"] = {["fryingpan"] = 1},
		["results"] = {["nosalis_burger"] = 1},
		["workstation"] = "stovetop",
		["category"] = "Utilities",
	},

	["nospat"] = {
		["name"] = "Ingredient: Nosalis Patty",
		["model"] = "models/kek1ch/raw_flesh.mdl",
		["desc"] = "Creating a patty from Nosalis meat",
		["requirements"] = {["nosalismeat"] = 2, ["mushroom_water"] = 1, ["carrot"] = 1},
		["results"] = {["meatpatty"] = 1},
		["category"] = "Utilities",
	},

	["noscheese"] = {
		["name"] = "Ingredient: Cheese",
		["model"] = "models/mosi/fallout4/props/food/squirrelcrispybits.mdl",
		["desc"] = "Creating a thing of cheese before your very eyes",
		["requirements"] = {["milk_carton"] = 1, ["mushroom_water"] = 1},
		["results"] = {["cheese"] = 10},
		["category"] = "Utilities",
	},

	["chitakeout"] = {
		["name"] = "Food: Chinese Takeout",
		["model"] = "models/props_junk/garbage_takeoutcarton001a.mdl",
		["desc"] = "Creating some old fashion Chinese takeout.",
		["requirements"] = {["noodles"] = 1, ["carrot"] = 3, ["mushroom_water"] = 2, ["nosalismeat"] = 1},
		["tools"] = {["pot"] = 1},
		["results"] = {["chinese_takeout"] = 2},
		["workstation"] = "stovetop",
		["category"] = "Utilities",
	},

	["cansoup"] = {
		["name"] = "Food: Canned Soup",
		["model"] = "models/props_junk/garbage_metalcan002a.mdl",
		["desc"] = "Creating some old fashion Chinese takeout.",
		["requirements"] = {["nosalismeat"] = 2, ["carrot"] = 3, ["mushroom_water"] = 5, ["noodles"] = 1},
		["tools"] = {["pot"] = 1},
		["results"] = {["canned_soup"] = 2},
		["workstation"] = "stovetop",
		["category"] = "Utilities",
	},

	-- Essential Crafting Recipes
	["craft_gasmask"] = {
		["name"] = "Gasmask",
		["model"] = "models/half-dead/metrollfix/p_mask_2.mdl",
		["desc"] = "The gasmask is an essential part of Metro Life, and it is time to create one from scratch.",
		["requirements"] = {["plastic"] = 2, ["leather"] = 1, ["glass"] = 1},
		["results"] = {["gasmask"] = 1},
		["skills"] = {["int"] = 27},
		["category"] = "Utilities",
	},
	["craft_battery"] = {
		["name"] = "Battery",
		["model"] = "models/kek1ch/battery.mdl",
		["desc"] = "Create a battery from scratch, useful for flashlights.",
		["requirements"] = {["steel"] = 1, ["acid"] = 1, ["chemical_components"] = 1},
		["skills"] = {["int"] = 22},
		["results"] = {["battery"] = 1},
		["category"] = "Utilities",
	},
	["craft_weapon_repair_kit"] = {
		["name"] = "Weapon Repair Kit",
		["model"] = "models/kek1ch/repairkit_s.mdl",
		["desc"] = "Creates a weapon repair kit by combining some parts, handy for the travelling merchant.",
		["requirements"] = {["metal"] = 2, ["normal_screwdriver"] = 1, ["weapon_parts"] = 2},
		["skills"] = {["int"] = 27, ["eng"] = 34, ["wea"] = 42},
		["results"] = {["hobo_kit"] = 1},
		["category"] = "Utilities",
	},
	["craft_small_backpack"] = {
		["name"] = "Small Backpack",
		["model"] = "models/fallout 3/backpack_2.mdl",
		["desc"] = "Creates a small backpack out of some leather.",
		["requirements"] = {["leather"] = 2, ["fabric"] = 1, ["string"] = 1},
		["results"] = {["smallbackpack"] = 1},
		["category"] = "Utilities",
	},

	-- Scrap Recipes
	["doll_breakdown"] = {
		["name"] = "Breakdown: Doll",
		["model"] = "models/props_c17/doll01.mdl",
		["desc"] = "Break down a doll into some materials",
		["requirements"] = {["doll"] = 1},
		["results"] = {["plastic"] = 2},
		["category"] = "Materials",
	},
	["scrap_metal_stew"] = {
		["name"] = "Scrap Metal",
		["model"] = "models/mechanics/solid_steel/plank_4.mdl",
		["desc"] = "Turn a pot into scrap metal.",
		["requirements"] = {["normal_screwdriver"] = 1, ["welder"] = 1, ["stewpot"] = 1},
		["results"] = {["metal"] = 5},
		["category"] = "Materials",
	},
	["scrap_metal_welder"] = {
		["name"] = "Scrap Metal - Welder",
		["model"] = "models/mechanics/solid_steel/plank_4.mdl",
		["desc"] = "Turn a pot into scrap metal.",
		["requirements"] = {["welder"] = 2},
		["results"] = {["metal"] = 3, ["oil"] = 1},
		["category"] = "Materials",
	},
	["scrap_metal"] = {
		["name"] = "Scrap Metal - Pot + Screwdriver",
		["model"] = "models/mechanics/solid_steel/plank_4.mdl",
		["desc"] = "Turn a pot & screwdriver into scrap metal.",
		["requirements"] = {["normal_screwdriver"] = 1, ["pot"] = 1},
		["results"] = {["metal"] = 3},
		["category"] = "Materials",
	},

	-- Breakdowns 
	["breakdown_ashot"] = {
		["name"] = "Ashot Breakdown",
		["model"] = "models/redux/weapons/ashot.mdl",
		["desc"] = "Dismantle an Ashot in exchange for parts.",
		["requirements"] = {["normal_screwdriver"] = 1, ["ashot"] = 1},
		["results"] = {["metal"] = 1, ["weapon_parts"] = 1, ["ashot_receiver"] = 1},
		["skills"] = {["wea"] = 5, ["eng"] = 10},
		["category"] = "Materials",
	},
	["breakdown_bastard"] = {
		["name"] = "Bastard Breakdown",
		["model"] = "models/redux/weapons/bastarda_weapon.mdl",
		["desc"] = "Breakdown a Bastard Carbine.",
		["requirements"] = {["bastard"] = 1},
		["tools"] = {["normal_screwdriver"] = 1},
		["skills"] = {["wea"] = 24},
		["results"] = {["bastard_receiver"] = 1, ["bastard_slider"] = 1, ["smg_barrel"] = 1, ["spring"] = 1, ["pistol_handguard"] = 1, ["weapon_parts"] = 2},
		["category"] = "Weapons",
	},
	["breakdown_lowlife"] = {
		["name"] = "Lowlife Breakdown",
		["model"] = "models/kali/weapons/metro 2033/lolife.mdl",
		["desc"] = "Breakdown a Lowlife Pistol.",
		["requirements"] = {["lowlife"] = 1},
		["results"] = {["pistol_barrel"] = 1, ["metal"] = 1, ["spring"] = 1, ["pistol_handguard"] = 1, ["weapon_parts"] = 1},
		["tools"] = {["normal_screwdriver"] = 1},
		["skills"] = {["wea"] = 19, ["eng"] = 24},
		["category"] = "Weapons",
	},
	["breakdown_kalash"] = {
		["name"] = "Kalash Breakdown",
		["model"] = "models/kali/weapons/metro 2033/lolife.mdl",
		["desc"] = "Breakdown a Kalash Rifle.",
		["requirements"] = {["kalash"] = 1},
		["tools"] = {["normal_screwdriver"] = 1},
		["skills"] = {["wea"] = 19, ["eng"] = 24},
		["results"] = {["rifle_barrel"] = 1, ["kalash_receiver"] = 1, ["wood"] = 2, ["metal"] = 2, ["spring"] = 2, ["pistol_handguard"] = 1, ["weapon_parts"] = 1},
		["category"] = "Weapons",
	},
	["breakdown_scraprevolver"] = {
		["name"] = "Scrap Revolver Breakdown",
		["model"] = "models/weapons/yurie_rustalpha/wm-revolver.mdl",
		["desc"] = "Breakdown a Scrap Revolver.",
		["requirements"] = {["scraprevolver"] = 1},
		["results"] = {["metal"] = 3, ["pistol_handguard"] = 1},
		["category"] = "Weapons",
	},

		-- ["skills"] = {["wea"] = 27, ["eng"] = 13},
	-- Other Crafting Recipes
	["handradio"] = {
		["name"] = "Utilities: Handheld Radio",
		["model"] = "models/deadbodies/dead_male_civilian_radio.mdl",
		["desc"] = "Repair a previously broken flashlight.",
		["requirements"] = {["broken_radio"] = 1, ["tape"] = 1, ["battery"] = 1, ["electronics"] = 1},
		["tools"] = {["normal_screwdriver"] = 1},
		["results"] = {["handheld_radio"] = 1},
		["skills"] = {["eng"] = 8}, {["int"] = 12},
		["category"] = "Utilities",
	},
	["repair_flashlight"] = {
		["name"] = "Utilities: Flashlight",
		["model"] = "models/lagmite/lagmite.mdl",
		["desc"] = "Repair a previously broken flashlight.",
		["requirements"] = {["broken_flashlight"] = 1, ["battery"] = 1},
		["tools"] = {["normal_screwdriver"] = 1},
		["results"] = {["flashlight"] = 1},
		["skills"] = {["eng"] = 10, ["int"] = 3},
		["category"] = "Utilities",
	},
	["paper_newspaper"] = {
		["name"] = "Materials: Pieces of paper",
		["model"] = "models/kek1ch/notes_document_case_3.mdl",
		["desc"] = "Get a nice pieces of paper for writing on from a newspaper.",
		["requirements"] = {["newspaper"] = 1, ["normal_sciss"] = 1},
		["results"] = {["paper"] = 4},
		["category"] = "Materials",
	},
	["craft_bandage"] = {
		["name"] = "Medicine: Bandage",
		["model"] = "models/props_wasteland/prison_toiletchunk01f.mdl",
		["desc"] = "Clean the cloth from dirt and pack it in a tampon.",
		["requirements"] = {["newspaper"] = 1, ["mushroom_vodka"] = 1},
		["results"] = {["wound_bandage"] = 1},
		["category"] = "Medicine",
	},
	["paper_porn"] = {
		["name"] = "Materials: Pieces of paper",
		["model"] = "models/kek1ch/notes_document_case_3.mdl",
		["desc"] = "Get some nice pieces of paper for writing on from a porno magazine.",
		["requirements"] = {["porn"] = 1, ["normal_sciss"] = 1},
		["results"] = {["paper"] = 3},
		["category"] = "Materials",
	},
	["porn"] = {
		["name"] = "Other: Porn magazine",
		["model"] = "models/kek1ch/notes_writing_book_2.mdl",
		["desc"] = "Haha! You really just need it, man.",
		["requirements"] = {["paper"] = 12, ["tape"] = 1},
		["results"] = {["porn"] = 1},
		["category"] = "Materials"
	}
}


for k, v in pairs(NEW_RECIPES) do
	PLUGIN:AddRecipe(v.name, v.model, v.desc, v.requirements, v.results, k, v.skills or nil, v.blueprint or nil, v.workstation or nil, v.tools or nil, v.tier, v.entity or nil, v.category or "Miscellaneous")
end

--[[-------------------------------------------------------------------------
Tying in with the 'Citizen Production Plugin', adding schematics for study.
---------------------------------------------------------------------------]]
for k, v in pairs(ix.item.list) do
	if v.category == "Schematics" then
		local tbl = v.requirements
		local tbl2 = v.result
		local req_table_empty = {}
		local res_table_empty = {}
		for k2, v2 in pairs(tbl) do
			req_table_empty[v2[1]] = v2[2]
		end
		for k3,v3 in pairs(tbl2) do
			if v3[1] != "manufacturing_ticket" then
				res_table_empty[v3[1]] = v3[2]
			end
		end
		PLUGIN:AddRecipe(v.name, v.model, v.description .. "\nYou studied this blueprint from the factories.", req_table_empty, res_table_empty, v.uniqueID, false, v.uniqueID)
	end
end

ix.util.Include("cl_plugin.lua")
ix.util.Include("sv_plugin.lua")
ix.util.Include("sh_items.lua")

ix.command.Add("BlueprintGive", {
	description = "Give a blueprint to a player.",
	adminOnly = true,
	arguments = {ix.type.character, ix.type.string},
	OnRun = function(self, client, target, blueprint)
		local data = target:GetData("blueprints", {})

		if not table.HasValue(data, blueprint) then
			table.insert(data, blueprint)
		else
			client:Notify(target:GetName() .. " already has this blueprint.")

			return
		end

		target:SetData("blueprints", data)
		client:Notify("You have given " .. target:GetName() .. " the blueprint " .. blueprint .. ".")
		target.player:Notify("You have been given the blueprint " .. blueprint .. " by " .. client:Name())
	end
})

ix.command.Add("BlueprintRemove", {
	description = "Give a blueprint to a player.",
	adminOnly = true,
	arguments = {ix.type.character, ix.type.string},
	OnRun = function(self, client, target, blueprint)
		local data = target:GetData("blueprints", {})

		if table.HasValue(data, blueprint) then
			table.RemoveByValue(data, blueprint)
		else
			client:Notify(target:GetName() .. " does not have this blueprint.")
		end

		target:SetData("blueprints", data)
		client:Notify("You have taken " .. target:GetName() .. " the blueprint " .. blueprint .. ".")
		target.player:Notify("You have had the blueprint " .. blueprint .. " taken from you by " .. client:Name())
	end
})

local charMeta = ix.meta.character

function charMeta:GiveBlueprint(blueprint)
	local data = self:GetData("blueprints", {})

	if not table.HasValue(data, blueprint) then
		table.insert(data, blueprint)
	end

	self:SetData("blueprints", data)
end

function charMeta:RemoveBlueprint(blueprint)
	local data = target:GetData("blueprints", {})

	if table.HasValue(data, blueprint) then
		table.RemoveByValue(data, blueprint)
	end

	target:SetData("blueprints", data)
end