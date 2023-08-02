ITEM.name = "Worn KPF Vest"
ITEM.description = "A tattered vest with a faded circular K engraved into the shoulderpads. It appears to be somewhat torn and in poor condition."
ITEM.model = "models/devcon/mrp/props/bodyarmor.mdl"
ITEM.width = 2
ITEM.height = 2
ITEM.armorAmount = 100
ITEM.gasmask = false -- It will protect you from bad air
ITEM.category = "armor"
ITEM.resistance = true -- This will activate the protection bellow
ITEM.chance = 42
ITEM.rare = true
ITEM.damage = { -- It is scaled; so 100 damage * 0.8 will makes the damage be 80.
			0.4, -- Bullets
			0.15, -- Slash
			0.2, -- Shock
			0.1, -- Burn
			0.0, -- Radiation
			0.0, -- Acid
			0.1, -- Explosion
}