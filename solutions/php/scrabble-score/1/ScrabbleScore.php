<?php declare(strict_types=1);

function letter_score(string $char): int
{
    return match($char) {
        'A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T' => 1,
        'D', 'G'                                         => 2,
        'B', 'C', 'M', 'P'                               => 3,
        'F', 'H', 'V', 'W', 'Y'                          => 4,
        'K'                                              => 5,
        'J', 'X'                                         => 8,
        'Q', 'Z'                                         => 10,
    };
}

function score(string $word): int
{
    return array_reduce(str_split($word), function ($acc, $ele) {
        return $acc + letter_score(strtoupper($ele));
    } ,0);
}
