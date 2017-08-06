
my $max_prime = 2_000_000;
my @primes    = ( 0 .. $max_prime - 1 );
$primes[1] = 0;
for ( my $i = 2 ; $i < $max_prime / 2 ; ) {
    if ( $primes[$i] ) {
        for ( my $j = $i * 2 ; $j <= $max_prime ; $j += $i ) {
            $primes[$j] = 0;
        }
    }
    $i++;
}
@primes = grep { $_ } @primes;

sub factorize {
    my $num = shift;

    foreach (@primes) {
        if ( !( $num % $_ ) ) {
            my $next = $num / $_;
            if ( $next > 1 ) {
                return ( $_, factorize( $num / $_ ) );
            }
            else {
                return $_;
            }
        }
    }

    return $num;
}

my $number = 600_851_475_143;

my @factors = factorize($number);
print "@factors\n";
