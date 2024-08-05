package BookingUpForBeauty;

use v5.36;

# Suggested datetime modules you can use:
use Time::Piece;
#use DateTime::Tiny;

# Recommended, commented out for portability.
#use Readonly;

use Exporter ('import');
our @EXPORT_OK = ('appointment_has_passed', 'is_afternoon_appointment', 'describe_appointment' );

my $STRPTIME_FORMAT = '%Y-%m-%d' . 'T' . '%H:%M:%S';
#Readonly::Scalar $STRPTIME_FORMAT => $STRPTIME_FORMAT;

# Private subroutines conventionally start with an underscore.
# It isn't necessary, but provided for convenience.
sub _parse_datetime ($date_string) {
    Time::Piece->strptime($date_string, $STRPTIME_FORMAT);
}

sub appointment_has_passed ($date_string) {
    my $apointment_time = _parse_datetime($date_string);
    my $curr_time = localtime;
    return $apointment_time < $curr_time;
}

sub is_afternoon_appointment ($date_string) {
    my $time = _parse_datetime($date_string);
    return $time->hour >= 12 && $time->hour < 18;
}

sub describe_appointment ($date_string) {
    my $time = _parse_datetime($date_string);
    my $fmt = "%m/%d/%Y %l:%M %p";
    my $time_str = $time->strftime($fmt);
    $time_str =~ s/ +/ /;
    return sprintf(
        'You have an appointment on %s',$time_str
    );
}

1;
