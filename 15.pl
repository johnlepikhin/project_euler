
my @m;

sub f;

sub f {
    my $x = shift;
    my $y = shift;
    if ( $x > $y ) {
        ( $x, $y ) = ( $y, $x );
    }
    if ( $x == 1 ) {
        return $y + 1;
    }
    if ( defined $m[$x] && defined $m[$x][$y] ) {
        return $m[$x][$y];
    }
    my $r = f( $x - 1, $y ) + f( $x, $y - 1 );
    $m[$x][$y] = $r;
    return $r;
}

print f( 20, 20 ), "\n";
