use strict;
use warnings;

use Switch;

my $filename = 'input.txt';
open(my $fh, '<', $filename) or die 'Can\'t open $filename';

my $h_position = 0;
my $depth = 0;
my $aim = 0;
while (defined(my $command = <$fh>)) {
    chomp $command;
    my ($direction, $units) = split ' ', $command;

    switch ($direction) {
        case 'forward' { $h_position += $units; $depth += ($aim * $units); }
        case 'up'      { $aim -= $units; }
        case 'down'    { $aim += $units; }
        else           { next }
    }
}

close $fh;
print $h_position * $depth, "\n";
