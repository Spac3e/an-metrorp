ITEM.name = "Stab Vest"
ITEM.description = "A stab vest intended for use against blunts, knives and .22 calibre pistols."
ITEM.model = "models/eft_paca_armor/paca_soft_armor.mdl"
ITEM.width = 2
ITEM.height = 2
ITEM.armorAmount = 10
ITEM.category = "armor"
ITEM.resistance = true -- This will activate the protection bellow
ITEM.chance = 5
ITEM.rare = true
ITEM.damage = { -- It is scaled; so 100 damage * 0.8 will makes the damage be 80.
			0.1, -- Bullets
			0.7, -- Slash
			0.1, -- Shock
			0.1, -- Burn
			0.0, -- Radiation
			0.1, -- Acid
			0.1, -- Explosion
}

-- models/stalkertnb/ecosuit_green.mdl 