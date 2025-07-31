<?php

require_once "Size.php";

class ProgramWindow
{
    public $x;
    public $y;
    public $width;
    public $height;

    function __construct()
    {
        $this->x = 0;
        $this->y = 0;
        $this->width = 800;
        $this->height = 600;
    }

    function resize(Size $size)
    {
        $this->width = $size->width;
        $this->height = $size->height;
    }

    function move(Position $position)
    {
        $this->x = $position->x;
        $this->y = $position->y;
    }
}
