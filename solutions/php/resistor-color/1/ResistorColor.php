<?php

declare(strict_types=1);

function getAllColors(): array
{
    return [
        0 => 'black',
		1 => 'brown',
		2 => 'red',
		3 => 'orange',
		4 => 'yellow',
		5 => 'green',
		6 => 'blue',
		7 => 'violet',
		8 => 'grey',
		9 => 'white',
    ];
}

function colorCode(string $color): int
{
    return array_flip(getAllColors())[$color];
}
