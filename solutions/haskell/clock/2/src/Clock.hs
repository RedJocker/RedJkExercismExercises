module Clock (addDelta, fromHourMin, toString) where

import Text.Printf

data Clock = Clock
  { hours ::  Int,
    minutes :: Int
  }
  deriving Eq

instance Show Clock where
  show clock = toString clock

fromHourMin :: Int -> Int -> Clock
fromHourMin hours minutes = Clock ((hours + (minutes `div` 60)) `mod` 24) (minutes `mod` 60)

toString :: Clock -> String
toString (Clock h m) = printf "%02d:%02d" h m

addDelta :: Int -> Int -> Clock -> Clock
addDelta hours minutes (Clock h m) = fromHourMin (hours + h) (minutes + m)
