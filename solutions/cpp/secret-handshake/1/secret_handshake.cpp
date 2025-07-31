#include "secret_handshake.h"
#include <algorithm>

namespace secret_handshake {
	std::vector<std::string> commands(int num) {
		std::vector<std::string> actions;

		if ((num & 0b1) == 0b1)
			actions.push_back("wink");
		if ((num & 0b10) == 0b10)
			actions.push_back("double blink");
		if ((num & 0b100) == 0b100)
			actions.push_back("close your eyes");
		if ((num & 0b1000) == 0b1000)
			actions.push_back("jump");
		if ((num & 0b10000) == 0b10000)
			std::reverse(actions.begin(), actions.end());

		return actions;
	}
} 
