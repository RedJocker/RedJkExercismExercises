ArmstrongNumbers = {}

function ArmstrongNumbers.is_armstrong_number(number)
	num_len = string.len(number)
	acc = 0
	num = number
	while num ~= 0 do
		rem = num % 10
		acc = (rem ^ num_len) + acc
		num = math.floor(num / 10)
	end
	return acc == number
end

return ArmstrongNumbers
