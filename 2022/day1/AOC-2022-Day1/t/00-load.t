#!perl
use 5.32.1;
use strict;
use warnings FATAL => 'all';
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'AOC::2022::Day1' ) || print "Bail out!\n";
}

diag( "Testing AOC::2022::Day1 $AOC::2022::Day1::VERSION, Perl $], $^X" );
