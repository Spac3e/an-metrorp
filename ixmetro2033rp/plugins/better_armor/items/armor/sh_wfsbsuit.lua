ITEM.name = "Winter FSB Uniform"
ITEM.description = "A thick suit intended for use on a winter-based irradiated topside. It appears to be rather heavily armoured and protected witha  built-in gasmask."
ITEM.model = "models/stalkertnb/outfits/skat_mili.mdl"
ITEM.width = 2
ITEM.height = 2
ITEM.armorAmount = 100
ITEM.gasmask = true -- It will protect you from bad air
ITEM.category = "armor"
ITEM.resistance = true -- This will activate the protection bellow
ITEM.chance = 1
ITEM.rare = true
ITEM.damage = { -- It is scaled; so 100 damage * 0.8 will makes the damage be 80.
			1.0, -- Bullets
			1.0, -- Slash
			0.7, -- Shock
			0.6, -- Burn
			1.0, -- Radiation
			0.5, -- Acid
			1.0, -- Explosion
}
ITEM.replacement = "models/hansa_hex/hexed_hansa.mdl"

-- models/stalkertnb/ecosuit_green.mdl 