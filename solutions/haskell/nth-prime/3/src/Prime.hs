module Prime (nth) where

nth :: Int ->  Maybe Integer
nth n 
  | n <= 0 = Nothing
  | otherwise = Just $ primes !! (n - 1)

primes :: [Integer]
primes = nextPrime (2:[3,5..])
  where
    nextPrime (prime:ps) = prime : nextPrime (filter (indivisibleBy prime) ps)
    nextPrime _ = error "nextPrime should always have next element"

indivisibleBy :: Integer -> Integer -> Bool
indivisibleBy divisor num = mod num divisor /= 0
