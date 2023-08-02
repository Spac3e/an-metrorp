Schema.name = "Metro 2030 Roleplay"
Schema.author = "Dunkersplay"
Schema.description = "Welcome to the Underground."

ix.currency.model = "models/ninja/signalvariance/weapons/akm_mag.mdl"

ix.container.Register("models/devcon/mrp/props/cabinet_closed.mdl", {
	name = "Storage Locker",
	description = "A rusted metallic storage locker.",
	width = 10,
	height = 6,
})
ix.container.Register("models/z-o-m-b-i-e/metro_2033/mebel_outdoor/m33_shkaf_02.mdl", {
	name = "Wooden Closet",
	description = "A worn storage closet, intended for storage.",
	width = 3,
	height = 6,
})
ix.container.Register("models/z-o-m-b-i-e/st/equipment_cache/st_equipment_seif_04.mdl", {
	name = "Rusted Safe",
	description = "A rusted safe, appearing to still be functional.",
	width = 4,
	height = 2,
})
ix.container.Register("models/maxibammo/556.mdl", {
	name = "Rusted Ammo Box",
	description = "A rusted old ammo crate, useful for storing things.",
	width = 3,
	height = 2
})
-- attribute manipulation should be done with methods from the ix.attributes library
ix.char.RegisterVar("attributes", {
	field = "attributes",
	fieldType = ix.type.text,
	default = {},
	index = 4,
	category = "attributes",
	isLocal = true,
	OnDisplay = function(self, container, payload)
		local maximum = hook.Run("GetDefaultAttributePoints", LocalPlayer(), payload) or 10

		if (maximum < 1) then
			return
		end

		local attributes = container:Add("DPanel")
		attributes:Dock(TOP)

		local y
		local total = 0

		payload.attributes = {}

		local maxAttributes = ix.config.Get("maxAttributes", 30)

		-- total spendable attribute points
		local totalBar = attributes:Add("ixAttributeBar")
		totalBar:SetMax(maximum)
		totalBar:SetValue(10)
		totalBar:Dock(TOP)
		totalBar:DockMargin(2, 2, 2, 2)
		totalBar:SetText(L("attribPointsLeft"))
		totalBar:SetReadOnly(true)
		totalBar:SetColor(Color(20, 120, 20, 255))

		y = totalBar:GetTall() + 4

		for k, v in SortedPairsByMemberValue(ix.attributes.list, "name") do
			payload.attributes[k] = maxAttributes / 2

			local bar = attributes:Add("ixAttributeBar")
			bar:SetMax(ix.config.Get("maxAttributes", 60))
			bar:SetValue(maxAttributes / 2)
			bar:Dock(TOP)
			bar:DockMargin(2, 2, 2, 2)
			bar:SetText(L(v.name))
			bar.OnChanged = function(this, difference)
				if ((total + difference) > maximum) then
					return false
				end

				if (difference == 1) then
					if (totalBar:GetValue() == 0) then return false end
				end

				total = total + difference
				payload.attributes[k] = payload.attributes[k] + difference

				totalBar:SetValue(totalBar.value - difference)
			end

			if (v.noStartBonus) then
				bar:SetReadOnly()
			end

			y = y + bar:GetTall() + 4
		end

		attributes:SetTall(y)
		return attributes
	end,
	OnValidate = function(self, value, data, client)
		if (value != nil) then
			if (istable(value)) then
				local count = 0

				for _, v in pairs(value) do
					count = count + v
				end

				if (count > (hook.Run("GetDefaultAttributePoints", client, count) or 10)) then
					return false, "unknownError"
				end
			else
				return false, "unknownError"
			end
		end
	end,
	ShouldDisplay = function(self, container, payload)
		return !table.IsEmpty(ix.attributes.list)
	end
})

function Schema:CanAutoFormatMessage(speaker, chatType, text)
	return chatType == "ic" or chatType == "w" or chatType == "y" or chatType == "radio" or chatType == "radio_eavesdrop" or chatType == "radio_eavesdrop"
end

function Schema:InitializedChatClasses()
	do
		local CLASS = {}
		CLASS.color = Color(75, 150, 50)
		CLASS.format = "%s radios in \"%s\""

		function CLASS:CanHear(speaker, listener)
			local character = listener:GetCharacter()
			local inventory = character:GetInventory()
			local bHasRadio = false

			for k, v in pairs(inventory:GetItemsByUniqueID("handheld_radio", true)) do
				if (v:GetData("enabled", false) and speaker:GetCharacter():GetData("frequency") == character:GetData("frequency")) then
					bHasRadio = true
					break
				end
			end

			return bHasRadio
		end

		function CLASS:OnChatAdd(speaker, text)
			chat.AddText(self.color, string.format(self.format, speaker:Name(), text))
		end

		ix.chat.Register("radio", CLASS)
	end

	do
		local CLASS = {}
		CLASS.color = Color(255, 255, 175)
		CLASS.format = "%s radios in \"%s\""

		function CLASS:GetColor(speaker, text)
			if (LocalPlayer():GetEyeTrace().Entity == speaker) then
				return Color(175, 255, 175)
			end

			return self.color
		end

		function CLASS:CanHear(speaker, listener)
			if (ix.chat.classes.radio:CanHear(speaker, listener)) then
				return false
			end

			local chatRange = ix.config.Get("chatRange", 280)

			return (speaker:GetPos() - listener:GetPos()):LengthSqr() <= (chatRange * chatRange)
		end

		function CLASS:OnChatAdd(speaker, text)
			chat.AddText(self.color, string.format(self.format, speaker:Name(), text))
		end

		ix.chat.Register("radio_eavesdrop", CLASS)
	end

	ix.chat.Register("itclose", {
		OnChatAdd = function(self, speaker, text)
			chat.AddText(Color(142, 68, 173), "*** "..text)
		end,
		CanHear = ix.config.Get("chatRange", 280) * 0.25,
		prefix = {"/ItClose","/DoClose"},
		description = "@cmdItClose",
		indicator = "chatPerforming",
		deadCanChat = true
	})

	ix.chat.Register("itfar", {
		OnChatAdd = function(self, speaker, text)
			chat.AddText(Color(142, 68, 173), "*** "..text)
		end,
		CanHear = ix.config.Get("chatRange", 280) * 2,
		prefix = {"/ItFar","/DoFar"},
		description = "@cmdItFar",
		indicator = "chatPerforming",
		deadCanChat = true
	})

	ix.chat.Register("meclose", {
		format = "*** %s %s",
		GetColor = ix.chat.classes.ic.GetColor,
		CanHear = ix.config.Get("chatRange", 280) * 0.25,
		prefix = {"/Mel", "/ActionClose"},
		description = "@cmdMeClose",
		indicator = "chatPerforming",
		deadCanChat = true
	})

	ix.chat.Register("mefar", {
		format = "*** %s %s",
		GetColor = ix.chat.classes.ic.GetColor,
		CanHear = ix.config.Get("chatRange", 280) * 2,
		prefix = {"/Med", "/ActionFar"},
		description = "@cmdMeFar",
		indicator = "chatPerforming",
		deadCanChat = true
	})
end

function Schema:ZeroNumber(number, length)
	local amount = math.max(0, length - string.len(number))
	return string.rep("0", amount)..tostring(number)
end

-- Include netstream
ix.util.Include("libs/thirdparty/sh_netstream2.lua")

ix.util.Include("sh_configs.lua")
ix.util.Include("sh_commands.lua")

ix.util.Include("cl_schema.lua")
ix.util.Include("cl_hooks.lua")
ix.util.Include("sh_hooks.lua")
ix.util.Include("sh_voices.lua")
ix.util.Include("sh_anims.lua")
ix.util.Include("sv_schema.lua")
ix.util.Include("sv_hooks.lua")

ix.flag.Add("v", "Access to light blackmarket goods.")
ix.flag.Add("V", "Access to heavy blackmarket goods.")
