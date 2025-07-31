local HighScores = {}

local metatable = {
	__call = function(_, scores)
		return HighScores:new(scores)
	end
}

setmetatable(HighScores, metatable)

function HighScores:scores()
	return self.values
end

function HighScores:personal_best()
	return math.max(table.unpack(self.values))
end

function HighScores:latest()
	return self.values[#self.values]
end

function HighScores:personal_top_three()
	size = #self.values
	if size <= 1 then
		return self.values
	elseif size == 2 then
		max = self.values[1]
		min = self.values[1]
		for i = 1, 2 do
			if self.values[i] > max then
				max = self.values[i]
			end
			if self.values[i] < min then
				min = self.values[i]
			end
		end
		return { max, min }
	else
		copy = table.pack(table.unpack(self.values, 1, size))
		copy["n"] = nil
		table.sort(copy, function(a, b) return a > b end)
		ret = table.pack(table.unpack(copy, 1, 3))
		ret["n"] = nil
		return ret
	end
end

function HighScores:new(values)
	--print(values)
	local new_object = setmetatable({}, self)
	self.values = values[1]
	self.__index = self
	return new_object
end

return HighScores
