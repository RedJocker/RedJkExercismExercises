package Gigasecond;

use v5.30.3;

use Time::Piece;

use Exporter qw<import>;
our @EXPORT_OK = qw<add_gigasecond>;

use constant STRPTIME_FORMAT => '%Y-%m-%d' . 'T' . '%H:%M:%S';
use constant GIGASECOND => 1_000_000_000;
	
sub _parse_datetime {
	my ($date_string) = @_;
    Time::Piece->strptime($date_string, STRPTIME_FORMAT);
}


sub add_gigasecond {
	my ($time_str) = @_;
	
    my $time = _parse_datetime($time_str);
	my $giga_time = $time + GIGASECOND;
	return $giga_time->strftime(STRPTIME_FORMAT);
}

