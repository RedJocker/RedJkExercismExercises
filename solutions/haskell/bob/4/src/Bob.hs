module Bob (responseFor) where

import Data.Char

responseFor :: String -> String
responseFor statement
    | isQuestion && isYelling = "Calm down, I know what I'm doing!"
    | isQuestion = "Sure."
    | spacelessStatement == "" = "Fine. Be that way!"
    | isYelling = "Whoa, chill out!"
    | otherwise = "Whatever."

    where
        spacelessStatement = filter (not . isSpace) statement
        letters = filter isAlpha spacelessStatement
        isQuestion
            | spacelessStatement == "" = False 
            | otherwise = last spacelessStatement == '?'
        isYelling
            | letters == "" = False
            | otherwise = all isAsciiUpper letters
        


