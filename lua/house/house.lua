house = {}

text = {
	this = {
		"This is the house that Jack built.",
		"This is the malt",
		"This is the rat",
		"This is the cat",
		"This is the dog",
		"This is the cow with the crumpled horn",
		"This is the maiden all forlorn",
		"This is the man all tattered and torn",
		"This is the priest all shaven and shorn",
		"This is the rooster that crowed in the morn",
		"This is the farmer sowing his corn",
		"This is the horse and the hound and the horn"
	},
	that = {
		"\nthat belonged to the farmer sowing his corn",
		"\nthat kept the rooster that crowed in the morn",
		"\nthat woke the priest all shaven and shorn",
		"\nthat married the man all tattered and torn",
		"\nthat kissed the maiden all forlorn",
		"\nthat milked the cow with the crumpled horn",
		"\nthat tossed the dog",
		"\nthat worried the cat",
		"\nthat killed the rat",
		"\nthat ate the malt",
		"\nthat lay in the house that Jack built.",
		""
	}
}

house.verse = function(which)
	return text.this[which] .. table.concat(text.that, "", #text.that - (which - 1), #text.that)
end

house.recite = function()
	ret = {}
	for i = 1, #text.this do
		ret[i] = house.verse(i)
	end
	return table.concat(ret, "\n", 1, #text.this)
end

return house
