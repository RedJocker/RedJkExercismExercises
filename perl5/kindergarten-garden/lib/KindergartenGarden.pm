package KindergartenGarden;

use v5.36;

use Exporter qw<import>;
our @EXPORT_OK = qw<plants>;

sub plants {
    my ($diagram, $student) = @_;
    my %plants = (
        C => 'clover',
        G => 'grass',
        R => 'radishes',
        V => 'violets',
   );
    
    my $offset = (ord(substr($student, 0, 1)) - 65) * 2;
    my @diag = split(/\n/, $diagram);
    my @row0 = split(//, $diag[0]);
    my @row1 = split(//, $diag[1]);
    my @res = (
	$plants{$row0[$offset]},
	$plants{$row0[$offset + 1]},
	$plants{$row1[$offset]},
	$plants{$row1[$offset + 1]},
	);
    return \@res;
}

1;
