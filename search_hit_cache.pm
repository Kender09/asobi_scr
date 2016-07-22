use strict;

my %req_uris = ();

foreach my $file_name (@ARGV) {
	open(IN, $file_name);
	while (my $line = <IN>) {
		if ($line =~ /c /) {
			if (exists $req_uris{$'}) {
				$req_uris{$'} = $req_uris{$'} + 1;
			} else {
				$req_uris{$'} = 1;
			}
		}
	}
}

foreach ( sort { $req_uris{$a} <=> $req_uris{$b} } keys %req_uris ) {
	if ($req_uris{$_} > 1) {
		my $out_str = substr($_, 0, -1);
		print "$out_str : $req_uris{$_}\n";
	}
}

