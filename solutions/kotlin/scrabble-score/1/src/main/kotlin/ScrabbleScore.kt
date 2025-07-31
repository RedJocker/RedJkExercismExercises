object ScrabbleScore {

    private val letterToScore: Map<Char, Int> = run {
        val one = listOf('A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T') to 1
        val two = listOf('D', 'G') to 2
        val three = listOf('B', 'C', 'M', 'P') to 3
        val four = listOf('F', 'H', 'V', 'W', 'Y') to 4
        val five = listOf('K') to 5
        val eight = listOf('J', 'X') to 8
        val ten = listOf('Q', 'Z') to 10

        listOf(one, two, three, four, five, eight, ten).flatMap { (list, value) ->
            list.map { char -> char to value }
        }.toMap()
    }

    fun scoreLetter(char: Char): Int = letterToScore[char.uppercaseChar()] ?: 0

    fun scoreWord(word: String): Int = word.sumOf(::scoreLetter)

}
