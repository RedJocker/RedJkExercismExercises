module Anagram (anagramsFor) where

import qualified Data.List as Ls
import qualified Data.Char as Ch


anagramsFor :: String -> [String] -> [String]
anagramsFor xs xss = filter isAnagram xss
    where
        lowered = map Ch.toLower
        loweredAs = lowered xs
        isAnagram bs
            | length xs /= length bs = False 
            | loweredAs == loweredBs = False
            | otherwise = testLetters 
                where
                    loweredBs = lowered bs
                    testLetters = (loweredAs Ls.\\ loweredBs) == ""
                    
                     
                