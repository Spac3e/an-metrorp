ITEM.name = "Mushroom Farm"
ITEM.uniqueID = "mushroom_farm"
ITEM.model = "models/farm/mushroom_farm.mdl"
ITEM.description = ""
ITEM.width = 4
ITEM.height = 4
ITEM.flag = "v"
ITEM.price = 500
ITEM.category = "Farming"
ITEM.color = Color(50, 255, 50)
ITEM.flag = "9"

function MFarm_SetModel(item)
    local growth = math.floor(math.Clamp(item:GetData("growth", 0), 0, 4))

    local growthModels = {
        [0] = 0,
        [1] = 1,
        [2] = 2,
        [3] = 2,
        [4] = 3,
    }

    local chosen = growthModels[growth]
    local ent = item:GetEntity()

    if (IsValid(ent)) then
        ent:SetBodygroup(1, chosen)
    end
end

MRPFarmCounter = MRPFarmCounter or {}

function ITEM:OnRemoved()
    local item = self

    if (item.lastUser and MRPFarmCounter[item.lastUser] and MRPFarmCounter[item.lastUser].mushroom) then
        for k, v in pairs(MRPFarmCounter[item.lastUser].mushroom) do
            if (v == self) then
                MRPFarmCounter[item.lastUser].mushroom[k] = nil
                break
            end
        end

        MRPFarmCounter[item.lastUser].mushroom = table.ClearKeys(MRPFarmCounter[item.lastUser].mushroom)
    end
end

ITEM.functions.Water = {
    icon = "icon16/box.png",
    OnRun = function(item)
        local client = item.player
        local char = client:GetCharacter()
        local position = client:GetItemDropPos()
        local inventory = char:GetInventory()
        local water = inventory:HasItem("jerryfilled")

        if (not IsValid(item.entity)) then
            client:Notify("You can't do that while this item is in your inventory. I don't know how you even managed to fit this in your inventory.")

            return false
        end

        if (water) then
            local steam64 = client:SteamID64()
            item.lastUser = steam64
            MRPFarmCounter[steam64] = MRPFarmCounter[steam64] or {}
            MRPFarmCounter[steam64].mushroom = MRPFarmCounter[steam64].mushroom or {}
            local count = 0

            for k, v in pairs(MRPFarmCounter[steam64].mushroom) do
                if (not v or not ix.item.instances[v.id] or ix.item.instances[v.id] ~= v) then
                    MRPFarmCounter[steam64].mushroom[k] = nil
                    continue
                end

                count = count + 1
            end

            MRPFarmCounter[steam64].mushroom = table.ClearKeys(MRPFarmCounter[steam64].mushroom)

            if (count >= 2) then
                client:Notify("You cannot be growing more than 2 Mushroom Farms at the same time.")

                return false
            end

            table.insert(MRPFarmCounter[steam64].mushroom, item)
            water:Remove()
            inventory:Add("jerryempty")
            client:EmitSound("misc/crafting/brewing_start5.wav")
            item:SetData("producing2", CurTime())

            --300, --5 minutes IF YOU CHANGE THIS NUMBER CHANGE THE IDENTICAL ONE BELOW AS WELL (CTRL-F) local endTime = item:getData("producing2", 0) + 300 <--- this one (down below)
            timer.Simple(300, function()
                if (item ~= nil) then
                    for k, v in pairs(MRPFarmCounter[item.lastUser].mushroom) do
                        if (v == item) then
                            MRPFarmCounter[item.lastUser].mushroom[k] = nil
                            break
                        end
                    end

                    MRPFarmCounter[item.lastUser].mushroom = table.ClearKeys(MRPFarmCounter[item.lastUser].mushroom)
                    item.lastUser = nil
                    item:SetData("producing2", 0)
                    item:SetData("growth", item:GetData("growth", 0) + 1)
                    local growth = item:GetData("growth", 0)
                    client:Notify("Your mushroom farm has grown.")
                    MFarm_SetModel(item)
                end
            end)
        else
            client:NotifyLocalized("You don't have any filed up jerry cans!")

            return false
        end

        return false
    end,
    OnCanRun = function(item)
        local growth = item:GetData("growth", 0)
        if (growth == 4) then return false end

        if (item:GetData("producing2", 0) ~= 0) then
            local endTime = item:GetData("producing2", 0) + 300
            if (item:GetData("producing2", 0) > CurTime() or CurTime() > endTime) then return true end

            return false
        end

        return true
    end
}

ITEM.functions.take = nil

ITEM.functions.drop = {
    tip = "dropTip",
    icon = "icon16/world.png",
    OnRun = function(item)
        item:Transfer()
        MFarm_SetModel(item)

        return false
    end,
    OnCanRun = function(item) return (not IsValid(item.entity) and not item.noDrop) end
}

function ix.meta.inventory:FindMultipleEmptySlots(w, h)
    local results = {}
    w = w or 1
    h = h or 1
    if (w > self.w or h > self.h) then return results end

    for y = 1, self.h - (h - 1) do
        for x = 1, self.w - (w - 1) do
            if (self:CanItemFit(x, y, w, h)) then
                table.insert(results, {x, y})
            end
        end
    end

    return results
end

ITEM.functions.Harvest = {
    icon = "icon16/box.png",
    sound = "misc/crafting/butcher/butcher_meat4.wav",
    OnRun = function(item)
        local client = item.player
        local char = client:GetCharacter()
        local position = client:GetItemDropPos()
        local inventory = char:GetInventory()

        --if the inventory has space, put it in the inventory
        if (not inventory:Add("mushroom")) then
            client:Notify("You have no space in your inventory.")
            ix.item.Spawn("mushroom", position) --if not, drop it on the ground

            return false
        end

        item:SetData("growth", item:GetData("growth") - 3)
        MFarm_SetModel(item)

        return false
    end,
    OnCanRun = function(item)
        local growth = item:GetData("growth", 0)

        if (growth == 4) then
            return true
        else
            return false
        end
    end
}

function ITEM:GetName()
    local name

    if self:GetData("charname", nil) then
        name = self:GetData("charname", "Anonymous") .. "'s " .. self.name
    end

    return name
end

function ITEM:GetDescription()

    local description = self.description

    if (self:GetData("producing2") ~= nil) then
        description = description .. "\nThe farm has been watered recently."
    end

    if (self:GetData("growth") ~= nil) then
        local growth = self:GetData("growth", 0)
        local growthMsg = "\nThe farm is " .. growth * 25 .. " percent grown."
        description = description .. growthMsg
    end

    return Format(description)
end

function ITEM:OnInstanced(invID, x, y)
    if self:GetOwner() then
        self:SetData("charname", self:GetOwner():GetName())
    end
end