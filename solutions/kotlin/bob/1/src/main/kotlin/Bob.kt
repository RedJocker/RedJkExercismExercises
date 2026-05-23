object Bob {
    const val sure = "Sure.";
    const val chill = "Whoa, chill out!";
    const val iKnow = "Calm down, I know what I'm doing!";
    const val fine = "Fine. Be that way!";
    const val whatever = "Whatever.";

    private fun isQuestion(input: String): Boolean = input.trimEnd().lastOrNull() == '?'
    private fun isScream(input: String): Boolean = input.all { !it.isLowerCase() } && input.any { it.isUpperCase() }
    private fun isBlank(input: String): Boolean = input.isBlank()

    fun hey(input: String): String {
        val screaming = isScream(input)
        val questioning = isQuestion(input)
        return when {
            isBlank(input) -> fine
            screaming && questioning -> iKnow
            screaming -> chill
            questioning -> sure
            else -> whatever
        }
    }
}
