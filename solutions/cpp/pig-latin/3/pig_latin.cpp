#include "pig_latin.h"
#include <sstream>
#include <vector>
#include <iterator>

namespace pig_latin {

	static bool is_vowel(char maybe_vowel) {
		const std::string vowels = "aeiou";
		return  vowels.find(maybe_vowel) != std::string::npos;
	}

	static bool is_rule1(std::string &plain) {
		return is_vowel(plain.at(0))
			|| (plain.at(0) == 'x' && plain.at(1) == 'r')
			|| (plain.at(0) == 'y' && plain.at(1) == 't');
		
	}

	static std::string rule1(std::string &plain) {
		return plain + "ay";
	}

	static std::string rule2(std::string &plain) {
		int i = -1;

		while (!is_vowel(plain.at(++i)))
			;
		return plain.substr(i) + plain.substr(0, i) + "ay";
	}

	static bool is_rule3(std::string &plain) {
		for (size_t i = 0; i < plain.length(); i++) {
			if (is_vowel(plain.at(i)))
				return false;
			if (plain.at(i) == 'q'
				&& i < plain.length() - 2
				&& plain.at(i + 1) == 'u')
				return true;
		}
		return false;
	}

	static std::string rule3(std::string &plain) {
		int i = 0;

		while (plain.at(i++) != 'u')
			;
		return plain.substr(i) + plain.substr(0, i) + "ay";
	}

	static bool is_rule4(std::string &plain) {
		for (size_t i = 0; i < plain.length(); i++) {
			if (is_vowel(plain.at(i)))
				return false;
			if (plain.at(i) == 'y' && i > 0)
				return true;
		}
		return false;
		
	}

	static std::string rule4(std::string &plain) {
		int i = -1;

		while (plain.at(++i) != 'y')
			;
		return plain.substr(i) + plain.substr(0, i) + "ay";
	}
	
	static std::string translate_word(std::string word) {
		if(is_rule1(word))
			return rule1(word);
		if(is_rule3(word))
			return rule3(word);
		if(is_rule4(word))
			return rule4(word);
		return rule2(word);
	}

	static std::vector<std::string> split(const std::string& str) {
		std::stringstream ss(str);
		std::vector<std::string> vec {
			std::istream_iterator<std::string>{ss},
			std::istream_iterator<std::string>{}};
    	return vec;
	}

	static std::string join(const std::vector<std::string> &vec) {
		std::string res;

		for (size_t i = 0; i < vec.size() - 1; i++)
			res += vec.at(i) + " ";
		res += vec.at(vec.size() - 1);
		return res;
	}

	std::string translate(std::string sentence) {
		auto words = split(sentence);
		for (size_t i = 0; i < words.size(); i++) {
			words.at(i) = translate_word( words.at(i));
		}
		return join(words);
	}
	
}  // namespace pig_latin
