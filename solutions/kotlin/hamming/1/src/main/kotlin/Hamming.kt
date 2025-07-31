import java.lang.IllegalArgumentException

object Hamming {

    fun compute(leftStrand: String, rightStrand: String): Int =
        if(leftStrand.length == rightStrand.length) {
            leftStrand.zip(rightStrand).fold(0) { acc, (left, right) ->
                if (left != right) acc + 1 else acc
            }
        } else {
            throw IllegalArgumentException("left and right strands must be of equal length")
        }
}
