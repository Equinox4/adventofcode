#!/usr/bin/env perl

use strict;
use utf8;
use warnings;

use List::Util qw/ sum /;


my @llist;
my @rlist;
my @similarities;

open(my $fh, "<", "input.txt") or die "$!";
while (my $line = <$fh>)
{
    chomp $line;
    my ($lval, $rval) = split ' ', $line;

    push @llist, $lval;
    push @rlist, $rval,
}
close $fh;

foreach my $lval (@llist) {
    push @similarities, $lval * scalar(grep { $_ eq $lval } @rlist);
}

print sum @similarities;