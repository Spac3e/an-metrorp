AddCSLuaFile()

ENT.Type = "anim"
ENT.PrintName = "Farm Goods Purchaser"
ENT.Author = ""
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.RenderGroup 		= RENDERGROUP_BOTH
ENT.Category = "Helix"
ENT.AutomaticFrameAdvance = true

if (SERVER) then
	function ENT:Initialize()
		self:SetModel("models/magma/survivor5_redux.mdl")
		self:SetSolid(SOLID_BBOX)
		self:PhysicsInit(SOLID_BBOX)
		self:SetMoveType(MOVETYPE_NONE)
		self:SetUseType(SIMPLE_USE)
		self:SetupAnimation("pose_standing_02")
	end
	
	function ENT:Use(activator)
		ix.plugin.list["revampedfarm"]:checkSalesDate()
		if (activator:GetCharacter()) then
			if (activator:GetPos():Distance(self:GetPos()) <= 100) then
				local farmSales = {ix.plugin.list["revampedfarm"]:getDailySales(), ix.plugin.list["revampedfarm"]:getWeeklySales()}
				
				netstream.Start(activator, "saleFarmOpn", activator, self, farmSales)
			end
		end
	end

else
	function ENT:CreateBubble()
		self.bubble = ClientsideModel("models/extras/info_speech.mdl", RENDERGROUP_OPAQUE)
		self.bubble:SetPos(self:GetPos() + Vector(0, 0, 84))
		self.bubble:SetModelScale(0, 0)
	end

	function ENT:Think()
		if (not IsValid(self.bubble) and not noBubble) then
			self:CreateBubble()
		end
		self:SetNextClientThink(CurTime() + 0.25)
	end

	function ENT:OnRemove()
		if (IsValid(self.bubble)) then
			self.bubble:Remove()
		end
	end

	function ENT:Draw()
		self:DrawModel()
		local bubble = self.bubble

		if (IsValid(bubble)) then
			local realTime = RealTime()
			bubble:SetRenderOrigin(self:GetPos() + Vector(0, 0, 84 + math.sin(realTime * 3) * 0.05))
			bubble:SetRenderAngles(Angle(0, realTime * 100, 0))
		end

		self:DrawModel()
	end

	ENT.PopulateEntityInfo = true

	function ENT:OnPopulateEntityInfo(container)
		local name = container:AddRow("name")
		name:SetImportant()
		name:SetText(self:GetNetVar("Name", "Comrade Farmer"))
		name:SizeToContents()
		local descriptionText = self:GetNetVar("Description", "")

		if (descriptionText ~= "") then
			local description = container:AddRow("Description")
			description:SetText(self:GetNetVar("Description"))
			description:SizeToContents()
		end
	end
end

function ENT:SetupAnimation(animation)
	if (animation and animation ~= -1) then
		self:ResetSequence("menu_combine")
	else
		self:ResetSequence("menu_combine")
	end
end