"""
    ispangram(input)

Return `true` if `input` contains every alphabetic character (case insensitive).

"""
function ispangram(input::String)
    normalized_input = lowercase(input)
    alphabeth = 'a':'z'
    normalized_input ⊇ alphabeth
end

