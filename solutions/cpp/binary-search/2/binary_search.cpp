#include "binary_search.h"
#include <stdexcept>

namespace binary_search {
	std::size_t find(const std::vector<int> data, int value) {
		int bottom {0};
		int top {static_cast<int>(data.size()) - 1};

		while (top >= bottom) {
			size_t middle = bottom + ((top - bottom) / 2);
			if (data.at(middle) == value)
				return middle;
			else if (data.at(middle) > value) {
				top = middle - 1;
			}
			else {
				bottom = middle + 1;
			}
		}
		throw std::domain_error{"value not found"};
	}
}
