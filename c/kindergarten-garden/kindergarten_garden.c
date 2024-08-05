#include "kindergarten_garden.h"
#include <stdlib.h>

static plant_t plant_from_char(char ch)
{
	switch (ch)
	{
	case 'G':
		return GRASS;
	case 'C':
		return CLOVER;
	case 'R':
		return RADISHES;
	case 'V':
		return VIOLETS;
	}
	exit(1);
}

plants_t plants(const char *diagram, const char *student)
{
	plants_t	plants;
	int         offset;

	offset = (student[0] - 'A') * 2;
	plants.plants[0] = plant_from_char(diagram[offset]);
	plants.plants[1] = plant_from_char(diagram[offset + 1]);
	while (*diagram++ != '\n')
		;
	plants.plants[2] = plant_from_char(diagram[offset]);
	plants.plants[3] = plant_from_char(diagram[offset + 1]);
	return plants;
}

//typedef enum { CLOVER = 0, GRASS = 1, RADISHES = 2, VIOLETS = 3 } plant_t;
