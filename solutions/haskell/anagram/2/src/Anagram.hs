module Anagram (anagramsFor) where

import qualified Data.List as Ls
import qualified Data.Char as Ch

anagramsFor :: String -> [String] -> [String]
anagramsFor xs xss = filter isAnagram xss
    where
        isAnagram bs
            | loweredAs == loweredBs = False
            | otherwise = testResult testLetters
                where
                    lowered = map Ch.toLower
                    loweredAs = lowered xs
                    loweredBs = lowered bs
                    testLetters = foldr matchLetters (loweredBs, True) loweredAs
                    matchLetters _ ("", _) = ("", False)
                    matchLetters curChar (accString, _) 
                        | curChar `elem` accString = (Ls.delete curChar accString, True) 
                        | otherwise = ("", False)
                    testResult (acc, bool) = (acc == "") && bool 
                