
ix.currency.symbol = ""
ix.currency.singular = "MGR"
ix.currency.plural = "MGR"

ix.config.SetDefault("scoreboardRecognition", true)
ix.config.SetDefault("music", "metro2033.mp3")
ix.config.SetDefault("maxAttributes", 60)

ix.config.Add("rationTokens", 20, "The amount of MGR that a person will get from a ration", nil, {
	data = {min = 0, max = 1000},
	category = "economy"
})

ix.config.Add("rationInterval", 0, "How long a person needs to wait in seconds to get their next ration", nil, {
	data = {min = 0, max = 86400},
	category = "economy"
})
