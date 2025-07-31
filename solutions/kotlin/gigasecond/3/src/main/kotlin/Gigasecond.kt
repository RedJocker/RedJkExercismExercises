import java.time.LocalDateTime
import java.time.LocalDate
import java.time.temporal.ChronoUnit
import java.time.LocalTime

class Gigasecond(initialDate: LocalDateTime) {

    constructor(initialDate: LocalDate) : this(initialDate.atStartOfDay()) 
       
    val date = initialDate.plusSeconds(1E9.toLong())
}
