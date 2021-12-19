use strict;
use warnings;

my $filename = 'input.txt';
open(my $fh, '<', $filename) or die 'Can\'t open $filename';

my $power_consumption;
my $gamma_rate = 0;
my $epsilon_rate = 0;
my @diagnotic_report = (0) x 12; # We know that all the binary numbers in this file have 12 bits

while (defined(my $binary_number = <$fh>)) {
    chomp $binary_number;

    my @bits = split '', $binary_number;
    foreach my $i (0 .. $#bits) {
        $diagnotic_report[$i] += $bits[$i]
    }
}

close $fh;

foreach my $sum (@diagnotic_report) {
    if ($sum >= 500) { # the file contains 1000 lines
        $gamma_rate *= 2;
        $gamma_rate++;
    }
    else {
        $gamma_rate *= 2;
    }
}

$epsilon_rate = $gamma_rate ^ 4095; # 0b111111111111

print $gamma_rate, ';', $epsilon_rate, "\n";
print $gamma_rate * $epsilon_rate, "\n"; # power consumption
