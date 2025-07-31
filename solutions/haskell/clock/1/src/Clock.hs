-- import Text.Printf

module Clock (addDelta, fromHourMin, toString) where

data Clock = Clock
  { hours ::  Int,
    minutes :: Int
  }
  deriving Eq

fromHourMin :: Int -> Int -> Clock
fromHourMin hours minutes = Clock ((hours + (minutes `div` 60)) `mod` 24) (minutes `mod` 60)

toString :: Clock -> String
--toString (Clock h m) = printf "%02d:%02d" h m
toString (Clock hour minute) = (padZero hour) ++ ":" ++ (padZero minute)
  where
    padZero t 
      | t < 10 = '0' : (show t)
      | otherwise = show t

addDelta :: Int -> Int -> Clock -> Clock
addDelta hours minutes (Clock h m) = fromHourMin (hours + h) (minutes + m)
