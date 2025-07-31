module SumOfMultiples (sumOfMultiples) where
    
import qualified Data.Set as Set 

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = (sum . listMultiples . (filter (/= 0))) factors
    where  
        genListMultiples factor = Set.fromList [factor, (2 * factor)..(limit - 1)]
        listMultiples = ((foldl  Set.union Set.empty) . (map genListMultiples))
        
        