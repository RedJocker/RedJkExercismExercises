#include "knapsack.h"

#include <algorithm>
#include <limits>

namespace knapsack
{
	template <typename Iterator>
	static int max_value(int max_weight, Iterator begin, Iterator end) {
		//int max = std::numeric_limits<int>::min();

		if (begin != end) {
			if (begin->weight > max_weight)
				return max_value(max_weight, begin + 1, end);
			else {
				int with = begin->value
					+ max_value(max_weight - begin->weight, begin + 1, end);
				int without = max_value(max_weight, begin + 1, end);
				return with >= without ? with : without; 	
			}
		}
		return 0;
	}
	
    int maximum_value(int max_weight, std::vector<knapsack::Item> items) {
		std::sort(items.begin(),
				  items.end(),
				  [](knapsack::Item &a, knapsack::Item &b) -> bool {
							return a.value < b.value;
				  });
		return max_value(max_weight, items.begin(), items.end());
	}
}

