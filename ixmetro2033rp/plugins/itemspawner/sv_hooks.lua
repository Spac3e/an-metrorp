
local PLUGIN = PLUGIN

PLUGIN.items = PLUGIN.items or {common = {}, rare = {}}
PLUGIN.weight = PLUGIN.weight or {common = 0, rare = 0}

util.AddNetworkString("ixItemSpawnerManager")
util.AddNetworkString("ixItemSpawnerDelete")
util.AddNetworkString("ixItemSpawnerEdit")
util.AddNetworkString("ixItemSpawnerGoto")
util.AddNetworkString("ixItemSpawnerSpawn")
util.AddNetworkString("ixItemSpawnerChanges")

function PLUGIN:LoadData()
	PLUGIN.spawner = self:GetData() or {}
end

function PLUGIN:SaveData()
	self:SetData(PLUGIN.spawner)
end

function PLUGIN:InitializedPlugins()
	self.weight = {common = 0, rare = 0}
	self.items = {common = {}, rare = {}}

	for k,v in pairs(ix.item.list) do
		if (v.chance) then
			if (v.rare) then
				self.items.rare[k] = v.chance

				self.weight.rare = self.weight.rare + v.chance
			else
				self.items.common[k] = v.chance

				self.weight.common = self.weight.common + v.chance
			end
		end
	end
end

function PLUGIN:AddSpawner(client, position, title)
	if !(CAMI.PlayerHasAccess(client, "Helix - Item Spawner", nil)) then return end

	local respawnTime = ix.config.Get("spawnerRespawnTime", 600)
	local offsetTime  = ix.config.Get("spawnerOffsetTime", 100)
	if (respawnTime < offsetTime) then
		offsetTime = respawnTime - 60
	end

	table.insert(PLUGIN.spawner.positions, {
		["ID"] = os.time(),
		["title"] = title,
		["delay"] = math.random(respawnTime - offsetTime, respawnTime + offsetTime),
		["lastSpawned"] = os.time(),
		["author"] = client:SteamID64(),
		["position"] = position,
		["rarity"] = ix.config.Get("spawnerRareItemChance", 0)
	})

end

function PLUGIN:RemoveSpawner(client, title)
	if !(CAMI.PlayerHasAccess(client, "Helix - Item Spawner", nil)) then return end

	for k, v in ipairs(PLUGIN.spawner.positions) do
		if (v.title:lower() == title:lower()) then
			table.remove(PLUGIN.spawner.positions, k)
			return true
		end
	end
	return false
end

function PLUGIN:ForceSpawn(client, spawner)
	if !(CAMI.PlayerHasAccess(client, "Helix - Item Spawner", nil)) then return end
	if !(ix.config.Get("spawnerActive")) then return end

	spawner.lastSpawned = os.time()
	local rareChance = math.random(100)

	local bRareSpawn = (rareChance < tonumber(spawner.rarity))

	local weightedItemID = self:FindItemByWeight(bRareSpawn)

	if (!weightedItemID) then
		return
	end

	ix.item.Spawn(weightedItemID, spawner.position)
end

function PLUGIN:FindItemByWeight(bIsRare)
	local itemID, overallWeight, randomWeight, currentWeight

	overallWeight = bIsRare and self.weight.rare or self.weight.common
	currentWeight = overallWeight
	randomWeight = math.Rand(0, currentWeight)

	if (overallWeight < 1) then return false end

	if (bIsRare) then
		for k,v in pairs(self.items.rare) do
			currentWeight = currentWeight - v

			if (randomWeight >= (currentWeight - v)) then
				return k
			end
		end
	else
		for k,v in pairs(self.items.common) do
			currentWeight = currentWeight - v

			if (randomWeight >= (currentWeight - v)) then
				return k
			end
		end
	end
end

function PLUGIN:Think()
	if (!PLUGIN.spawner.positions or table.IsEmpty(PLUGIN.spawner.positions) or !(ix.config.Get("spawnerActive", false))) then return end

	for k, v in pairs(PLUGIN.spawner.positions) do
		if (v.lastSpawned + (v.delay * 60) < os.time()) then
			v.lastSpawned = os.time()
			local rareChance = math.random(100)
			local randomWeight
			local item

			local bRareSpawn = (rareChance <= ix.config.Get("spawnerRareItemChance", 0))

			local weightedItemID = self:FindItemByWeight(bRareSpawn)

			if (!weightedItemID) then
				return
			end

			ix.item.Spawn(weightedItemID, v.position)
		end
	end
end

net.Receive("ixItemSpawnerDelete", function(length, client)
	if !(CAMI.PlayerHasAccess(client, "Helix - Item Spawner", nil)) then return end

	local item = net.ReadString()
	PLUGIN:RemoveSpawner(client, item)
end)

net.Receive("ixItemSpawnerGoto", function(length, client)
	if !(CAMI.PlayerHasAccess(client, "Helix - Item Spawner", nil)) then return end

	local position = net.ReadVector()
	client:SetPos(position)
end)

net.Receive("ixItemSpawnerSpawn", function(length, client)
	if !(CAMI.PlayerHasAccess(client, "Helix - Item Spawner", nil)) then return end

	local item = net.ReadTable()
	PLUGIN:ForceSpawn(client, item)
end)

net.Receive("ixItemSpawnerChanges", function(length, client)
	if !(CAMI.PlayerHasAccess(client, "Helix - Item Spawner", nil)) then return end

	local changes = net.ReadTable()

	for k, v in ipairs(PLUGIN.spawner.positions) do
		if (v.ID == changes[1]) then
			v.title = changes[2]
			v.delay = math.Clamp(changes[3], 1, 10000)
			v.rarity  = math.Clamp(changes[4], 0, 100)
		end
	end

end)
