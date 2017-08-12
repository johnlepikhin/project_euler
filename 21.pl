
use List::Util;

my $max_prime = 10000;
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

    $r{$_}      = 1 for @factors;
    $r{$number} = 1;
    $r{1}       = 1;

    return ( keys %r );
}

sub sum_divisors {
    my $number = shift;

    if ( $number > 1 ) {
        return ( List::Util::reduce { $a + $b } ( divisors $number) ) - $number;
    }
    return 1;
}

sub amicable {
    my $number = shift;

    my $s = sum_divisors $number;
    if ( $s == $number ) {
        return undef;
    }
    if ( sum_divisors($s) == $number ) {
        return $s;
    }

    return undef;
}

my %found;
for ( 1 .. 10000 - 1 ) {
    if ( !exists $found{$_} ) {
        my $p = amicable $_;
        if ( defined $p ) {
            $found{$_} = 1;
            $found{$p} = 1;
        }
    }
}

print List::Util::reduce { $a + $b } ( keys %found );
print "\n";
