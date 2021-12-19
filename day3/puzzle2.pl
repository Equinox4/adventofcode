use strict;
use warnings;

use Storable qw/ dclone /;
use Data::Dumper;

sub find_most_common_bit {
    my ($binary_numbers, $position) = @_;

    my $number_of_ones = 0;
    foreach my $binary_number (@$binary_numbers) {
        $number_of_ones++ if $binary_number->[$position] == 1;
    }

    return $number_of_ones >= $#$binary_numbers / 2 ? 1 : 0;
}

my $filename = 'input.txt';
open(my $fh, '<', $filename) or die 'Can\'t open $filename';

my $power_consumption;
my $o2_generator_rating;
my $co2_scrubber_rating;
my $diagnotic_report;

while (defined(my $binary_number = <$fh>)) {
    chomp $binary_number;
    push @$diagnotic_report, [split '', $binary_number];
}

close $fh;

my $o2_find = dclone $diagnotic_report;
my $co2_find;
my $pos = 0;

while ((scalar @$o2_find) > 1 && $pos < scalar @{ $o2_find->[0] }) {
    my $most_common_bit = find_most_common_bit($o2_find, $pos);
    foreach my $binary_number (@$o2_find) {
        print "DEBUG: ", $binary_number->[$pos], $most_common_bit, "\n";
        if ($binary_number->[$pos] != $most_common_bit) {
            splice @$o2_find, $pos, 1;
            print scalar @$o2_find, "\n";
        }
    }
    $pos++;
}


#print Dumper $o2_find;

__END__

print $o2_generator_rating, ';', $co2_scrubber_rating,, "\n";
print $o2_generator_rating * $co2_scrubber_rating, "\n"; # life support rating
