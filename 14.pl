
my %h = ( 1 => 0 );

sub calc;

sub calc {
    my $number = shift;
    my $next;

    if ( $number == 1 || exists $h{$number} ) {
        return;
    }

    if ( $number % 2 ) {
        $next = $number * 3 + 1;
    }
    else {
        $next = $number / 2;
    }
    if ( !exists $h{$next} ) {
        calc $next;
    }
    $h{$number} = $h{$next} + 1;
}

for ( 1 .. 1_000_000 ) {
    calc $_;
}
my $max = 0;
my $r   = 0;
for ( 1 .. 1_000_000 ) {
    if ( $h{$_} > $max ) {
        $max = $h{$_};
        $r   = $_;
    }
}
print "$r ($max)\n";
