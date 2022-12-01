use strict;
use warnings;

use Switch;

my $filename = 'input.txt';
open(my $fh, '<', $filename) or die 'Can\'t open $filename';

my $h_position = 0;
my $depth = 0;
while (defined(my $command = <$fh>)) {
    chomp $command;
    my ($direction, $units) = split ' ', $command;

    switch ($direction) {
        case 'forward' { $h_position += $units }
        case 'up'      { $depth -= $units }
        case 'down'    { $depth += $units }
        else           { next }
    }
}

close $fh;
print $h_position * $depth, "\n";
