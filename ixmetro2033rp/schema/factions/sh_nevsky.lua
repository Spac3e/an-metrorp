FACTION.name = "Nevsky Citizen"
FACTION.description = "A proud citizen of Nevsky Prospekt."
FACTION.color = Color(145, 104, 0, 255)
FACTION.isDefault = false
FACTION.isGloballyRecognized = false
FACTION_NEVSKY = FACTION.index
function FACTION:OnCharacterCreated(client, character)
    inventory:Add("torch", 1)
end
