
my $max_prime = 1000;
my @primes = (0..$max_prime);
$primes[1]=0;
for (my $i=2; $i<$max_prime/2; ) {
	if ($primes[$i]) {
		for (my $j=$i*2; $j<=$max_prime; $j+=$i) {
			$primes[$j]=0;
		}
	}
	$i++;
}
@primes = grep { $_ } @primes;

sub factorize {
	my $num = shift;

	foreach (@primes) {
		if (!($num % $_)) {
			my $next = $num/$_;
			if ($next > 1) {
				return ($_, factorize($num/$_));
			} else {
				return $_;
			}
		}
	}

	return $num;
}

my %dividers;
for (2..20) {
	my %cnt;
	foreach my $d (factorize $_) {
		$cnt{$d}++;
	}
	foreach my $n (keys %cnt) {
		if (exists $dividers{$n}) {
			if ($dividers{$n} < $cnt{$n}) {
				$dividers{$n}=$cnt{$n};
			}
		} else {
			$dividers{$n}=$cnt{$n};
		}
	}
}

my $r = 1;
foreach (keys %dividers) {
	$r *= $_**$dividers{$_};
}

print "$r\n"
