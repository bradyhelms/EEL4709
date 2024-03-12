#!/bin/perl

use warnings;
use strict;

my @matrixSize = (200, 400, 600, 800, 1000, 1200);

# system("gcc", "-O0", "-o", "matmu0", "matmul.c");
# system("./matmu0", "200", "200", "200");

for my $i (0..3) {

    print "------------------------------------------\n";
    print "Running matmu$i\n";
    print "------------------------------------------\n";

    system("gcc", "-O$i", "-o", "matmu$i", "matmul.c");

    foreach (@matrixSize) {
        print "Compiler Option -O$i, matrix size $_\n";
        system("./matmu$i", "$_", "$_", "$_");
    }

    print "------------------------------------------\n";
    print "Done\n";
    print "------------------------------------------\n";
}

for my $j (0..3) {
    print "Executable size for matmu$j";
    system("size", "matmu$j");


}
