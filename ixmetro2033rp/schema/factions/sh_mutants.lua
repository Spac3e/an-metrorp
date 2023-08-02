FACTION.name = "Mutants"
FACTION.description = "One of the many mutated creatures of the Metro.."
FACTION.color = Color(100, 100, 100, 255)
FACTION.isDefault = false
FACTION.isGloballyRecognized = true

function FACTION:OnCharacterCreated(client, character)
    inventory:Add("suitcase", 1)
end

FACTION_MUTANT = FACTION.index
