module Prime (nth) where

nth :: Int ->  Maybe Integer
nth n 
  | n <= 0 = Nothing
  | otherwise = Just $ primes !! (n - 1)

primes :: [Integer]
primes = nextPrime (2:[3,5..])
  where
    nextPrime (prime:ps) = prime : nextPrime (filter (\ candidate -> mod candidate prime /= 0) ps)
    nextPrime _ = error "nextPrime should always have next element"
