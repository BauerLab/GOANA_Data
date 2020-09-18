#!/usr/bin/perl

# Extracts the flanking regions from around the cut site of either Cas9 or Cas12a targets
# built to work on the Kim datasets
# for Cas9: structure is 4bp 17bp CUT 3bp NGG 3bp
#       Extract the sequence (.{5})(.{4}G)G.{3}$ or ^.{3}C(C.{4})(.{5})
# for Cas12a: structure is 9bp TTTN 19bp CUT 4bp 3bp
#       Extract the sequence ^.{9}TTT.{15}(.{5})(.{5}) or (.{5})(.{5}).{15}AAA.{9}?

use strict;
use warnings;

my $input  = $ARGV[0];
my $flag   = $ARGV[1];
my $output = $ARGV[2];

open (OUTPUT, ">$output");
open (INPUT,  $input);
while (my $line = <INPUT>) {
    chomp $line;
    my @parts = split("\t", $line);
    my $up;
    my $down;

    if ($flag == 1) { # searching for Cas9 cuts
        if ($parts[1] =~ /(.{5})(.{4}G)G.{3}$/i) {
            $up   = $1;
            $down = $2;
        }
        elsif ($parts[1] =~ /^.{3}C(C.{4})(.{5})/i) {
            $up   = $1;
            $down = $2;
        }
    }

    elsif ($flag == 2) { # searching for Cas12a cuts
        if ($parts[1] =~ /^.{9}TTT.{15}(.{5})(.{5})/i) {
            $up   = $1;
            $down = $2;
        }
        elsif ($parts[1] =~ /(.{5})(.{5}).{15}AAA.{9}$/i) {
            $up   = $1;
            $down = $2;
        }
    }

    print OUTPUT "$parts[0]\t$parts[1]\t$up\t$down\n";
}
close OUTPUT;
close INPUT;

exit;