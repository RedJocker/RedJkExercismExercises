datatype planet = Mercury | Venus | Earth | Mars
                | Jupiter | Saturn | Uranus | Neptune

fun period_earth_years planet =
    case planet of
	Mercury => 0.2408467
      | Venus => 0.61519726
      | Earth => 1.0
      | Mars =>  1.8808158
      | Jupiter => 11.862615
      | Saturn => 29.447498
      | Uranus => 84.016846
      | Neptune => 164.79132
						  
fun age_on planet seconds =
    let
	val earthYears = (Real.fromInt seconds) / 31557600.0
    in
	earthYears / (period_earth_years planet)
    end
