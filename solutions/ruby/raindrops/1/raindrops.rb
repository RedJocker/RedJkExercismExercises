class Raindrops
  def Raindrops.convert(number)
    res = ""
    if (number % 3 == 0) then
      res += "Pling"
    end
    if (number % 5 == 0) then
      res += "Plang"
    end
    if (number % 7 == 0) then
      res += "Plong"
    end
    if (res == "") then
      res += "#{number}"
    end
    res
  end
end

