AddCSLuaFile()

ENT.Type = "anim"
ENT.PrintName = "Mushroom Farm"
ENT.Author = "dickmosi"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.Category = "Helix - Farm"

ENT.growthDelay = 86400 -- 1 day: How long the mushrooms take to grow (in seconds) 
ENT.growthStageTimer = 1800 -- 30 minutes: How often the growth stage timer should run (in seconds) 

if (SERVER) then
	function ENT:Initialize()
		self:SetModel("models/farm/mushroom_farm.mdl") -- Requires content (1, 2 and 3) https://steamcommunity.com/sharedfiles/filedetails/?id=1567871325
		self:SetSolid(SOLID_VPHYSICS) -- shitty model slapped together by dickmosi :)
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetUseType(SIMPLE_USE)
		
		timerDelay = 0

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
	angles.y = 0 + 90 -- Makes it face the person who spawns it in, FANCY!

	local ent = ents.Create( ClassName )
	ent:SetPos(trace.HitPos)
	ent:SetAngles(angles)
	ent:Spawn()
	
	return ent

end

-- Useful for debugging - Could use this for harvesting if you wanted to be fancy.
-- function ENT:OnTakeDamage(damage)
	-- local client = damage:GetInflictor()
-- end

----------------------------------------------*NOW LESS* STUPID TIMER
--[[
The timer below will compare the growth time with os.time() to see how far along the mushrooms have grown.
#There are four stages:#
Dirt 		- Default. Nothing planted 	(timer doesn't touch this)
Planted 	- Something planted 		(timer doesn't touch this)
Halfway 	- Crop is halfway grown
Done	 	- Crop is fully grown
--]]

function ENT:Think()
	
	if self:GetNetVar("timerShouldRun") and self:GetNetVar("plantState") then -- Incase farm is harvested mid-timer
		if self:GetNetVar("growthTime") < os.time() then
			self:SetBodygroup(1, 3) -- Fully grown
			self:SetNetVar("timerShouldRun", false)
		elseif ((self:GetNetVar("growthTime") - (self.growthDelay / 2)) < os.time()) then
			self:SetBodygroup(1, 2) -- Half Grown
		else end
	end

	timerDelay = CurTime() + self.growthStageTimer
	self:NextThink(timerDelay) -- Set the next think to run as soon as possible, i.e. the next frame.
	return true
end

-----------------------------------------------------

function ENT:Use(activator)
--Timer to prevent people spamming E on this entity.
if (nextUse or 0) > CurTime() then -- Prevents overlap as opposed to activator.nextUse (Which could lead to potential overlap)
	return false
end

nextUse = CurTime() + 2
activator.hatWasser = 0 -- this is why
activator.wassercheck = 0

local char = activator:GetCharacter()
local inventory = char:GetInventory()
local getPlantState = self:GetNetVar("plantState")

if !char:HasFlags("F") then
	activator:Notify("You do not have permission to use this farm.")
	return false
end

if getPlantState == false then
	for k, v in pairs( inventory:GetItems() ) do
		if v.isFillable and v:GetData("filled", nil) ~= nil then
			activator.hatWasser = 1 -- das ist gut ja!
		end
	end
	
	if activator.hatWasser == 0 then
		activator:Notify("You need both mushroom seeds and water to plant here.")
		return false
	else activator.hatWasser = 0 end
end

---------------------------THIS IS WHERE THE PLANTING AND HARVESTING ACTUALLY HAPPENS


if getPlantState == false or getPlantState == nil then -- Setting plantstate on init may overwrite plugin save data
	if inventory:HasItem("mushroom_seeds") and inventory:HasItem("farm_water") then -- If both true then plant
	
		local seeds = inventory:HasItemOfBase("mushroom_seeds")
		
		self:EmitSound("physics/cardboard/cardboard_box_impact_hard"..math.random(1,7)..".wav")
		self:SetNetVar("plantState", true)
		self:SetNetVar("farmPlayer", char:GetName())
		self:SetNetVar("growthTime", os.time() + self.growthDelay)
		ix.log.AddRaw(activator:GetCharacter():GetName().." has planted some mushrooms.")
		
		seeds:Remove()
		
		for k, v in pairs( inventory:GetItems() ) do
			if v.isFillable and v:GetData("filled", nil) ~= nil and activator.wassercheck == 0 then
				activator.wassercheck = 1
				v:SetData("filled", nil)
			end
		end
		
		activator.wassercheck = 0
		
		self:SetBodygroup(1, 1)
		activator:Notify("You have planted some mushrooms.")
		self:SetNetVar("timerShouldRun", true) -- Turns on stupid bodygroup update timer
		
	else
		activator:Notify("You need both mushroom seeds and water to plant here.")
	end
end
	if getPlantState == true then
		if self:GetNetVar("growthTime") < os.time() then -- If something is planted and it's ready, let me harvest mofo
			self:EmitSound("physics/cardboard/cardboard_box_impact_bullet"..math.random(1,5)..".wav")
			self:EmitSound("npc/barnacle/barnacle_crunch"..math.random(2,3)..".wav")
			self:EmitSound("physics/wood/wood_strain"..math.random(1,6)..".wav")
			
			self:SetNetVar("timerShouldRun", false)
			self:SetNetVar("plantState", false)
			self:SetBodygroup(1, 0)
	
			ix.item.Spawn("mushroom_crate", activator:GetItemDropPos())
			
			activator:Notify("You have harvested the mushrooms and packed them into a crate.")
			ix.log.AddRaw(activator:GetCharacter():GetName().." has gained a mushroom crate from farming.")
			
		else
			activator:Notify("The mushrooms have not grown yet.")
		end
		return false
	end
end
----------------------------------------------------THIS IS WHERE IT ENDS AND WHERE THE BORING UI CODE BEGINS
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
		
			local getPlantState = self:GetNetVar("plantState")
			
			if getPlantState == false or getPlantState == nil then
				entDesc = "Nothing is planted here right now."
			else
				local growthDate = os.date("%X %p on %d/%m/%y", self:GetNetVar("growthTime")) 
				local farmPlayer = self:GetNetVar("farmPlayer") -- Who the fuck planted it, stops people nabbing people farm spots. Could add in an owner system but I could also try lose weight and that shit ain't happening anytime soon.
				entDesc = ("Growing Mushrooms planted by "..farmPlayer..". Harvestable at "..growthDate)
			end											-- Display date and time that crops will be fully grown
		
		drawText(entDesc, x, y+25, Color(255, 255, 255, alpha), 1, 1, nil, alpha * 0.65)
	end
end