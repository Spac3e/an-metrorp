
ITEM.name = "Metro Passport"
ITEM.model = Model("models/gibs/metal_gib4.mdl")
ITEM.description = "A paper passport with a leather cover with ID #%s, assigned to %s."

function ITEM:GetDescription()
	return string.format(self.description, self:GetData("id", "00000"), self:GetData("name", "nobody"))
end
