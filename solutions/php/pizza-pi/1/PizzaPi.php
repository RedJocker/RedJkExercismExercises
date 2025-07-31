<?php

class PizzaPi
{
    private const SAUCE_PER_PIZZA = 125;
    
    public function calculateDoughRequirement(int $pizzas, int $num_persons): int
    {
        return $pizzas * (($num_persons * 20) + 200);
    }

    public function calculateSauceRequirement(int $pizzas, int $sauce_per_can): int
    {
        return ($pizzas * self::SAUCE_PER_PIZZA) / $sauce_per_can; 
    }

    public function calculateCheeseCubeCoverage
        (int $cube_length, float $thickness, int $diameter): float
    {
        return (int)(($cube_length ** 3) / ($thickness * M_PI * $diameter));
    }

    public function calculateLeftOverSlices(int $pizzas, int $num_persons): int
    {
        return ($pizzas * 8) % $num_persons;
    }
}
