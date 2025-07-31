#include "rotational_cipher.h"
#include <cctype>

namespace rotational_cipher {
	std::string rotate(std::string plain, int rot) {
		std::string cypher{plain};
		const char range = 'z' + 1 - 'a';
		for (size_t i = 0; i < plain.length(); i++){
			if (!isalpha(plain.at(i)))
				continue;
			char offset = isupper(plain.at(i)) ? 'A' : 'a';
			char letter_plain = plain.at(i) - offset; 
			char letter_cypher = (letter_plain + rot) % range;
			cypher.at(i) = letter_cypher + offset;
		}
		return cypher;
	}
}
