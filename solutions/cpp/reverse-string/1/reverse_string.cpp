#include "reverse_string.h"

namespace reverse_string
{
  std::string reverse_string(std::string str)
  {
    int middle = str.length() / 2; 
    for (int i = 0; i < middle; i++)
    {
      char temp = str[i];
      str[i] = str[str.length() - 1 - i];
      str[str.length() - 1 - i] = temp;
    }
    return str;
  }
}  // namespace reverse_string
