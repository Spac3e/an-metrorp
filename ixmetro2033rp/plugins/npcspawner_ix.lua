local PLUGIN = PLUGIN
PLUGIN.name = "NPC Spawner"
PLUGIN.author = "Black Tea (NS 1.0), Neon (NS 1.1); ported to helix by Cyanide"
PLUGIN.description = "NPC Spawner."
PLUGIN.spawnpoints = PLUGIN.spawnpoints or {}
PLUGIN.minplayers = 1

ix.config.Add("spawner_enabled", true, "Whether NPC spawners are on or not.", nil, {
	category = "NPC Spawner"
})

ix.config.Add("npc_spawnrate", 60, "How often an npc will be spawned at an npc spawn point.", nil, {
	data = {min = 1, max = 84600},
	category = "NPC Spawner"
})


PLUGIN.spawngroups = {
	["mutant_common"] = {
		{"vj_mutant_dog_sb"},
		{"vj_mutant_boar_sb"},
		{"vj_mutant_cat_sb"},
		{"vj_mutant_flesh_sb"},
		{"vj_mutant_dog2_sb"},
		{"vj_mutant_tushkan_sb"},
		{"vj_mutant_spider_sb"},
		{"vj_mutant_snork_sb"},
	},
	["mutant_blinddog"] = {
		{"vj_mutant_dog_sb"},
	},
	["mutant_boar"] = {
		{"vj_mutant_boar_sb"},
	},
	["mutant_cat"] = {
		{"vj_mutant_cat_sb"},
	},
	["mutant_flesh"] = {
		{"vj_mutant_flesh_sb"},
	},
	["mutant_parasitedog"] = {
		{"vj_mutant_dog2_sb"},
	},
	["mutant_rodent"] = {
		{"vj_mutant_tushkan_sb"},
	},
	["mutant_spider"] = {
		{"vj_mutant_spider_sb"},
	},
	["mutant_bloodsucker"] = {
		{"vj_mutant_bloodsucker2_sb"},
	},
	["mutant_zombie"] = {
		{"vj_mutant_zombi_sb"},
	},	
}



PLUGIN.maxnpcs = 100
PLUGIN.spawnedNPCs = PLUGIN.spawnedNPCs or {}

if SERVER then
	local spawntime = 1
	
	function PLUGIN:Think()
		if #player.GetAll() < PLUGIN.minplayers then return end
		if spawntime > CurTime() then return end
		spawntime = CurTime() + ix.config.Get("npc_spawnrate", 90)
		for k, v in ipairs(self.spawnedNPCs) do
			if (!v:IsValid()) then
				table.remove(self.spawnedNPCs, k)
			end
		end

		if #self.spawnedNPCs >= self.maxnpcs then return end


		local v = table.Random(self.spawnpoints)

		if(!ix.config.Get("spawner_enabled", false)) then
			return
		end
		
		if (!v) then
			return
		end

		local data = {}
		data.start = v[1]
		data.endpos = data.start + Vector(0, 0, 1)
		data.filter = client
		data.mins = Vector(-16, -16, 0)
		data.maxs = Vector(16, 16, 16)

		local idat = self.spawngroups[v[2]]

		if !istable(idat) then return end
		local randtab = table.Random(idat)
		npc_class, npc_weapon = randtab[1], randtab[2]

		--nut.item.spawn(idat, v[1] + Vector( math.Rand(-8,8), math.Rand(-8,8), 20 ), nil, AngleRand())
			
		local trace = util.TraceHull(data)

		
		local nearby = false 
		local players = player.GetAll()
		
		--dont want to spawn them in too close to players
		if(players) then
			for k, v in pairs(players) do
				if(v:GetMoveType() == MOVETYPE_NOCLIP) then
					continue
				end
			
				if v:GetPos():DistToSqr(data.endpos) < 1000 * 1000 then --squared is more efficient
					nearby = true
					break
				end
			end
		end
		
		if (!nearby and !trace.Entity:IsValid()) then --dont want the npcs to stack on each other or spawn inside something.
			local ent = ents.Create(npc_class)
			
			table.insert(self.spawnedNPCs, ent)
			if npc_weapon then
				ent:SetKeyValue('additionalequipment',npc_weapon)
			end

			if (ent:IsValid()) then
				ent:SetPos(data.endpos + Vector(0,0,25))
				ent:Spawn()
				ent:Activate()
			end
			
			
			
		end
	end

	function PLUGIN:LoadData()
		self.spawnpoints = self:GetData() or {}
	end

	function PLUGIN:SaveData()
		self:SetData(self.spawnpoints)
	end

else

	netstream.Hook("nut_DisplaySpawnPoints", function(data)
		for k, v in pairs(data) do
			local emitter = ParticleEmitter( v[1] )
			local smoke = emitter:Add( "sprites/glow04_noz", v[1] )
			smoke:SetVelocity( Vector( 0, 0, 1 ) )
			smoke:SetDieTime(10)
			smoke:SetStartAlpha(255)
			smoke:SetEndAlpha(255)
			smoke:SetStartSize(64)
			smoke:SetEndSize(64)
			smoke:SetColor(255,50,50)
			smoke:SetAirResistance(300)
		end
	end)

end

ix.command.Add("npcspawnadd", {
	adminOnly = true,
	syntax = "<string npcgroup>",
	arguments = {ix.type.text},
	OnRun = function(self, client, npcgroup)
		local trace = client:GetEyeTraceNoCursor()
		local hitpos = trace.HitPos + trace.HitNormal*5
		local spawngroup = npcgroup or "default"
		table.insert(PLUGIN.spawnpoints, { hitpos, spawngroup })
		client:Notify("You added ".. spawngroup .. " npc spawner.")
	end 
})

ix.command.Add("npcspawnremove", {
	adminOnly = true,
	OnRun = function(self, client, arguments)
		local trace = client:GetEyeTraceNoCursor()
		local hitpos = trace.HitPos + trace.HitNormal*5
		local range = arguments[1] or 128
		local mt = 0
		for k, v in pairs( PLUGIN.spawnpoints ) do
			local distance = v[1]:DistToSqr(hitpos)
			if distance <= tonumber(range) * tonumber(range) then
				PLUGIN.spawnpoints[k] = nil
				mt = mt + 1
			end
		end
		client:Notify(mt .. " npc spawners has been removed.")
	end
})

ix.command.Add("npcspawndisplay", {
	adminOnly = true,
	OnRun = function(self, client, arguments)
		if SERVER then
			netstream.Start(client, "nut_DisplaySpawnPoints", PLUGIN.spawnpoints)
			client:Notify("Displayed All Points for 10 secs.")
		end
	end
})

ix.command.Add("npcspawntoggle", {
	adminOnly = true,
	OnRun = function(self, client, arguments)
		if(ix.config.Get("spawner_enabled", false)) then
			ix.config.Set("spawner_enabled", false)
			client:Notify("NPC Spawners have been turned off.")
		else
			ix.config.Set("spawner_enabled", true)
			client:Notify("NPC Spawners have been turned on.")
		end
	end
})

-- NPC Drop Plugin
PLUGIN.npclist = {
	"npc_vjks_blacksun_grunt",
	"npc_vjks_blacksun_lieutenant",
	"npc_vjks_blacksun_trooper"
}
PLUGIN.droptable = {
	["common"] = {
		"bandage",
	}
}

function PLUGIN:OnNPCKilled(entity)
	local class = entity:GetClass()
	local dropchance = math.Rand( 0, 100 )
	for k, v in pairs (PLUGIN.npclist) do
		if class == v then
			for a, b in pairs(table.Random(PLUGIN.droptable)) do
				if math.Rand( 0, 100 ) > dropchance then return end
				ix.item.Spawn(b, entity:GetPos() + Vector( 0, 0, 8 ))
			end
		end
	end
end