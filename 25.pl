
use bignum;

my $n1 = 1;
my $n2 = 1;
my $i  = 2;
while (1) {
    ( $n1, $n2 ) = ( $n2, $n1 + $n2 );
    $i++;
    if ( 1000 == length($n2) ) {
        print "$i\n";
        exit;
    }
}
