ITEM.name = "KGB Uniform"
ITEM.description = "A thick combative uniform with a faded KGB patch. "
ITEM.model = "models/stalkertnb/outfits/skat_mili.mdl"
ITEM.width = 2
ITEM.height = 2
ITEM.armorAmount = 50
ITEM.gasmask = true -- It will protect you from bad air
ITEM.category = "armor"
ITEM.resistance = true -- This will activate the protection bellow
ITEM.chance = 1
ITEM.rare = true
ITEM.damage = { -- It is scaled; so 100 damage * 0.8 will makes the damage be 80.
			0.7, -- Bullets
			0.7, -- Slash
			0.6, -- Shock
			0.3, -- Burn
			0.1, -- Radiation
			0.3, -- Acid
			0.4, -- Explosion
}
ITEM.replacement = "models/stalkertnb/skat_mili.mdl"

-- models/stalkertnb/ecosuit_green.mdl 