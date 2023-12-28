<?php

declare(strict_types=1);

class Lasagna
{
    private const COOK_TIME = 40;
    private const LAYER_TIME = 2;
    private const ALARM_NOISE = "Ding!";
    
    function expectedCookTime()
    {
        return self::COOK_TIME;
    }
    
    function remainingCookTime($elapsed_minutes)
    {
        return $this->expectedCookTime() - $elapsed_minutes; 
    }

    function totalPreparationTime($layers_to_prep)
    {
        return $layers_to_prep * self::LAYER_TIME;
    }
    
    function totalElapsedTime($layers_to_prep, $elapsed_minutes)
    {
        return $this->totalPreparationTime($layers_to_prep) + $elapsed_minutes;
    }
    
    function alarm()
    {
        return self::ALARM_NOISE;
    }
}
