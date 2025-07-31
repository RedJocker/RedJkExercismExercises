#include "hamming.h"
#include <stdexcept>

namespace hamming {
	int compute(std::string str_a, std::string str_b) {
		if (str_a.length() != str_b.length())
			throw std::domain_error{"strands should have equal length"};
		int distance = 0;
		for (size_t i = 0; i < str_a.length(); i++) {
			if (str_a.at(i) != str_b.at(i))
				distance++;
		}
		return distance;
	}
}
