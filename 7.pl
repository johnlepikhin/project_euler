
my $max_prime = 1000000;
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

print "$primes[10000]\n";

