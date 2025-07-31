module SumOfMultiples (sumOfMultiples) where

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit =  sumList filteredList
    where
        sumList = foldl (+) 0 
        listPredicates = map (\x -> \y -> (y `mod` x == 0)) (filter (/= 0) factors)
        applyListPredicatesTo x = any id (map ($ x) listPredicates)
        filteredList = filter applyListPredicatesTo [1..(limit - 1)]