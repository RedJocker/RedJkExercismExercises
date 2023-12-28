package Luhn;

use v5.30.3;

use Exporter qw<import>;
our @EXPORT_OK = qw<is_luhn_valid>;

sub is_luhn_valid {
	my ($number_str) = @_;
	
	$number_str =~ s/\s+//g;
	my $len = length $number_str;
	if ($len < 2 || $number_str =~ /\D/) {
		return 0;
	}

	my @digits_ch = split //, $number_str;
	my @digits_int = map { (ord $_) - (ord '0')} @digits_ch;

	my $acc = 0;
	for ( my $i = $len - 1, my $j = 0; $i >= 0; $i--, $j++) {
		if ($j % 2 == 0) {
			$acc += $digits_int[$i]; 
		} else {
			$digits_int[$i] *= 2;
			$digits_int[$i] = $digits_int[$i] > 9
				? $digits_int[$i] - 9
				: $digits_int[$i];
			$acc += $digits_int[$i]; 
		}
	}
    return ($acc % 10) == 0;
}

1;
