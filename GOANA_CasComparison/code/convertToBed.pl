#!/usr/bin/perl

use strict;
use warnings;

open (INPUT, $ARGV[0]);
open (OUTPUT, ">$ARGV[1]");

while (my $line = <INPUT>) {
    my @parts = split("\t",$line);
    my @bits = split(/\:|-/, $parts[0]);
    shift(@parts);
    print OUTPUT join("\t",@bits);
    print OUTPUT join("\t",@parts);
}
close INPUT;
close OUTPUT;

exit;