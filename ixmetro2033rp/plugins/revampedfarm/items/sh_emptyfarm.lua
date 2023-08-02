ITEM.name = "Empty Farm"
ITEM.uniqueID = "emptyshelf"
ITEM.model = "models/z-o-m-b-i-e/st/shkaf/st_cabinet_village_02.mdl"
ITEM.description = ""
ITEM.width = 4
ITEM.height = 4
ITEM.price = 10
ITEM.category = "Farming"

ITEM.data = {
    producing2 = 0,
    growth = 0
}

ITEM.color = Color(50, 255, 50)

ITEM.functions.Plant = {
    name = "Plant Spores",
    icon = "icon16/cog.png",
    sound = "buttons/lightswitch2.wav",
    OnRun = function(item)
        local client = item.player
        local position = client:GetItemDropPos()
        local inventory = client:GetCharacter():GetInventory()
        local seed = inventory:HasItem("mushroom_seeds")
        local soil = inventory:HasItem("soil")

        if (not seed or not soil) then
            client:NotifyLocalized("You need soil and mushroom spores.")

            return false
        end

        seed:Remove()
        soil:Remove()
        ix.item.Spawn("mushroom_farm", position) --if not, drop it on the ground

        return true
    end
}

function ITEM:GetDescription()
    if (not self.entity or not IsValid(self.entity)) then
        local str = self.description .. "\nOnce dropped, you can not pick it back up."

        return str
    else
        return self.description
    end
end