module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz n 
    | n <= 0 = Nothing
    | otherwise = Just $ countSteps n 0
    where
        countSteps num count
            | num == 1 = count
            | num `mod` 2 == 0 = countSteps (num `div` 2) (count + 1)
            | otherwise = countSteps (3 * num + 1) (count + 1)
            
            

