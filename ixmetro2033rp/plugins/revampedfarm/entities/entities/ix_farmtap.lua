ENT.Type = "anim"
ENT.PrintName = "Farming Tap"
ENT.Author = "cyanide"
ENT.Category = "Helix"
ENT.Spawnable = true
ENT.AdminOnly = true

function ENT:Initialize()
    if (SERVER) then
        self:SetModel("models/props_wasteland/prison_pipefaucet001a.mdl")
        self:PhysicsInit(SOLID_VPHYSICS)
        self:SetSolid(SOLID_VPHYSICS)
        self:SetMoveType(MOVETYPE_VPHYSICS)
        self:SetUseType(SIMPLE_USE)
        self:Activate()
        local physObj = self:GetPhysicsObject()

        if (IsValid(physObj)) then
            physObj:EnableMotion(false)
            physObj:Sleep()
        end
    end
end

function ENT:Use(activator)
    for k, v in pairs(activator:GetCharacter():GetInventory():GetItems()) do
        if v.uniqueID == "jerryempty" then
            sound.Add({
                name = "water_flow",
                volume = 1.0,
                level = 100,
                pitch = {95, 110},
                sound = "ambient/water/leak_1.wav"
            })

            print("hello")
            activator:EmitSound("water_flow")

            timer.Simple(10, function()
                activator:StopSound("water_flow")
            end)

            activator:SetAction("Collecting...", 10)

            activator:DoStaredAction(self, function()
                for k, v in pairs(activator:GetCharacter():GetInventory():GetItems()) do
                    if v.uniqueID == "jerryempty" then
                        v:Remove()
                        activator:GetCharacter():GetInventory():Add("jerryfilled")
                    end
                end

                activator:Notify("You have collected water.")
            end, 10, function()
                if (IsValid(activator)) then
                    activator:SetAction()
                end
            end)
        end
    end
end
ENT.PopulateEntityInfo = true

function ENT:OnPopulateEntityInfo(container)
    local text = container:AddRow("name")
    text:SetImportant()
    text:SetText("Water Faucet")
    text:SizeToContents()
end