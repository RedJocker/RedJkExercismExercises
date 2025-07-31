module Pangram (isPangram) where

import Data.Char (toLower)

isPangram :: String -> Bool
isPangram text = and [elem char lowercased | char <- alphabet]
    where alphabet = ['a', 'b'..'z' ]
          lowercased = map toLower text

