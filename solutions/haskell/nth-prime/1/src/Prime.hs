module Prime (nth) where

nth :: Int ->  Maybe Integer
nth n 
  | n <= 0 = Nothing
  | n == 1 = Just 2 
  | otherwise = findNextPrime (n - 2) [3,5..]
    where
      findNextPrime 0 (primeNum:_) = Just primeNum
      findNextPrime counter (primeNum:odds) = findNextPrime (counter - 1) $ filter (\ oddNum -> mod oddNum primeNum /= 0) odds
      findNextPrime _ _ = Nothing
      
      
