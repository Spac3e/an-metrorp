local PLUGIN = PLUGIN
ITEM.name = "Medical Kit"
ITEM.model = Model("models/bioshockinfinite/health_pack.mdl")
ITEM.description = "A bag containing basic surgical supplies and medical supplies."
ITEM.category = "Medical"
ITEM.chance = 31
ITEM.rare = true
ITEM.functions.Apply = {
	sound = "items/medshot4.wav",
	OnRun = function(itemTable)
		local client = itemTable.player

		client:SetHealth(math.min(client:Health() + 30, client:GetMaxHealth()))
	end
}
ITEM.functions.Apply = {
	OnRun = function(itemTable)
		local client = itemTable.player

		client:SetHealth(math.min(client:Health() + 25, client:GetMaxHealth()))
	end
}
ITEM.functions.ApplyTarget = {
	name = "Heal the person opposite",
	icon = "icon16/heart_add.png",
	sound = "items/medshot4.wav",
	OnRun = function(itemTable)
		local pl = itemTable.player
		local data = {}
			data.start = pl:GetShootPos()
			data.endpos = data.start + pl:GetAimVector() * 96
			data.filter = pl
		local target = util.TraceLine(data).Entity

		if target:IsValid() and target:IsPlayer() then
			PLUGIN:SetFracture(target, false)
			return true
		end

		return false
	end
}