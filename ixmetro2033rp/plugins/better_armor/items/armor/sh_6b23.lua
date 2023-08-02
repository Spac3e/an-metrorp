ITEM.name = "Stab Vest"
ITEM.description = "A pre-war soft vest, appearing to be primarily good at defending against blunt & sharp weapons."
ITEM.model = "models/eft_paca_armor/paca_soft_armor.mdl"
ITEM.width = 2
ITEM.height = 2
ITEM.armorAmount = 15
ITEM.gasmask = false -- It will protect you from bad air
ITEM.category = "armor"
ITEM.resistance = true -- This will activate the protection bellow
ITEM.chance = 2
ITEM.rare = true
ITEM.damage = { -- It is scaled; so 100 damage * 0.8 will makes the damage be 80.
			1.0, -- Bullets
			0.5, -- Slash
			0.0, -- Shock
			1.0, -- Burn
			0.0, -- Radiation
			0.0, -- Acid
			0.9, -- Explosion
}