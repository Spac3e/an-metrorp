ITEM.name = "Ether"
ITEM.description = "A plastic bag containing a seemingly invisible substance, that when inhaled seems to put the individual in a euphoric, vegetable like state."
ITEM.model = Model("models/kek1ch/dev_caffeine.mdl")
ITEM.category = "Drugs"
ITEM.width = 1
ITEM.height = 1

ITEM.functions.Consume = {
	OnRun = function(itemTable)
		local client = itemTable.player
		
		client:GetCharacter():AddBoost("debuff", "str", -100)
		client:GetCharacter():AddBoost("debuff", "int", -100)
		client:GetCharacter():AddBoost("debuff", "end", -100)
		client:GetCharacter():AddBoost("debuff", "agi", -100)
		client:GetCharacter():AddBoost("debuff", "eng", -100)
		client:GetCharacter():AddBoost("debuff", "mec", -100)
		client:GetCharacter():AddBoost("debuff", "com", -100)
		client:GetCharacter():AddBoost("debuff", "wea", -100)
		client:GetCharacter():AddBoost("debuff", "med", -100)
		client:GetCharacter():AddBoost("debuff", "acr", -100)
		client:SetHealth(math.Clamp(client:Health() - 70, 0, client:GetMaxHealth()))
		hook.Run("SetupDrugTimer", client, client:GetCharacter(), 2000)  --Seconds
	end
}