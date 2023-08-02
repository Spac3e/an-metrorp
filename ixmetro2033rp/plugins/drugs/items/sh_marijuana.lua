
ITEM.name = "Marijuana Joint"
ITEM.description = "A rolled up cigarette featuring marijuana instead of tobacco."
ITEM.model = Model("models/mosi/fallout4/props/junk/cigar.mdl")
ITEM.category = "Drugs"
ITEM.width = 1
ITEM.height = 1
ITEM.chance = 55

ITEM.functions.Consume = {
	OnRun = function(itemTable)
		local client = itemTable.player
		
		client:GetCharacter():AddBoost("buff", "str", 20)
		client:GetCharacter():AddBoost("debuff", "int", -20)
		client:SetHealth(math.Clamp(client:Health() - 10, 0, client:GetMaxHealth()))
		hook.Run("SetupDrugTimer", client, client:GetCharacter(), 180)  --Seconds
	end
}