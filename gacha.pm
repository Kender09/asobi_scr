use strict;
use warnings;
use utf8;

sub unique_slice{
    my @array = @_;
    my %hash;
    @hash{@array} = ();
    return keys %hash;
}

sub base_conv{
	(my $num, my $tobase) = @_;
	my $to_num = 0;
	my $base = 1;

	while (int($num)>0) {
    	$to_num = $to_num + ( $num % $tobase ) * $base;
    	$num = $num / $tobase;
    	$base = $base * 10;
  	}
	return $to_num;
}

sub pad_zero{
	(my $str, my $length) = @_;
	if (length($str) == int($length)) {
		return $str;
	}
	&pad_zero("0".$str, $length);
}

sub str_replace{
	(my $str, my @to_map) = @_;
	for (my $i = 0; $i < $#to_map+1; $i++) {
		$str =~ s/$i/$to_map[$i]/g;
	}
	return $str;
}

my @bot_nums = (':zero:', ':one:', ':two:', ':three:', ':four:', ':five:', ':six:', ':seven:', ':eight:', ':nine:');
my @use_bot_nums;

my $size = $ARGV[0];
my $nums = $ARGV[1];

my $out_str;

my @use_nums = grep(/[0-9]/, split('', $nums));
@use_nums = &unique_slice(@use_nums);

foreach my $ele (@use_nums) {
	push(@use_bot_nums, $bot_nums[int $ele]);
}

for (my $i = 0; $i < ($#use_nums+1) ** (int $size); $i++) {
	$out_str = &pad_zero(&base_conv($i, $#use_nums+1), $size);
	print &str_replace($out_str, @use_bot_nums). "\n";
}

