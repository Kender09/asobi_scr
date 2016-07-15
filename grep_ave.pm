use strict;

my $hit_count = 0;
my $req_time = 0;
my $ups_time = 0;
my $run_time = 0;

my $str = '';

foreach my $file_name (@ARGV) {
	open(IN, $file_name);
	while (my $line = <IN>) {
		#grep部分
		if ($line =~ /activity\/timeline/) {
			$hit_count++;
			if ($line =~ /req_time:\d+.\d+/) {
				$str = $&;
				$str =~ s/req_time://g;
				$req_time += $str;
			}
			if ($line =~ /ups_time:\d+.\d+/) {
				$str = $&;
				$str =~ s/ups_time://g;
				$ups_time += $str;
			}
			if ($line =~ /run_time:\d+.\d+/) {
				$str = $&;
				$str =~ s/run_time://g;
				$run_time += $str;
			}
		}
	}
}

$req_time = $req_time / $hit_count;
$ups_time = $ups_time / $hit_count;
$run_time = $run_time / $hit_count;

print "HIT: $hit_count\nreq: $req_time\nups: $ups_time\nrun: $run_time\n"

