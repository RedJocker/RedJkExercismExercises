module SumOfMultiples (sumOfMultiples) where

import qualified Data.List as Ls 
sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = (sumList . listMultiples . (filter (/= 0))) factors
    where  
        sumList = (foldl (+) 0)
        genListMultiples factor = takeWhile (< limit) [i * factor | i <- [1..]]
        listMultiples = ((foldl  Ls.union []) . (map genListMultiples))
        