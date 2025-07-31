<?php

declare(strict_types=1);

function reverseString(string $text): string
{
    $ret = $text;
    $len = strlen($text);
    for($i = 0; $i < $len; $i++) {
        $ret[$i] = $text[$len - 1 - $i];
    }
    return $ret;
}
