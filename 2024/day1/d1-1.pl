#!/usr/bin/env perl

use strict;
use utf8;
use warnings;

use List::Util qw/ sum /;


my @llist;
my @rlist;
my @distances;

open(my $fh, "<", "input.txt") or die "$!";
while (my $line = <$fh>)
{
	chomp $line;
	my ($lval, $rval) = split ' ', $line;

	push @llist, $lval;
	push @rlist, $rval,
}
close $fh;

@llist = sort @llist;
@rlist = sort @rlist;

for (my $i = 0; $i <= $#rlist; $i++) {
	push @distances, abs $llist[$i] - $rlist[$i];
}

print sum @distances;