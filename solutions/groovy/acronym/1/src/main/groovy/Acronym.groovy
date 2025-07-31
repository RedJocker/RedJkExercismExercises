class Acronym {

    static String abbreviate(String phrase) {
        def words = phrase.split("\\s+")
	def initials = words.collect { it[0] }
	def abrev = initials.join("").toUpperCase()
	return abrev
    }

}
