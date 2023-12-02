#!/usr/bin/env perl

use strict;
use utf8;
use warnings;

use List::Util qw/ sum /;

my @powers = (0);

open(my $fh, '<', 'input.txt') or die "$!";
while (my $line = <$fh>)
{
	chomp $line;
	my $toss_list = (split ': ', $line)[1];
	$toss_list = [split '; ', $toss_list];

	my $max = {
		red   => 0,
		green => 0,
		blue  => 0,
	};
	foreach my $toss (@$toss_list)
	{
		foreach my $cube (split ', ', $toss)
		{
			my ($num, $color) = split ' ', $cube;
			if ($num >  $max->{$color})
			{
				$max->{$color} = $num;
			}
		}
	}

	push @powers, $max->{'red'} * $max->{'green'} * $max->{'blue'};
}

close $fh;
print sum @powers;
