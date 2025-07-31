<?php

declare(strict_types=1);

function histogram(string $word): array
{
    $letters = mb_str_split($word);
    return array_reduce($letters, function($acc, $ele) {
        if(isset($acc[$ele])) {
            $acc[$ele]++;
        } else {
            $acc[$ele] = 1;
        }
        return $acc;
    }, []);
}

function isAnagram(string $word1, string $word2): bool
{
    return $word1 != $word2
        && histogram($word1) == histogram($word2);
}

function detectAnagrams(string $word, array $anagrams): array
{
    return array_values(array_filter($anagrams, function($ele) use($word){
        return isAnagram(mb_strtolower($word), mb_strtolower($ele));
    }));
}
