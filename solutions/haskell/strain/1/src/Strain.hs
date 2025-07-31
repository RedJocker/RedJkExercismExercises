module Strain (keep, discard) where

discard :: (a -> Bool) -> [a] -> [a]
discard p xs = recFilter (not . p) xs

keep :: (a -> Bool) -> [a] -> [a]
keep p xs = recFilter p xs


recFilter :: (a -> Bool) -> [a] -> [a]
recFilter _ [] = []
recFilter p (x:xs)
    | p x = x : recFilter p xs 
    | otherwise = recFilter p xs 
