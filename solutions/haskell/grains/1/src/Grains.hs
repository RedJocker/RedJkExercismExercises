module Grains (square, total) where
import qualified Control.Monad as Mon

square :: Integer -> Maybe Integer
square n 
  | n <=0 || n > 64 = Nothing
  | otherwise = Just (2 ^ (n - 1))

total :: Integer
total = maybe 0 id  (fmap sum $ Mon.sequence (map square [1..64]))
