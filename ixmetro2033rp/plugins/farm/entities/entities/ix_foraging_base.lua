AddCSLuaFile()

ENT.Type = "anim"
ENT.PrintName = "Foraging Base"
ENT.Desc = ""
ENT.Author = "dickmosi"
ENT.Spawnable = false
ENT.AdminOnly = true
ENT.Category = "Helix - Farm"

ENT.model = "models/illusion/metroexodus/mushroom.mdl"
ENT.forageReward = "mushroom_cluster"

if (SERVER) then
	function ENT:Initialize()
		self:SetModel(self.model)
		self:SetSolid(SOLID_VPHYSICS)
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetUseType(SIMPLE_USE)

		local physObj = self:GetPhysicsObject()

		if (IsValid(physObj)) then
			physObj:EnableMotion(false)
			physObj:Sleep()
		else
			local min, max = Vector(-8, -8, -8), Vector(8, 8, 8)

			self:PhysicsInitBox(min, max)
			self:SetCollisionBounds(min, max)
		end
	end
	
function ENT:SpawnFunction(client, trace)
	local angles = (trace.HitPos - client:GetPos()):Angle()
	angles.r = 0
	angles.p = 0
	angles.y = 0 + math.random(0,360)

	local ent = ents.Create( ClassName )
	ent:SetPos(trace.HitPos)
	ent:SetAngles(angles)
	ent:Spawn()
	
	return ent

end


function ENT:OnTakeDamage(damage)
	self:Destroy()
end

function ENT:Use(activator)


	self:EmitSound("npc/barnacle/barnacle_tongue_pull"..math.random(1,3)..".wav")
	
	local oldPos = activator:GetPos()
	activator:SetAction("Harvesting...", 3, function()
		if(activator:GetPos():Distance(oldPos) > 50) then
			activator:Notify("Harvesting failed, too far away.")
			self:EmitSound("physics/body/body_medium_impact_soft"..math.random(1,7)..".wav")
			return false
		end

	local char = activator:GetCharacter()
	local inventory = char:GetInventory()
	local RNGbullshit = math.random(1,10)
	
		if !char:HasFlags("F") then
			if RNGbullshit < 3 then
				activator:Notify("You fail to harvest the "..self.PrintName..".")
				self:Destroy()
				return false
			else
				activator:Notify("You harvest the "..self.PrintName..".")
				inventory:Add(self.forageReward)
			end
		else
			activator:Notify("You harvest the "..self.PrintName..".")
			inventory:Add(self.forageReward)
		end
		self:EmitSound("npc/barnacle/neck_snap1.wav")
		self:Remove()
	end)
end

function ENT:Destroy()
		local position = self:LocalToWorld(self:OBBCenter())

		local effect = EffectData()
			effect:SetStart(position)
			effect:SetOrigin(position)
			effect:SetScale(1)
		util.Effect("AntlionGib", effect)
		self:EmitSound("npc/antlion_grub/squashed.wav")
		self:Remove()
end

else
	function ENT:Draw()
		self:DrawModel()
	end

	ENT.DrawEntityInfo = true
	local toScreen = FindMetaTable("Vector").ToScreen
	local colorAlpha = ColorAlpha
	local drawText = ix.util.DrawText
	local configGet = ix.config.Get

	function ENT:onDrawEntityInfo(alpha)
		local position = toScreen(self.LocalToWorld(self, self.OBBCenter(self)))
		local x, y = position.x, position.y
		drawText(self.Name or self.PrintName, x, y, colorAlpha(configGet("color"), alpha), 1, 1, nil, alpha * 2)

		drawText(self.Desc, x, y+25, Color(255, 255, 255, alpha), 1, 1, nil, alpha * 0.65)
	end
end