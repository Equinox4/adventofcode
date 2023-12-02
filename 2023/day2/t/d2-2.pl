#!/usr/bin/env perl

use strict;
use utf8;
use warnings;

use List::Util qw/ sum /;

my @powers = (0);

while (my $line = <DATA>)
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

close DATA;
print sum @powers;

__DATA__
Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
