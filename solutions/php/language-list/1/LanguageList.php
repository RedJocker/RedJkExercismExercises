<?php

declare(strict_types=1);

function language_list(string ...$languages): array
{
    return $languages;
}

function add_to_language_list(array $language_list, string $language): array {
    return [...$language_list, $language];
}

function prune_language_list(array $language_list): array {
    $copy = [...$language_list];
    array_shift($copy);
    return $copy;
}

function current_language(array $language_list): string {
    [$head] = $language_list;
    return $head;
}

function language_list_length(array $language_list): int {
    return  count($language_list);
}
