module Strain (keep, discard) where

discard :: (a -> Bool) -> [a] -> [a]
discard p = recFilter (not . p)

keep :: (a -> Bool) -> [a] -> [a]
keep = recFilter 


recFilter :: (a -> Bool) -> [a] -> [a]
recFilter _ [] = []
recFilter p (x:xs)
    | p x = x : recFilter p xs 
    | otherwise = recFilter p xs 
