<?php

class HighSchoolSweetheart
{
    public function firstLetter(string $name): string
    {
        return substr(trim($name), 0, 1);
    }

    public function initial(string $name): string
    {
        return strtoupper($this->firstLetter($name)) . ".";
    }

    public function initials(string $name): string
    {
        $arr = explode(" ", $name);
        return $this->initial($arr[0]) . " " . $this->initial($arr[1]);
    }

    public function pair(string $sweetheart_a, string $sweetheart_b): string
    {
        $initial_a = $this->initials($sweetheart_a);
        $initial_b = $this->initials($sweetheart_b);
        return <<<END
             ******       ******
           **      **   **      **
         **         ** **         **
        **            *            **
        **                         **
        **     $initial_a  +  $initial_b     **
         **                       **
           **                   **
             **               **
               **           **
                 **       **
                   **   **
                     ***
                      *
        END;
    }
}
