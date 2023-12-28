local leap_year = function(number)
   if number % 400 == 0 then
	  return true
   elseif number % 100 == 0 then
	  return false
   else
	  return number % 4 == 0
   end
end

return leap_year
