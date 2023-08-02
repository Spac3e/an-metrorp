ITEM.name = "Mushroom"
ITEM.description = "A tasty edible mushroom."
ITEM.model = "models/devcon/mrp/props/mushroom_2.mdl"
ITEM.height = 1
ITEM.width = 1

ITEM.price = 3

ITEM.functions._eat = { 
	name = "Eat",
	tip = "Eat",
	icon = "icon16/arrow_switch.png",
	OnRun = function(item)
		local client = item.player
		
		client:EmitSound("npc/barnacle/neck_snap"..math.random(1,2)..".wav")
		
	end,
	OnCanRun = function(item)
		return (!IsValid(item.entity))
	end
}