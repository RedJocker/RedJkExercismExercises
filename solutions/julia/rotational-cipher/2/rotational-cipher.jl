function rotate(key::Integer, plain::AbstractString)
    map(ch -> rotate(key, ch), plain)
end

function rotate(key::Integer, ch::Char)
    if isascii(ch) && isletter(ch)
        rotated_ch = ch + key
        limit_ch = islowercase(ch) ? 'z' : 'Z'
        return rotated_ch > limit_ch ? rotated_ch - 26 : rotated_ch
    else
        return ch
    end
end

for key in 0:26
    macro_name = Symbol("R" * string(key) * "_str")
    eval(
        :(macro $macro_name(p) 
            rotate($key, p) 
          end)    
    )
end