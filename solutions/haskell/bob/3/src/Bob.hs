module Bob (responseFor) where

import Data.Char

responseFor :: String -> String
responseFor statement
    | isQuestion spacelessStatement && isAllCaps letters = "Calm down, I know what I'm doing!"
    | isQuestion spacelessStatement = "Sure."
    | spacelessStatement == "" = "Fine. Be that way!"
    | isAllCaps letters = "Whoa, chill out!"
    | otherwise = "Whatever."

    where
        spacelessStatement = filter (not . isSpace) statement
        letters = filter isAlpha spacelessStatement
        isQuestion [] = False
        isQuestion xs = last xs == '?'
        isAllCaps [] = False
        isAllCaps xs = all isAsciiUpper xs
        


