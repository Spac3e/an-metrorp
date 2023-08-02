PLUGIN.name = "Mushroom Farming"
PLUGIN.author = "dickmosi, the mushroom man + cyanide"
PLUGIN.description = "A relatively simple farm plugin for Nutscript 1.1-beta, converted to Helix by some extra fag"

-- This addon requires you to add the 'F' flag yourself, yeah I should make this a config but I won't
ix.flag.Add("F", "Farming Flag")

if SERVER then

	function PLUGIN:LoadData()
		local restored = self:GetData()

		if (restored) then
			for k, v in pairs(restored) do
				local position = v.position
				local angles = v.angles
				local plantState = v.plantState
				local growthTime = v.growthTime
				local farmPlayer = v.farmPlayer
				local bodygroup = v.bodygroup

				local entity = ents.Create("ix_farm")
				entity:SetPos(position)
				entity:SetAngles(angles)
				entity:Spawn()
				entity:Activate()
				entity:SetNetVar("plantState", plantState)
				entity:SetNetVar("growthTime", growthTime)
				entity:SetNetVar("farmPlayer", farmPlayer)
				entity:SetBodygroup(1, bodygroup)
			end
		end
end
	function PLUGIN:SaveData()
		local data = {}
	
		for k, v in pairs(ents.FindByClass("ix_farm")) do
			data[#data + 1] = {
				position = v:GetPos(),
				angles = v:GetAngles(),
				plantState = v:GetNetVar("plantState"),
				growthTime = v:GetNetVar("growthTime"),
				farmPlayer = v:GetNetVar("farmPlayer"),
				bodygroup = v:GetBodygroup(1),
			}
		end
	
			self:SetData(data)
		end
	end