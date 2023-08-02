ITEM.name = "Heroin"
ITEM.description = "A plastic bag containing a gram of heroin. When injected or inhaled, it sends the user into a euphoric state."
ITEM.model = Model("models/mosi/fallout4/props/junk/components/crystal.mdl")
ITEM.category = "Drugs"
ITEM.width = 1
ITEM.height = 1
ITEM.chance = 32
ITEM.rare = true

ITEM.functions.Consume = {
	OnRun = function(itemTable)
		local client = itemTable.player
		
		client:GetCharacter():AddBoost("buff", "str", 40)
		client:GetCharacter():AddBoost("debuff", "int", -40)
		client:GetCharacter():AddBoost("buff", "end", 10)
		client:GetCharacter():AddBoost("debuff", "agi", -30)
		client:SetHealth(math.Clamp(client:Health() - 30, 0, client:GetMaxHealth()))
		hook.Run("SetupDrugTimer", client, client:GetCharacter(), 600)  --Seconds
	end
}