package Series;

use v5.30.3;

use Exporter qw<import>;
our @EXPORT_OK = qw<slices>;

sub slices {
	my ( $series, $slice_length ) = @_;
	my $series_len = length $series;

	if ($slice_length == 0) {
		die "slice length cannot be zero";
	} elsif ($series_len == 0) {
		die "series cannot be empty"
	} elsif ($slice_length > $series_len) {
		die "slice length cannot be greater than series length";
	} elsif ($slice_length < 0) {
		die "slice length cannot be negative";
	}
	
	my @arr;
	for (my $i = 0; $i <= $series_len - $slice_length; $i++){
		$arr[$i] = substr $series, $i, $slice_length;
	}
    return \@arr;
}

1;
