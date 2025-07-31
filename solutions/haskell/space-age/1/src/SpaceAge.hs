module SpaceAge (Planet(..), ageOn) where

data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune
            
secToEarthYear :: Float -> Float
secToEarthYear seconds = seconds / 31557600

ageOn :: Planet -> Float -> Float
ageOn Mercury seconds = secToEarthYear seconds / 0.2408467
ageOn Venus seconds = secToEarthYear seconds  /  0.61519726
ageOn Earth seconds = secToEarthYear seconds / 1.0
ageOn Mars seconds = secToEarthYear seconds / 1.8808158
ageOn Jupiter seconds = secToEarthYear seconds / 11.862615
ageOn Saturn seconds = secToEarthYear seconds / 29.447498
ageOn Uranus seconds = secToEarthYear seconds / 84.016846
ageOn Neptune seconds = secToEarthYear seconds / 164.79132
    


        
{--
| planet == Venus = 0.6159726 * earthYears
    | planet == Earth = 1.0 * earthYears
    | planet == Mars = 1.8808158 * earthYears
    | planet == Jupiter = 11.862615 * earthYears
    | planet == Saturn = 29.447498 * earthYears
    | planet == Uranus = 84.016846 * earthYears
    | planet == Neptune = 164.79132 * earthYears


    ageOn Venus seconds = 0.6159726 * earthYears
    ageOn Earth seconds = 1.0 * earthYears
    ageOn Mars seconds = 1.8808158 * earthYears
    ageOn Jupiter seconds = 11.862615 * earthYears
    ageOn Saturn seconds = 29.447498 * earthYears
    ageOn Uranus seconds = 84.016846 * earthYears
    ageOn Neptune seconds = 164.79132 * earthYears

    | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune
--}




