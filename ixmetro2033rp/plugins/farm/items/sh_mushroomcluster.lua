ITEM.name = "Wild Mushroom Cluster"
ITEM.description = "A cluster of wild mushrooms, often saught by farmers for their spores."
ITEM.model = "models/illusion/metroexodus/mushroom.mdl"
ITEM.uniqueID = "mushroom_cluster"
ITEM.height = 1
ITEM.width = 2

ITEM.price = 30

ITEM.functions.convert = { 
	name = "Convert",
	tip = "Converts the cluster into seeds",
	icon = "icon16/arrow_switch.png",
	OnRun = function(item)
		local client = item.player
		local char = client:GetCharacter()
		local inventory = char:GetInventory()
		
		client:EmitSound("npc/barnacle/neck_snap"..math.random(1,2)..".wav")
		inventory:Add("mushroom_seeds")
		
	end,
	OnCanRun = function(item)
		return (!IsValid(item.entity) and item.player:GetCharacter():HasFlags("F"))
	end
}

ITEM.functions._seperate = { 
	name = "Break Apart",
	tip = "Breaks the cluster into regular mushrooms",
	icon = "icon16/arrow_divide.png",
	OnRun = function(item)
		local client = item.player
		local char = client:GetCharacter()
		local inventory = char:GetInventory()
			
		client:EmitSound("npc/barnacle/neck_snap"..math.random(1,2)..".wav")
		
		for i=4,1,-1 do -- pasting the same line 4 times is really hard!!!
		inventory:Add("mushroom")
		end
	end,
	OnCanRun = function(item)
		return (!IsValid(item.entity))
	end
}