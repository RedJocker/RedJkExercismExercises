#include "largest_series_product.h"
#include <cstddef>
#include <numeric>
#include <stdexcept>

namespace largest_series_product {
	int largest_product(std::string series, int window) {
		if (static_cast<size_t>(window) > series.length())
			throw std::domain_error("invalid window");
		int max_product = 0;
		auto end_windowed = series.end() - (window - 1);
		for (auto i = series.begin(); i != end_windowed; i++) {
			
			int cur = std::accumulate(i, i + window, 1, [](int acc, char cur) -> int {
				if (cur < '0' || cur > '9')
					throw std::domain_error("invalid digit");
				return acc * (static_cast<int>(cur - '0'));	
			});
			max_product = std::max(max_product, cur);
		}
		return max_product;
	}
}
