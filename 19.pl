
my $day   = 0;
my $year  = 1900;
my $month = 1;
my $cnt   = 0;

do {
    if ( $year > 1900 && $day % 7 == 6 ) {
        $cnt++;
    }
    if ( $month == 9 || $month == 4 || $month == 6 || $month == 11 ) {
        $day += 30;
    }
    elsif ( $month == 2 ) {
        if ( $year > 1900 && $year % 4 == 0 ) {
            $day += 29;
        }
        else {
            $day += 28;
        }
    }
    else {
        $day += 31;
    }

    if ( $month == 12 ) {
        $year++;
        $month = 1;
    }
    else {
        $month++;
    }
} while $year < 2001;

print "$cnt\n";
