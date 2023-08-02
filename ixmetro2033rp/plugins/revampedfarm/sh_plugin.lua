local PLUGIN = PLUGIN
PLUGIN.name = "Revamped Farm"
PLUGIN.author = "Cyanide"
PLUGIN.desc = "A farm plugin that utilised model bodygroups and other cool features."
ix.util.Include("sv_plugin.lua")
PLUGIN.weeklypriceModifier = 1.7
PLUGIN.dailypriceModifier = 1.2
PLUGIN.dailySaleCount = 2
PLUGIN.weeklySaleCount = 3

PLUGIN.farms = {
	  "mushroom",
          "mushroom_crate",
          --"carrot",
}
PLUGIN.currentSales = PLUGIN.currentSales or {
	dailySales = {},
	weeklySales = {},
	dailySalesDate = 0,
	weeklySalesDate = 0,
}

local playerMeta = FindMetaTable("Player")
local farmMeta = ix.meta.inventory or ix.middleclass("ix_inventory")

function PLUGIN:getFarmsList()
    return self.farms
end

function PLUGIN:getDailySales()
    return self.currentSales[1]
end

function PLUGIN:getWeeklySales()
    return self.currentSales[2]
end

function PLUGIN:getDailySalesDate()
    return self.currentSales[3]
end

function PLUGIN:getWeeklySalesDate()
    return self.currentSales[4]
end

function PLUGIN:cleanSales(id, isDaily)
    if isDaily then
        table.remove(self.currentSales[1], id)
    else
        table.remove(self.currentSales[2], id)
    end
end

function PLUGIN:getNewDailySales()
    self.currentSales[1] = {}

    for i = 1, self.dailySaleCount do
        self.currentSales[1][i] = self.farms[math.random(#self.farms)]
    end

    self.currentSales[3] = os.time()
end

function PLUGIN:getNewWeeklySales()
    self.currentSales[2] = {}

    for i = 1, self.weeklySaleCount do
        self.currentSales[2][i] = self.farms[math.random(#self.farms)]
    end

    self.currentSales[4] = os.time()
end


function PLUGIN:checkSalesDate()
    if (os.time() - self:getDailySalesDate()) > 86400 then
        self:getNewDailySales()
    end

    if (os.time() - self:getWeeklySalesDate()) > 604800 then
        self:getNewWeeklySales()
    end
end

function farmMeta:FarmDebugTestA(uniqueID, quantity, data, x, y, noReplication)
    quantity = quantity or 1
    if (quantity < 1) then return false, "noOwner" end

    if (not isnumber(uniqueID) and quantity > 1) then
        for _ = 1, quantity do
            local bSuccess, error = self:Add(uniqueID, 1, data)
            if (not bSuccess) then return false, error end
        end

        return true
    end

    local client = self.GetOwner and self:GetOwner() or nil
    local item = isnumber(uniqueID) and ix.item.instances[uniqueID] or ix.item.list[uniqueID]
    local targetInv = self
    local bagInv
    if (not item) then return false, "invalidItem" end

    if (isnumber(uniqueID)) then
        local oldInvID = item.invID

        if (not x and not y) then
            x, y, bagInv = self:FindEmptySlot(item.width, item.height)
        end

        if (bagInv) then
            targetInv = bagInv
        end

        -- we need to check for owner since the item instance already exists
        if (not item.bAllowMultiCharacterInteraction and IsValid(client) and client:GetCharacter() and item:GetPlayerID() == client:SteamID64() and item:GetCharacterID() ~= client:GetCharacter():GetID()) then return false, "itemOwned" end
        if (hook.Run("CanTransferItem", item, ix.item.inventories[0], targetInv) == false) then return false, "notAllowed" end

        if (x and y) then
            targetInv.slots[x] = targetInv.slots[x] or {}
            targetInv.slots[x][y] = true
            item.gridX = x
            item.gridY = y
            item.invID = targetInv:GetID()

            for x2 = 0, item.width - 1 do
                local index = x + x2

                for y2 = 0, item.height - 1 do
                    targetInv.slots[index] = targetInv.slots[index] or {}
                    targetInv.slots[index][y + y2] = item
                end
            end

            if (not noReplication) then
                targetInv:SendSlot(x, y, item)
            end

            if (not self.noSave) then
                local query = mysql:Update("ix_items")
                query:Update("inventory_id", targetInv:GetID())
                query:Update("x", x)
                query:Update("y", y)
                query:Where("item_id", item.id)
                query:Execute()
            end

            hook.Run("FarmItemAdd", ix.item.inventories[oldInvID], targetInv, item)

            return x, y, targetInv:GetID()
        else
            return false, "noFit"
        end
    else
        if (not x and not y) then
            x, y, bagInv = self:FindEmptySlot(item.width, item.height)
        end

        if (bagInv) then
            targetInv = bagInv
        end

        if (hook.Run("CanTransferItem", item, ix.item.inventories[0], targetInv) == false) then return false, "notAllowed" end

        if (x and y) then
            for x2 = 0, item.width - 1 do
                local index = x + x2

                for y2 = 0, item.height - 1 do
                    targetInv.slots[index] = targetInv.slots[index] or {}
                    targetInv.slots[index][y + y2] = true
                end
            end

            local characterID
            local playerID

            if (self.owner) then
                local character = ix.char.loaded[self.owner]

                if (character) then
                    characterID = character.id
                    playerID = character.steamID
                end
            end

            ix.item.Instance(targetInv:GetID(), uniqueID, data, x, y, function(newItem)
                newItem.gridX = x
                newItem.gridY = y

                for x2 = 0, newItem.width - 1 do
                    local index = x + x2

                    for y2 = 0, newItem.height - 1 do
                        targetInv.slots[index] = targetInv.slots[index] or {}
                        targetInv.slots[index][y + y2] = newItem
                    end
                end

                if (not noReplication) then
                    targetInv:SendSlot(x, y, newItem)
                end

                hook.Run("FarmItemAdd", nil, targetInv, newItem)
            end, characterID, playerID)

            return x, y, targetInv:GetID()
        else
            return false, "noFit"
        end
    end
end



function PLUGIN:sellFarm(client, farmID, isDaily)
    if isDaily then
        local test = self.currentSales[1]
        local farm = test[farmID]
        local find = client:GetCharacter():GetInventory():HasItem(farm)

        if find then
            client:GetCharacter():GiveMoney(ix.item.list[farm].price * self.dailypriceModifier)
            self:cleanSales(farmID, isDaily)
            find:Remove()
            client:Notify("You sold " .. ix.item.list[farm].name .. " for " .. ix.currency.Get(ix.item.list[farm].price * self.dailypriceModifier) .. ".")
        else
            client:Notify("You do not have this item")
        end
    else
        local test = self.currentSales[2]
        local farm = test[farmID]
        local find = client:GetCharacter():GetInventory():HasItem(farm)

        if find then
            client:GetCharacter():GiveMoney(ix.item.list[farm].price * self.weeklypriceModifier)
            self:cleanSales(farmID, isDaily)
            find:Remove()
            client:Notify("You sold " .. ix.item.list[farm].name .. " for " .. ix.currency.Get(ix.item.list[farm].price * self.weeklypriceModifier) .. ".")
        else
            client:Notify("You do not have this item")
        end
    end
end

if (CLIENT) then
    netstream.Hook("saleFarmOpn", function(client, entity, FarmSales)
        if IsValid(entity) then
            local frame = vgui.Create("DFrame")
            frame:SetTitle("Farm Sales")
            frame:SetVisible(true)
            --frame:SetDrawOnTop(true)
            frame:SetDraggable(true)
            frame:ShowCloseButton(true)
            frame:Center()
            frame:MakePopup()
            frame:SetSize(600, 400)
            frame:SetPos((ScrW() / 2) - 300, (ScrH() / 2) - 200)
            local sentence = frame:Add("DLabel")
            sentence:Dock(TOP)
            sentence:SetContentAlignment(8)
            sentence:SetFont("ixMinimalTitleFont")
            sentence:SetText("Hello comrade, I'm looking for these farming goods.")
            sentence:SetTall(100)
            sentence:DockMargin(5, 5, 5, 0)
            local meme = frame:Add("DLabel")
            meme:Dock(TOP)
            meme:SetContentAlignment(8)
            meme:SetText("Daily Sales")
            meme:DockMargin(5, 5, 5, 0)

            for k, v in ipairs(FarmSales[1]) do
                local btn = frame:Add("DButton")
                btn:Dock(TOP)
                btn:SetText(ix.item.list[v].name .. " - " .. ix.item.list[v].price * ix.plugin.list["revampedfarm"].dailypriceModifier)
                btn:DockMargin(5, 5, 5, 0)

                function btn.DoClick()
                    local farm = k
                    netstream.Start("saleFarm", farm, true)
                    frame:Close()
                end
            end

            local meme2 = frame:Add("DLabel")
            meme2:Dock(TOP)
            meme2:SetContentAlignment(8)
            meme2:SetText("Weekly Sales")
            meme2:DockMargin(5, 5, 5, 0)

            for k, v in ipairs(FarmSales[2]) do
                local btn = frame:Add("DButton")
                btn:Dock(TOP)
                btn:SetText(ix.item.list[v].name .. " - " .. ix.item.list[v].price * ix.plugin.list["revampedfarm"].weeklypriceModifier)
                btn:DockMargin(5, 5, 5, 0)

                function btn.DoClick()
                    local farm = k
                    netstream.Start("saleFarm", farm, false)
                    frame:Close()
                end
            end
        end
    end)
else
    netstream.Hook("saleFarm", function(client, farmID, isDaily)
        ix.plugin.list["revampedfarm"]:sellFarm(client, farmID, isDaily)
    end)

    function PLUGIN:LoadData()
        data = self:GetData()
        self.currentSales = data.currentSales or {}

        if #self.currentSales == 0 then
            PLUGIN:getNewDailySales()
            PLUGIN:getNewWeeklySales()
        end

        for k, v in ipairs(data.persistList or {}) do
            local entity = ents.Create("ix_farmsale")
            entity:SetPos(v.pos)
            entity:SetAngles(v.angles)
            entity:Spawn()
        end
    end

    function PLUGIN:SaveData()
        --self:setData(self.currentSales)
        local data = {}

        for k, v in ipairs(ents.FindByClass("ix_farmsale")) do
            data[#data + 1] = {
                pos = v:GetPos(),
                angles = v:GetAngles(),
            }
        end

        local data2 = {
            currentSales = self.currentSales,
            persistList = data,
        }

        self:SetData(data2)
    end
end

ix.command.Add("farmsalegetnew", {
    adminOnly = true,
    OnRun = function(self, client, arguments)
        PLUGIN:getNewDailySales()
        PLUGIN:getNewWeeklySales()
    end
})

ix.command.Add("farmsaleprintcurrent", {
    adminOnly = true,
    OnRun = function(self, client, arguments)
        PrintTable(PLUGIN.currentSales)
    end
})

/*
        ix.command.Add("farmselltest", {
        adminOnly = true,
	OnRun = function(self, client)
		netstream.Start(client, "farmselladdtest", self.farms[ math.random( #self.farms ) ])
	end
})

*/

--/* 
netstream.Hook("farmselladdtest", function(client, debug) 
   local owner = client:GetCharacter()   
   local invent = owner:GetInventory()
   invent:FarmDebugTestA(debug)
end)
--*/
