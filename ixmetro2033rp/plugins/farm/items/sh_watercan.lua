ITEM.name = "Water Jerry Can"

ITEM.description = "An empty metal jerrycan that can be filled with water."
ITEM.model = "models/props_junk/metalgascan.mdl"
ITEM.uniqueID = "farm_water"

ITEM.isFillable = true

ITEM.functions._empty = { 
	name = "Empty",
	tip = "Empty the jerrycan out",
	icon = "icon16/bin.png",
	OnRun = function(item)
		local client = item.player
		
		item:SetData("filled", nil)
		client:EmitSound("ambient/water_splash"..math.random(1,3)..".wav")
		
	end,
	OnCanRun = function(item)
		return (!IsValid(item.entity) and item:GetData("filled"))
	end
}

-------------------------------------------------------------

function ITEM:GetName()
	local name = self.name
	
	if self:GetData("filled", nil) ~= nil then
		name = ("Filled ".. self.name .." (Water)")
	else name = ("Empty "..self.name) end
	
	return Format(name)
end

function ITEM:GetDescription()
	local description = self.description
	
	if self:GetData("filled", nil) ~= nil then
		description = ("A jerrycan filled with water.")
	else description = self.description end
	
	return Format(description)
end

if (CLIENT) then
	function ITEM:PaintOver(item, w, h)
		
		if item:GetData("filled") then
			draw.SimpleText("Full", "DermaDefault", 5, h-5, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, color_black)
		else
			draw.SimpleText("Empty", "DermaDefault", 5, h-5, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, color_black)
		end
	end
end