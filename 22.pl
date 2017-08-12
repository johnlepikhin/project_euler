
my @names = sort map { s/"//g; $_ } ( split /,/, <> );

my $sum = 0;
for my $pos ( 0 .. @names - 1 ) {
    foreach ( split //, $names[$pos] ) {
        $sum += ( $pos + 1 ) * ( ord($_) - 64 );
    }
}
print "$sum\n";
