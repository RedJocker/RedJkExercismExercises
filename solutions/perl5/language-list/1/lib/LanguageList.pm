package LanguageList;

use v5.30.3;

our @Languages;

sub add_language  {
	my ($language) = @_;
	push(@Languages, $language);
}

sub remove_language () {
	pop(@Languages);
}

sub first_language () {
	$Languages[0];
}

sub last_language () {
	$Languages[-1];
}

sub get_languages  {
	my (@elements) = @_;
	my @idxs = map { $_ - 1 } @elements;
	@Languages[@idxs];
}

sub has_language  {
	my ($language) = @_;
	my $len =  grep { $_ eq $language } @Languages;
	$len > 0;
}

1;
