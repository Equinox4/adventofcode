#!/usr/bin/env perl

use strict;
use warnings;

use List::Util qw/ sum /;
use Data::Dumper;


my $translate_digits = {
	one   => 1,
	two   => 2,
	three => 3,
	four  => 4,
	five  => 5,
	six   => 6,
	seven => 7,
	eight => 8,
	nine  => 9,
	1 => 1,
	2 => 2,
	3 => 3,
	4 => 4,
	5 => 5,
	6 => 6,
	7 => 7,
	8 => 8,
	9 => 9,
};
my @calibration_values = (0);
while (my $line = <DATA>)
{
	my @matches = ($line =~ /(?=(one|two|three|four|five|six|seven|eight|nine|\d))/g);
	if (not @matches)
	{
		next;
	}

	@matches = map { $translate_digits->{$_} } @matches;

	my $calibration_value = shift @matches;

	if (not @matches)
	{
		$calibration_value .= $calibration_value;
	}
	else
	{
		$calibration_value .= pop @matches;
	}

	push @calibration_values, $calibration_value;
}

close DATA;
print sum @calibration_values;

__DATA__
two1nine
eightwothree
abcone2threexyz
xtwone3four
4nineeightseven2
zoneight234
7pqrstsixteen
