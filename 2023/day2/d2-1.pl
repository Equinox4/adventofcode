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

open(my $fh, '<', 'input.txt') or die "$!";
while (my $line = <$fh>)
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

close $fh;
print sum @possible_games;
