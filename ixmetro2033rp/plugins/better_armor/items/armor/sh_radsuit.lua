ITEM.name = "Radiation Suit"
ITEM.description = "A thick suit intended for use in high-radiation areas. It features some additional protection from blunts & bullets, albeit a minimal amount."
ITEM.model = "models/stalkertnb/outfits/seva_loner.mdl"
ITEM.width = 2
ITEM.height = 2
ITEM.armorAmount = 25
ITEM.gasmask = true -- It will protect you from bad air
ITEM.category = "armor"
ITEM.resistance = true -- This will activate the protection bellow
ITEM.chance = 2
ITEM.rare = true
ITEM.damage = { -- It is scaled; so 100 damage * 0.8 will makes the damage be 80.
			0.2, -- Bullets
			0.2, -- Slash
			0.3, -- Shock
			0.8, -- Burn
			1.0, -- Radiation
			0.1, -- Acid
			0.3, -- Explosion
}
ITEM.replacement = "models/cultist_kun/red_stalker.mdl"

-- models/stalkertnb/ecosuit_green.mdl 