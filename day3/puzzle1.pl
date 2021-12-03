use strict;
use warnings;

my $filename = 'input.txt';
open(my $fh, '<', $filename) or die 'Can\'t open $filename';

my $power_consumption;
my $gamma_rate = 0;
my $epsilon_rate = 0;
my @diagnotic_report = (0) x 12;

while (defined(my $binary_number = <$fh>)) {
    chomp $binary_number;

    my @bits = split '', $binary_number;
    foreach my $i (0 .. $#bits) {
        $diagnotic_report[$i] += $bits[$i]
    }
}

close $fh;

foreach my $sum (@diagnotic_report) {
    if ($sum >= 500) {
        $gamma_rate *= 2;
        $gamma_rate++;
        $epsilon_rate *= 2;
    }
    else {
        $epsilon_rate *= 2;
        $epsilon_rate++;
        $gamma_rate *= 2;
    }
}

print $gamma_rate, ';', $epsilon_rate, "\n";
print $gamma_rate * $epsilon_rate, "\n"; # power consumption
