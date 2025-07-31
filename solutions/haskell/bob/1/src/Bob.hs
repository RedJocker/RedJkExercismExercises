module Bob (responseFor) where

import Data.Char

responseFor :: String -> String
responseFor statement
    | isQuestion withoutSpaces && isAllCaps letters = "Calm down, I know what I'm doing!"
    | isQuestion withoutSpaces = "Sure."
    | withoutSpaces == "" = "Fine. Be that way!"
    | isAllCaps letters = "Whoa, chill out!"
    | otherwise = "Whatever."

    where
        withoutSpaces = filter (not . isSpace) statement
        letters = filter isAlpha withoutSpaces
        isQuestion [] = False
        isQuestion xs = last xs == '?'
        isAllCaps [] = False
        isAllCaps [y] = isAsciiUpper y
        isAllCaps (y:ys) = isAsciiUpper y && isAllCaps ys
    


