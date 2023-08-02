AddCSLuaFile()

ENT.Type = "anim"
ENT.PrintName = "Water Faucet"
ENT.Author = "dickmosi"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.Category = "Helix - Farm"

if (SERVER) then
	function ENT:Initialize()
		self:SetModel("models/props_wasteland/prison_pipefaucet001a.mdl")
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
	angles.y = 0 - 90

	local ent = ents.Create( ClassName )
	ent:SetPos(trace.HitPos)
	ent:SetAngles(angles)
	ent:Spawn()
	
	return ent

end

local breakRNG = math.random(1,10)

function ENT:OnTakeDamage(damage)
	if breakRNG == 1 then
		self:EmitSound("doors/vent_open"..math.random(1,3)..".wav")
	else end		
end

function ENT:Use(activator)

sound.Add( {
	name = "water_flow",
	volume = 1.0,
	level = 100,
	pitch = {95, 110},
	sound = "ambient/water/leak_1.wav"
})

local char = activator:GetCharacter()
local inventory = char:GetInventory()

	if !char:HasFlags("F") then
		activator:Notify("You don't have permission to use this.")
		return false
	end
	
	for k, v in pairs( inventory:getItems() ) do -- Kinda ugly doing this twice but- wait who am i talking to with this? i have no idea
		if v:GetData("filled", nil) == nil and v.isFillable then
			brauchtWasser = 1 -- das ist gut ja!
		end
	end
	
	if brauchtWasser == 0 then
		activator:Notify("You don't have any containers to fill.")
		return false
	else brauchtWasser = 0 end
	
	self:EmitSound("doors/door_squeek1.wav")
	self:EmitSound("water_flow")
	
	local oldPos = activator:GetPos()
	activator:SetAction("Filling...", 6, function()
		if(activator:GetPos():Distance(oldPos) > 50) then
			activator:Notify("Failed, too far away.")
			self:StopSound("water_flow")
			return false
		end
		
	for k, v in pairs( inventory:GetItems() ) do
		if v:GetData("filled", nil) == nil and v.isFillable then
			v:SetData("filled", true)
		end
	end
		
	self:EmitSound("buttons/lever3.wav")
	self:StopSound("water_flow")

	end)
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
		-- drawText(self.Desc, x, y+25, Color(255, 255, 255, alpha), 1, 1, nil, alpha * 0.65)
	end
end