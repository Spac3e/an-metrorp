local PLUGIN = PLUGIN

local MutantTable = {
    ["models/muffinvibe/2033/nosali.mdl"] = "nosalismeat",
    ["models/muffinvibe/2033/watcher.mdl"] = "ratmeat",
    ["models/stalkermodels/animals/stalker_red.mdl"] = "rawdog",
    ["models/stalkermodels/animals/stalker_big.mdl"] = "rawdog",
    ["models/stalkermodels/animals/stalker_bul.mdl"] = "rawdog",
    ["models/jerry/mutants/stalker_anomaly_flesh.mdl"] = "pigmeat",
}

function PLUGIN:KeyPress(client, key)
	if (client:GetCharacter()) then
		if (client:Alive()) then
			local Hit = client:GetEyeTraceNoCursor()
			local npc = Hit.Entity
			if (key == IN_USE) then -- key 
				if (npc:IsRagdoll() and MutantTable[npc:GetModel()]) then
					client:Freeze(true) 
					client:forceSequence("dinamit_0") -- anim here
					npc:EmitSound( "interface/inv_mutant_loot_animal.ogg", 50, 100 ) -- sound
					client:ScreenFade( SCREENFADE.OUT, Color( 0, 0, 0 ), 1, 3 ) 
					timer.Simple(1,function() 
						client:ScreenFade( SCREENFADE.IN, Color( 0, 0, 0 ), 1, 3 ) 
					end)
					timer.Simple(5, function() 
						client:Freeze(false)
						if IsValid(npc) then
							npc:Remove()
						end
						if (client:GetActiveWeapon():GetClass() == "weapon_cop_knife" and npc:GetPos():Distance( client:GetPos() ) <= 55) then -- weapon id here
							for i = 1,2 do -- replace 2 with how many items u want e.g i= 1,5 will make it spawn 5 of x item
								ix.item.Spawn(MutantTable[npc:GetModel()], npc:GetPos() + Vector(0, 0, 8) )
							end
						end
					end)
				end
			end
		end
	end
end
