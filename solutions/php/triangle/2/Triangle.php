<?php

declare(strict_types=1);

class Triangle
{
    public function __construct
        (private float $a, private float $b, private float $c)
    {
        if ($a <= 0 || $b <= 0 || $c <= 0) {
            throw new Exception("All sides must be greater than zero");
        }
        if ($c >= $a + $b || $b >= $a + $c || $a >= $b + $c) {
            throw new Exception(
                "The biggest side must be smaller " .
                    "than the sum of the other 2 sides");
        }
    }

    public function kind(): string
    {
        if ($this->a == $this->b && $this->a == $this->c) {
            $kind = 'equilateral';
        } else if ($this->a == $this->b
                   || $this->a == $this->c || $this->b == $this->c) {
            $kind = 'isosceles';
        }else {
            $kind = 'scalene';
        }
        return $kind;
    }
}
