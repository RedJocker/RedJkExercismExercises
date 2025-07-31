import java.time.LocalDateTime
import java.time.LocalDate
import java.time.temporal.ChronoUnit
import java.time.LocalTime

class Gigasecond {
    companion object {
        const val GIGA_SECOND = 1_000_000_000L
    }
    
    constructor(initialDate: LocalDateTime) {
        this.date = initialDate.plus(GIGA_SECOND, ChronoUnit.SECONDS) 
    }

    constructor(initialDate: LocalDate) {
        val time = LocalTime.ofSecondOfDay(0L)
        this.date = LocalDateTime.of(initialDate, time).plus(GIGA_SECOND, ChronoUnit.SECONDS)
    }

    val date: LocalDateTime;
}
