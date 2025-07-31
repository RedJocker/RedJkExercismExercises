#include <string>

namespace log_line {
  std::string message(std::string msg) {
    size_t i = msg.find(": ");
    return msg.substr(i + 2);
  }

  std::string log_level(std::string msg) {
    size_t s = msg.find("[") + 1;
    size_t e = msg.find("]") - 1;
    return msg.substr(s, e);
  }

  std::string reformat(std::string msg) {
    return message(msg) + " (" + log_level(msg) + ")";
  }
} // namespace log_line
