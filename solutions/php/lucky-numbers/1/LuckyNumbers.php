<?php

class LuckyNumbers
{
    public function sumUp(array $digitsOfNumber1, array $digitsOfNumber2): int
    {
        $len = max(count($digitsOfNumber1), count($digitsOfNumber2));
        $zip = array_map(null,
                         array_pad($digitsOfNumber1, -$len, 0),
                         array_pad($digitsOfNumber2, -$len, 0));
        return array_reduce($zip,
                            function($acc, $pair) { return $acc * 10 + $pair[0] + $pair[1]; },
                            0);
    }

    public function isPalindrome(int $number): bool
    {
        $copy = $number;
        $reversed = 0;
        while($copy > 0) {
            $reversed = ($reversed * 10) + ($copy % 10);
            $copy = intdiv($copy, 10); 
        }
        return $reversed == $number;
    }

    public function validate(string $input): string
    {
        if ($input === "") {
            return "Required field";
        }
        else if ($input < 0 || ($input !== 0 && ((int) $input) == 0)) {
            return "Must be a whole number larger than 0";
        }
        return "";
    }
}
