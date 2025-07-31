const assoc = [
    1000 => "M",
    900 => "CM",
    500 => "D",
    400 => "CD",
    100 => "C",
    90 => "XC",
    50 => "L",
    40 => "XL",
    10 => "X",
    9 => "IX",
    5 => "V",
    4 => "IV",
    1 => "I"
]

function to_roman(number)
    if number < 1
        error("number has to be a positive natural")
    end
    n = number
    acc = ""

    foreach(k_v ->
        while n >= k_v.first 
            acc = acc * k_v.second
            n -= k_v.first
            end
            ,assoc)
    acc
end
