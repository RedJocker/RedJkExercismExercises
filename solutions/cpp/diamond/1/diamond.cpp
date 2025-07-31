#include "diamond.h"

namespace diamond {
	std::vector<std::string> rows(char ch) {
		int ch_num = ch - 'A' + 1;
		int num_rows = ch_num + (ch_num - 1);

		std::vector<std::string>result(num_rows);
		
		for (int i = 0; i < (num_rows + 1) / 2; i++) {
 			if (i == 0) {
				result.at(0) = std::string(num_rows / 2, ' ')
					+ std::string(1, 'A')
					+ std::string(num_rows / 2, ' ');
				result.at(num_rows - 1) = result.at(0);
				continue;
			}
			result.at(i) = std::string((num_rows - (2 * i)) / 2, ' ')
				+ std::string(1, static_cast<char>(i) + 'A')
				+ std::string(i + (i - 1), ' ')
				+ std::string(1, static_cast<char>(i) + 'A')
				+ std::string((num_rows - (2 * i)) / 2, ' ');

			result.at(num_rows - 1 - i) = result.at(i);
		}
		return result;
	}
}
