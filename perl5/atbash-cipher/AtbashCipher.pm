package AtbashCipher;

use v5.30.3;

use Exporter qw<import>;
our @EXPORT_OK = qw<encode_atbash decode_atbash>;

sub encode_atbash {
	my ($phrase) = @_;
	$phrase =~ s/\W+//g;
	my @arr = split //, lc $phrase;

	for my $i (0 .. $#arr) {
		my $ch_code = (ord $arr[$i]) - 97;
		my $ch_cypher_code = 25 - $ch_code;
		if($ch_cypher_code >= 0 && $ch_cypher_code <= 25){
			$arr[$i] = chr ($ch_cypher_code + 97);
		}
	}
	my $encode = join "", @arr;
	$encode =~ s/(.{5})/$1 /g; #groups of five separated by space
	$encode =~ s/ $//; # trim right side
    return $encode;
}

sub decode_atbash {
	my ($phrase) = @_;
    $phrase =~ s/\W+//g;
	my @arr = split //, lc $phrase;

	for my $i (0 .. $#arr) {
		my $ch_code = (ord $arr[$i]) - 97;
		my $ch_cypher_code = 25 - $ch_code;
		if($ch_cypher_code >= 0 && $ch_cypher_code <= 25){
			$arr[$i] = chr ($ch_cypher_code + 97);
		}
	}
	my $decode = join "", @arr;
    return $decode;
}
			   
1;
