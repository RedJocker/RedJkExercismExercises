#include "bob.h"
#include <cctype>
#include <algorithm>

namespace bob {

	static bool is_blank(std::string &sentence) {
		return std::all_of(sentence.begin(),
						   sentence.end(),
						   [](char ch) -> bool {
							   return ch == ' '
								   || ch == '\n'
								   || ch == '\t'
								   || ch == '\r'
								   || ch == '\f'
								   || ch == '\v';
						   });
	}
	
	static bool is_screaming(std::string &sentence) {
		return std::any_of(sentence.begin(),
						   sentence.end(),
						   [](char ch) -> bool {
							   return std::isupper(ch);
							
						   })
			&& std::all_of(sentence.begin(),
						   sentence.end(),
						   [](char ch) -> bool {
							   return !std::islower(ch);
						   });
	}

	static bool is_question(std::string &sentence) {
		auto last_interrogation = sentence.find_last_of('?');
		auto remaining = sentence.substr(last_interrogation + 1); 
		return last_interrogation != std::string::npos
			&& is_blank(remaining);
	}
	
	std::string hey (std::string sentence) {
		if (is_blank(sentence))
			return fine;
		if (is_screaming(sentence) && is_question(sentence))
			return calm_down;
		if (is_screaming(sentence))
			return chill_out;
		if (is_question(sentence))
			return sure;
		return whatever;
	}
}
