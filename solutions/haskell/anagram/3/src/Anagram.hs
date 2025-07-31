module Anagram (anagramsFor) where

import qualified Data.List as Ls
import qualified Data.Char as Ch

anagramsFor :: String -> [String] -> [String]
anagramsFor xs xss = filter isAnagram xss
    where
        isAnagram bs
            | loweredAs == loweredBs = False
            | otherwise = testLetters == (Right "")
                where
                    lowered = map Ch.toLower
                    loweredAs = lowered xs
                    loweredBs = lowered bs
                    testLetters = foldr matchLetters (Right loweredBs) loweredAs
                    matchLetters _ (Left _) = (Left False)
                    matchLetters _ (Right "") = (Left False)
                    matchLetters curChar (Right accString) 
                        | curChar `elem` accString = Right (Ls.delete curChar accString) 
                        | otherwise = Left False
                     
                