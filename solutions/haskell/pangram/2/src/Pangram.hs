module Pangram (isPangram) where

import Data.Char (toLower)

isPangram :: String -> Bool
isPangram text = isAllInText alphabet
    where alphabet = ['a'..'z' ]
          lowercased = map toLower text
          isAllInText [] = False
          isAllInText [x] = elem x lowercased
          isAllInText (x : xs)  
            | elem x lowercased = isAllInText xs
            | otherwise = False 
              
