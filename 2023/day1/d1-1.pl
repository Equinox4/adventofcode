#!/usr/bin/env perl

use strict;
use utf8;
use warnings;

use List::Util qw/ sum /;

my @calibration_values = (0);

open(my $fh, "<", "input.txt") or die "$!";
while (my $line = <$fh>)
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

close $fh;
print sum @calibration_values;
