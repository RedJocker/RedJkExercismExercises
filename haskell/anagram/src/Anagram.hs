module Anagram (anagramsFor) where


anagramsFor :: String -> [String] -> [String]
anagramsFor xs = filter isAnagram
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


anagramsFor2 :: String -> [String] -> [String]
anagramsFor2 xs = filter (filterPredicate xs)
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
                    
                     
                
