ITEM.name = "KPF Vest"
ITEM.description = "A vest with a circular K engraved into the shoulderpads. It appears to be relatively heavy and military grade."
ITEM.model = "models/devcon/mrp/props/bodyarmor.mdl"
ITEM.width = 2
ITEM.height = 2
ITEM.armorAmount = 50
ITEM.gasmask = false -- It will protect you from bad air
ITEM.category = "armor"
ITEM.resistance = true -- This will activate the protection bellow
ITEM.chance = 1
ITEM.rare = true
ITEM.damage = { -- It is scaled; so 100 damage * 0.8 will makes the damage be 80.
			0.7, -- Bullets
			0.85, -- Slash
			0.7, -- Shock
			0.3, -- Burn
			0.1, -- Radiation
			0.1, -- Acid
			0.4, -- Explosion
}