module Anagram (anagramsFor) where

import qualified Data.List as Ls
import qualified Data.Char as Ch

anagramsFor :: String -> [String] -> [String]
anagramsFor xs xss = filter (filterPredicate xs) xss
    where
        filterPredicate as bs
            | loweredAs == loweredBs = False
            | otherwise = helperFunc loweredAs loweredBs
                where
                    lowered = map Ch.toLower
                    loweredAs = lowered as
                    loweredBs = lowered bs
                     
                    helperFunc [] [] = True
                    helperFunc [] _ = False
                    helperFunc _ [] = False
                    helperFunc (c:cs) ds
                        | c `elem` ds = helperFunc cs (Ls.delete c ds) 
                        | otherwise = False
                         

