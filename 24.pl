
use strict;
use warnings;

sub permute (&@) {
    my $code = shift;
    my @idx  = 0 .. $#_;
    while ( $code->( @_[@idx] ) ) {
        my $p = $#idx;
        --$p while $idx[ $p - 1 ] > $idx[$p];
        my $q = $p or return;
        push @idx, reverse splice @idx, $p;
        ++$q while $idx[ $p - 1 ] > $idx[$q];
        @idx[ $p - 1, $q ] = @idx[ $q, $p - 1 ];
    }
}

my $cnt = 1;
permute {
    if ( $cnt == 1_000_000 ) {
        print( join( q{}, @_ ), "\n" );
        exit;
    }
    $cnt++;
}
0 .. 9;
