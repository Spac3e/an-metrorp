FACTION.name = "Prospekt Militia"
FACTION.description = "A proud civil defender of peace within Nevsky Prospekt."
FACTION.color = Color(255, 191, 0, 255)
FACTION.isDefault = false
FACTION.isGloballyRecognized = false
FACTION_MILITIA = FACTION.index
function FACTION:OnCharacterCreated(client, character)
    inventory:Add("torch", 1)
end
