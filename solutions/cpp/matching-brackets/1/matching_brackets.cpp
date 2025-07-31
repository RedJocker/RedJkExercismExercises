#include "matching_brackets.h"
#include <string>
#include <stack>

namespace matching_brackets {
	const std::string opens = "[{(";
	const std::string closes = "]})";

	int check(std::string str) {
		std::stack<char> stack = std::stack<char>();
		
		for (size_t i = 0; i < str.length(); i++) {
			if (opens.find(str.at(i)) != std::string::npos)
				stack.push(str.at(i));
			else if (closes.find(str.at(i)) != std::string::npos) {
				if (stack.empty())
					return 0;
				const char poped = stack.top();
				const size_t j = opens.find(poped);
				if (str.at(i) != closes.at(j))
					return 0;
				stack.pop();
			}
		}
		return stack.empty();
	}
}
