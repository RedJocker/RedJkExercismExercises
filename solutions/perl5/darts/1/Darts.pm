package Darts;

use v5.38;

use Exporter qw<import>;
our @EXPORT_OK = qw<score_dart>;

our %squared_radius_to_points = (
    100, 0,
    25, 1,
    1, 5,
    0, 10
);

sub score_dart ( $x, $y ) {
    my $r_squared = ($x * $x) + ($y * $y);
    for my $key (sort {$b <=> $a} keys %squared_radius_to_points){
        if ($r_squared > $key){
            return $squared_radius_to_points{$key};
        }
    }
    return $squared_radius_to_points{0};
}
