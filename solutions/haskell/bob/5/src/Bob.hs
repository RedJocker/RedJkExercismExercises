module Bob (responseFor) where

import Data.Char

responseFor :: String -> String
responseFor statement
    | spacelessStatement == "" = "Fine. Be that way!"
    | isQuestion && isYelling = "Calm down, I know what I'm doing!"
    | isQuestion = "Sure."
    | isYelling = "Whoa, chill out!"
    | otherwise = "Whatever."

    where
        spacelessStatement = filter (not . isSpace) statement
        letters = filter isAlpha spacelessStatement
        isQuestion = last spacelessStatement == '?'
        isYelling
            | letters == "" = False
            | otherwise = all isAsciiUpper letters
        


