<?php

declare(strict_types=1);

const NUCLEOTIDE_COMPLEMENT_MAP = [
    'G' => 'C',
    'C' => 'G',
    'T' => 'A',
    'A' => 'U'
];

function toRna(string $dna): string
{
    return implode('', array_map(function (string $ch) {
        return NUCLEOTIDE_COMPLEMENT_MAP[$ch];
    }, str_split($dna)));
}
