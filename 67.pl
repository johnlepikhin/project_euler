
my @tri;
while (<>) {
    chomp;
    my @row = split /\s+/;
    push @tri, \@row;
}

for ( my $pos = $#tri - 1 ; $pos > -1 ; $pos-- ) {
    for my $i ( 0 .. @{ $tri[$pos] } - 1 ) {
        my $n1 = $tri[ $pos + 1 ][$i];
        my $n2 = $tri[ $pos + 1 ][ $i + 1 ];
        $tri[$pos][$i] += ( $n1 > $n2 ) ? $n1 : $n2;
    }
}
print "$tri[0][0]\n";

