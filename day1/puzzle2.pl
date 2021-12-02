use strict;
use warnings;

use List::Util qw/ sum /;
use constant WINDOW_SIZE => 3;

my $filename = 'data/input.txt';
open(my $fh, '<', $filename) or die 'Can\'t open $filename';

my $count_of_increasing = 0;
my @current_window;

# here we assume that the input file contains more than three lines
# filling window
for (1 .. WINDOW_SIZE) {
    my $current_measurement = <$fh>;
    chomp $current_measurement;
    push @current_window, $current_measurement;
}

my $sum_of_previous_window = sum @current_window;

while (defined(my $current_measurement = <$fh>)) {
    chomp $current_measurement;

# sliding window
    shift @current_window;
    push @current_window, $current_measurement;

    my $sum_of_current_window = sum @current_window;
    $count_of_increasing++ if $sum_of_current_window > $sum_of_previous_window;
    $sum_of_previous_window = $sum_of_current_window;
}

close $fh;
print $count_of_increasing, "\n";
