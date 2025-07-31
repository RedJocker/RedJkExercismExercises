#include "food_chain.h"

namespace food_chain {
	static std::string verse_end(int i) {
		std::string end;

		if (i >= 7)
			end += "She swallowed the cow to catch the goat.\n";
		if (i >= 6)
			end += "She swallowed the goat to catch the dog.\n";
		if (i >= 5)
			end += "She swallowed the dog to catch the cat.\n";
		if (i >= 4)
			end += "She swallowed the cat to catch the bird.\n";
		if (i >= 3)
			end += "She swallowed the bird to catch the spider that wriggled"
				" and jiggled and tickled inside her.\n";
		if (i == 2)
			end += "It wriggled and jiggled and tickled inside her.\n";
		if (i >= 2)
			end += "She swallowed the spider to catch the fly.\n";
		if (i >= 1)
			end += "I don't know why she swallowed the fly. Perhaps she'll die.\n";
		return end;
	}

	static std::string verse_begin(int i) {
		std::string begin;

		if (i == 7)
			begin +=  "I know an old lady who swallowed a cow.\n"
				"I don't know how she swallowed a cow!\n";
		if (i == 6)
			begin += "I know an old lady who swallowed a goat.\n"
					"Just opened her throat and swallowed a goat!\n";
		if (i == 5)
			begin += "I know an old lady who swallowed a dog.\n"
					"What a hog, to swallow a dog!\n";
		if (i == 4)
			begin += "I know an old lady who swallowed a cat.\n"
					"Imagine that, to swallow a cat!\n";
		if (i == 3)
			begin += "I know an old lady who swallowed a bird.\n"
        			"How absurd to swallow a bird!\n";
		if (i == 2)
			begin += "I know an old lady who swallowed a spider.\n";
		if (i == 1)
			begin += "I know an old lady who swallowed a fly.\n";

		return begin;
	}

	std::string verse(int i) {
		if (i >= 8)
			return "I know an old lady who swallowed a horse.\n"
        "She's dead, of course!\n";
		std::string begin = verse_begin(i);
		std::string end = verse_end(i);
		return begin + end;
	}

	std::string verses(int i, int j) {
		std::string verses;
		for (int v = i; v <= j; ++v) {
			
			verses += verse(v);
			verses += "\n";
		}
		return verses;
	}

	std::string sing() {
		return verses(1, 8);
	}	
}
