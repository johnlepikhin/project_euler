
my $max_prime = 1000;
my @primes    = ( 0 .. $max_prime );
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

sub divisors {
    my $number = shift;
    my %r;

    my @factors = factorize $number;

    my $aux;
    $aux = sub {
        my $product = shift;
        my $pos     = shift;
        for my $i ( $pos .. $#factors ) {
            my $new_product = $product * $factors[$i];
            next if $new_product >= $number;
            $r{$new_product} = 1;
            $aux->( $new_product, $i + 1 );
        }
    };

    $aux->( 1, 0 );

    $r{$_} = 1 for @factors;

    return 1, ( keys %r ), $number;
}

my $t = 0;
my $i = 0;
my @r;
do {
    @r = divisors $t += $i++;
} while @r <= 500;
print "$t\n";
