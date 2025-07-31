module Pangram (isPangram) where

import Data.Char (toLower)

isPangram :: String -> Bool
isPangram text = all (\x -> elem x lowercased) alphabet
    where alphabet = ['a'..'z' ]
          lowercased = map toLower text
          
              
