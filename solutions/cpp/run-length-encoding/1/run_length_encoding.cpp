#include "run_length_encoding.h"
#include <iostream>
#include <sstream>

namespace run_length_encoding {
	std::string encode(std::string plain) {
		std::stringstream encoded_stream;
		
		int count = 1;
		for (auto it = plain.begin(); it != plain.end(); it++) {
			if (*it == *(it + 1))
				++count;
			else {
				if (count > 1)
					encoded_stream << count;
				encoded_stream << *it;
				count = 1;
			}
		}
		
		return encoded_stream.str();
	}
	
	std::string decode(std::string encoded) {
		std::stringstream decoded_stream;

		size_t count = 0;
		for (auto it = encoded.begin(); it < encoded.end(); ++it) {
			if (*it >= '0' && *it <= '9') {
				count *= 10;
				char digit = *it - '0';
				count += digit;
			}
			else {
				count = count > 0 ? count : 1;
				decoded_stream << std::string(count, *it);
				count = 0;
			}
		}
		return decoded_stream.str();
	}
}
