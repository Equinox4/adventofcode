#!/usr/bin/env perl

use strict;
use utf8;
use warnings;

use List::Util qw/ sum /;

my $configuration = {
	red   => 12,
	green => 13,
	blue  => 14,
};
my @possible_games = (0);
my $possible = 1;

while (my $line = <DATA>)
{
	chomp $line;
	my ($game_id, $toss_list) = split ': ', $line;
	$toss_list = [split '; ', $toss_list];

	foreach my $toss (@$toss_list)
	{
		foreach my $cube (split ', ', $toss)
		{
			my ($num, $color) = split ' ', $cube;
			if ($num >  $configuration->{$color})
			{
				$possible = 0;
			}
		}
	}

	if ($possible)
	{
		$game_id = (split ' ', $game_id)[1];
		push @possible_games, $game_id;
	}

	$possible = 1;
}

close DATA;
print sum @possible_games;

__DATA__
Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
