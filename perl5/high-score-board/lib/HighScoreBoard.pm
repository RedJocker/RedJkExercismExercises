package HighScoreBoard;

use v5.30.3;

our %Scores;

sub set_player_scores {
	my (%new_scores) = @_;
	foreach my $name_key (keys %new_scores){
		$Scores{ $name_key } = $new_scores { $name_key };
	}
}

sub get_player_score {
	my ($player) = @_;
	$Scores{ $player };
}

sub increase_player_scores {
	my (%additional_scores) = @_;
	foreach my $name_key (keys %additional_scores) {
		$Scores { $name_key } += $additional_scores { $name_key };
	}
}

sub sort_players_by_name {
	my @names = keys %Scores;
	sort @names;
}

sub sort_players_by_score {
	my @names = keys %Scores;
	sort { %Scores { $b } <=> %Scores { $a } } @names;
}

sub delete_player {
	my ($player) = @_;
	delete $Scores{ $player };
}

1;
