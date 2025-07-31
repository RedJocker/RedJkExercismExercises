package Lasagna;

use v5.30.3;

our $ExpectedMinutesInOven = 40;

sub remaining_minutes_in_oven {
	my ($actual_minutes_in_oven) = @_;
	$ExpectedMinutesInOven - $actual_minutes_in_oven;
}

sub preparation_time_in_minutes  {
	my ($number_of_layers) = @_;
	$number_of_layers * 2;
}

sub total_time_in_minutes {
	my ($number_of_layers, $actual_minutes_in_oven) = @_;
	preparation_time_in_minutes($number_of_layers) + $actual_minutes_in_oven;
}

sub oven_alarm {
	"Ding!"
}

