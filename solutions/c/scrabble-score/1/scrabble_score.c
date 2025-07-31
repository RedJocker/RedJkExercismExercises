#include "scrabble_score.h"
#include <ctype.h>

static unsigned int ch_score(const char ch)
{
  char nch = toupper(ch);
  
  switch (nch)
  {
    case 'A':
    case 'E':
    case 'I':
    case 'O':
    case 'U':
    case 'L':
    case 'N':
    case 'R':
    case 'S':
  	case 'T': return 1;
	case 'D':
    case 'G': return 2;
    case 'B':
    case 'C':
    case 'M':
    case 'P': return 3;
    case 'F':
    case 'H':
    case 'V':
  	case 'W':
    case 'Y': return 4;
    case 'K': return 5;
    case 'J':
    case 'X': return 8;
    case 'Q':
    case 'Z': return 10;
  }
  return 0;
}

unsigned int score(const char *word)
{
  unsigned int sum = 0;
  const char *p = word;
  while (*p)
  {
	sum += ch_score(*p);
	p++;
  }
  return sum;
}
