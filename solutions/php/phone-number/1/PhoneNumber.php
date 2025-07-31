<?php

declare(strict_types=1);

class PhoneNumber
{
    private string $number;
    
    public function __construct(string $number) {
        $norm = strtr($number, "()-.", "    ");
        $norm = preg_replace('/^\+1/', '1', $norm);
        $norm = preg_replace('/\s+/', '', $norm);
        $regex = "/^1?([2-9]\d{2})([2-9]\d{2})(\d{4})$/";
        $len = strlen($norm);
        if (!preg_match($regex, $norm)){
            if ($len > 11) {
                $message = 'more than 11 digits';
            } else if (preg_match('/[a-z]/i', $norm))  {
                $message = 'letters not permitted';
            } else if (preg_match('/[!@#$%^&*()]/', $norm)) {
                $message = 'punctuations not permitted';
            } else if($len == 11 && $norm[0] != "1") {
                $message = '11 digits must start with 1';
            } else if (($len == 10 && $norm[0] == "0") || ($len == 11 && $norm[1] == "0")) {
                $message = 'area code cannot start with zero';
            } else if (($len == 10 && $norm[0] == "1") || ($len == 11 && $norm[1] == "1")) {
                $message = 'area code cannot start with one';
            } else if (($len == 10 && $norm[3] == "0") || ($len == 11 && $norm[4] == "0")) {
                $message = 'exchange code cannot start with zero';
            } else if (($len == 10 && $norm[3] == "1") || ($len == 11 && $norm[4] == "1")) {
                $message = 'exchange code cannot start with one';
            } else if ($len != 10) {
                $message = 'incorrect number of digits';
            } else {
                $message = "$norm";
            }
            throw new InvalidArgumentException($message);
        }
        $this->number = $len == 10 ? $norm : substr($norm, 1);
    }
    
    public function number(): string
    {
        return $this->number;
    }
}

