
la:
for my $a ( 1 .. 997 ) {
    print "a = $a\n";
  lb:
    for my $b ( 1 .. 997 ) {
        next la if $a + $b >= 1000;
      lc:
        my $ap = $a**2;
        my $bp = $b**2;
        for my $c ( int sqrt( $ap + $bp ) .. 997 ) {
            next if $a + $b + $c > 1000;
            my $cp = $c**2;
            if ( $a + $b + $c == 1000 ) {
                if ( $ap + $bp == $cp ) {
                    print $a* $b * $c, "\n";
                    exit;
                }
            }
        }
    }
}
