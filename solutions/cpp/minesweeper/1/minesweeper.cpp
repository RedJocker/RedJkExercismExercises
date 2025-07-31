#include "minesweeper.h"

namespace minesweeper {

	static char annotate_square(std::vector<std::string> field, size_t row, size_t col) {
		if (field.at(row).at(col) == '*')
			return '*';
		
		int count = 0;
		if (row > 0)
		{
			if (col > 0)
				count += field.at(row - 1).at(col - 1) == '*';
			count += field.at(row - 1).at(col) == '*';
			if (col < field.at(row - 1).length() - 1)
				count += field.at(row - 1).at(col + 1) == '*';
		}
		if (col > 0)
			count += field.at(row).at(col - 1) == '*';
		count += field.at(row).at(col) == '*';
		if (col < field.at(row).length() - 1)
			count += field.at(row).at(col + 1) == '*';
		if (row < field.size() - 1)
		{
			if (col > 0)
				count += field.at(row + 1).at(col - 1) == '*';
			count += field.at(row + 1).at(col) == '*';
			if (col < field.at(row + 1).length() - 1)
				count += field.at(row + 1).at(col + 1) == '*';
		}
		return count == 0 ? ' ' : count + '0';
	}

	
	const std::vector<std::string> annotate(std::vector<std::string> field) {
		std::vector<std::string> answer = field;

		for (size_t row = 0; row < field.size(); row++)
		{
			for (size_t col = 0; col < field.at(row).length(); col++)
			{
				answer.at(row).at(col) = annotate_square(field, row, col);
			}
		}
		return answer; 
	}
}  
