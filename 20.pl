
use bignum;

my $f = 1;
$f *= $_ for ( 2 .. 100 );
my $s = 0;
$s += $_ for split //, $f;
print "$s\n";
