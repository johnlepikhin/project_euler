
sub is_palindrome {
    for ( 0 .. int( ( length $_[0] ) / 2 ) ) {
        if (
            substr( $_[0], $_, 1 ) ne
            substr( $_[0], length( $_[0] ) - $_ - 1, 1 ) )
        {
            return 0;
        }
    }
    return 1;
}

my $max = 0;

sub add {
    $max = $_[0] if $_[0] > $max;
}

lv1:
for ( my $v1 = 999 ; $v1 > 10 ; $v1-- ) {
    if ( $v1 * 999 < $max ) {
        last;
    }
    for ( my $v2 = 999 ; $v2 > 10 ; $v2-- ) {
        my $n = $v1 * $v2;
        if ( is_palindrome $n) {
            add $n;
        }
    }
}

print "$max\n";
