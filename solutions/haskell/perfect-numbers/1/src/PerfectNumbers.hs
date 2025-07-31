module PerfectNumbers (classify, Classification(..)) where

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

classify :: Int -> Maybe Classification
classify number
  | number <= 0 = Nothing 
  | factorsSum == number = Just Perfect
  | factorsSum > number = Just Abundant
  | otherwise = Just Deficient
    where
      factorsSum = sum factors
      factors = [x | x <- [1..(number `div` 2)], number `mod` x == 0 ]
