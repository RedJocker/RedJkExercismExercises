module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz n = snd $ countSteps (n, 0)
    where
        countSteps (num, count)
            | num <= 0 = (-1, Nothing)
            | num == 1 = (1, Just count)
            | num `mod` 2 == 0 = countSteps (num `div` 2, count + 1)
            | otherwise = countSteps (3 * num + 1, count + 1)
            
            

