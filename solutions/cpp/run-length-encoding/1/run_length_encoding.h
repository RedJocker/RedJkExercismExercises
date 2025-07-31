#pragma once

#include <string>

namespace run_length_encoding {
	std::string encode(std::string plain);
	std::string decode(std::string encoded);
}
