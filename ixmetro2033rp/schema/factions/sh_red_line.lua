
FACTION.name = "The Commune"
FACTION.description = "A Neo-Communist faction aimed at restoring the USSR in the Metro."
FACTION.color = Color(255, 0, 0, 255)
FACTION.isDefault = false
FACTION.isGloballyRecognized = false

function FACTION:OnCharacterCreated(client, character)
    inventory:Add("suitcase", 1)
end

FACTION_RED = FACTION.index
