module Temperature (tempToC, tempToF) where


tempToC :: Integer -> Float
tempToC fahrenheit = fromIntegral (fahrenheit - 32) / 1.8 


tempToF :: Float -> Integer
tempToF celsius = ceiling $ celsius * 1.8 + 32
