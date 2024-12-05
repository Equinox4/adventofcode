#!/usr/bin/env perl

use strict;
use utf8;
use warnings;

use List::Util qw/ sum /;
use Data::Dumper;

my @part_numbers = (0);
my $schematic = [];

while (my $line = <DATA>)
{
	chomp $line;
	my $chars = [ split '', $line ];
	my $buffer = '';

	push @$schematic, [];
	foreach my $char (@$chars)
	{
		if ($char =~ m/\d/)
		{
			$buffer .= $char;
			next;
		}
		elsif (length $buffer)
		{
			push @{$schematic->[-1]}, $buffer;
			$buffer = '';
		}

		push @{$schematic->[-1]}, $char;
	}
}

for (my $l = 0; $l <= $#$schematic; $l++)
{
	for (my $c = 0; $c <= $#{$schematic->[$l]}; $c++)
	{
		if ($schematic->[$l]->[$c] !~ m/\d/)
		{
			next;
		}

		my $num = $schematic->[$l]->[$c];
		my $num_len = length $num;

		if ($l > 0)
		{
			for (my $i = $c; $i < $c + $num_len; $i++)
			{
				if ($schematic->[$l - 1]->[$i] =~ m/[^.]/)
				{
					push @part_numbers, $schematic->[$l]->[$c];
				}
			}
		}

#		if ($c > 0 && $schematic->[$l]->[$c - 1] =~ m/[^.]/ || $c < $#{$schematic->[$l]} && $schematic->[$l]->[$c + $num_len] =~ m/[^.]/)
#		{
#			push @part_numbers, $schematic->[$l]->[$c];
#		}
#
#		if ($l > 0 && $c > 0 && $schematic->[$l - 1]->[$c - 1] =~ m/[^.]/)
#		{
#			push @part_numbers, $schematic->[$l]->[$c];
#		}
	}
}

#for (my $i = 0; $i <= $#$schematic; $i++)
#{
#	for (my $j = 0; $j <= $#{$schematic->[$i]}; $j++)
#	{
#		if ($schematic->[$i]->[$j] !~ m/\d/)
#		{
#			next;
#		}
#
#		my $num = $schematic->[$i]->[$j];
#		my $num_len = length $num;
#
#		# horizontal
#		if ($j < $#{$schematic->[$i]} && $schematic->[$i]->[$j + 1] =~ m/[^.]/) {
#			push @part_numbers, $schematic->[$i]->[$j];
#		}
#
#		if ($j > 0 && $schematic->[$i]->[$j - 1] =~ m/[^.]/) {
#			push @part_numbers, $schematic->[$i]->[$j];
#		}
#
#		#diagonal
#		if ($j < $#{$schematic->[$i]} && $i > 0 && $schematic->[$i - 1]->[$j + length $schematic->[$i]->[$j]] =~ m/[^.]/)
#		{
#			push @part_numbers, $schematic->[$i]->[$j];
#		}
#
#		
#	}
#}

close DATA;
#print sum @part_numbers;
print Dumper $schematic;

__DATA__
467..114..
...*......
..35..633.
......#...
617*......
.....+.58.
..592.....
......755.
...$.*....
.664.598..
