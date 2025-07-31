#include "spiral_matrix.h"
#include <cstdint>



namespace spiral_matrix {
	void fill_top(std::vector<std::vector<uint32_t> > &spiral_matrix,
				  int &top, int &right, int &left, int &counter) {
		int i = left;
		while (i <= right) {
			spiral_matrix.at(top).at(i) = ++counter;
			i++;
		}
		top++;
	}

	void fill_right(std::vector<std::vector<uint32_t> > &spiral_matrix,
				  int &right, int &top, int &bottom, int &counter) {
		int i = top;
		while (i <= bottom) {
			spiral_matrix.at(i).at(right) = ++counter;
			i++;
		}
		right--;
	}

	void fill_bottom(std::vector<std::vector<uint32_t> > &spiral_matrix,
				  int &bottom, int &right, int &left, int &counter) {
		int i = right;
		while (i >= left) {
			spiral_matrix.at(bottom).at(i) = ++counter;
			i--;
		}
		bottom--;
	}

	void fill_left(std::vector<std::vector<uint32_t> > &spiral_matrix,
				  int &left, int &top, int &bottom, int &counter) {
		int i = bottom;
		while (i >= top) {
			spiral_matrix.at(i).at(left) = ++counter;
			i--;
		}
		left++;
	}

	std::vector<std::vector<uint32_t> > spiral_matrix(int size) {
		int counter = 0;
		int top = 0;
		int left = 0;
		int bottom = size - 1;
		int right = size - 1;

		std::vector<std::vector<uint32_t> > answer(size, std::vector<uint32_t>(size));

		while (bottom >= top || right >= left) {
			fill_top(answer, top, right, left, counter);
			fill_right(answer, right, top, bottom, counter);
			fill_bottom(answer, bottom, right, left, counter);
			fill_left(answer, left, top, bottom, counter);
		}

		return answer;
	}
}  // namespace spiral_matrix
