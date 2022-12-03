package AOC::2022::Day1;

use 5.32.1;
use strict;
use warnings FATAL => 'all';

use List::Util qw/sum/;

our $VERSION = '0.01';


sub part_1 {
	my $input = shift;

	my $calories = 0;
	my $max = 0;

	open my $fh, $input or die "Could not open $input: $!";
	while (my $line = <$fh>) {
		chomp $line;
		if (!length $line) {
			if ($calories > $max) {
				$max = $calories;
			}

			$calories = 0;
			next;
		}

		$calories += $line;
	}
	close $fh;

	return $max;
}

sub part_2 {
	my $input = shift;

	my $calories = 0;
	my @ranking;

	open my $fh, $input or die "Could not open $input: $!";
	while (my $line = <$fh>) {
		chomp $line;
		if (!length $line) {
			push @ranking, $calories;
			$calories = 0;
			next;
		}

		$calories += $line;
	}
	close $fh;

	my @sorted_ranking = sort { $b <=> $a } @ranking;

	return sum(@sorted_ranking[0 .. 2]);
}

#print part_1('data/example_in'), "\n";
#print part_1('data/in'), "\n";

#print part_2('data/example_in'), "\n";
#print part_2('data/in'), "\n";

1;
