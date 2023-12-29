module Phone (number) where

import Data.Char (isDigit)

number :: String -> Maybe String
number rawPhoneNumber = if isValid then Just normalized else Nothing
  where
    normalized = withoutCountry1 digitsOnly
      where
        digitsOnly = filter isDigit rawPhoneNumber
        withoutCountry1 [] = []
        withoutCountry1 digits@(d:ds)
          | d == '1' = ds
          | otherwise = digits
    isValid = all ($ normalized) [isValidLength, isValidRegion, isValidExchange]
      where
        isValidLength xs = length xs == 10
        isValidRegion (n:_) = isNotZeroOrOne n
        isValidRegion _ = False
        isValidExchange (_:_:_:n:_) = isNotZeroOrOne n
        isValidExchange _ = False
        isNotZeroOrOne ch = ch /= '0' && ch /= '1'
