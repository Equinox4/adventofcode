use strict;
use warnings;

my $filename = 'input.txt';
open(my $fh, "<", $filename) or die 'Can\'t open $filename';

my $count_of_increasing = 0;
my $previous_measurement = <$fh>;
while (my $current_measurement = <$fh>) {
    chomp $current_measurement;
    $count_of_increasing++ if $current_measurement > $previous_measurement;
    $previous_measurement = $current_measurement;
}

print $count_of_increasing, "\n";
