#!/usr/bin/env perl

use strict;
use warnings;

use List::Util qw/ sum /;


my @calibration_values = (0);
while (my $line = <DATA>)
{
	my @matches = ($line =~ /\d/g);
	if (not @matches)
	{
		next;
	}

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
1abc2
pqr3stu8vwx
a1b2c3d4e5f
treb7uchet
