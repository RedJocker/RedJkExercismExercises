module SpaceAge (Planet(..), ageOn) where

data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune
            deriving(Eq)

ageOn :: Planet -> Float -> Float
ageOn planet seconds
    | planetIs Mercury = earthYears / 0.2408467
    | planetIs Venus  = earthYears /  0.61519726
    | planetIs Earth  = earthYears / 1.0
    | planetIs Mars = earthYears / 1.8808158
    | planetIs Jupiter = earthYears / 11.862615
    | planetIs Saturn = earthYears / 29.447498
    | planetIs Uranus = earthYears / 84.016846
    | planetIs Neptune = earthYears / 164.79132
    | otherwise = -1.0
    where earthYears = seconds / 31557600
          planetIs p = (==) planet p
    