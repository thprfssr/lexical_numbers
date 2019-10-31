#!/bin/perl

use strict;



# This function accepts an integer, and returns an array of integers. The
# given integer is basically split into its component parts so that it can be
# lexicalized later.
sub split_integer
{
	my $i = $_[0];
	my @a = ();
	if (0 <= $i and $i <= 19) {
		@a = ($i);
	} elsif (20 <= $i and $i <= 99) {
		# This is not a cast to int; this performs integer division.
		@a = (10 * int($i / 10), $i % 10);
	} elsif (100 <= $i and $i <= 999) {
		@a = (100 * int($i / 100), split_integer($i % 100));
	} else {
		print("Error in split_integer(): Range exceeded! Exiting...\n");
		exit(-1);
	}

	return @a;
}

# This function accepts a numeric string, assuming that the integer from which
# it was created was one of the elements returned by split_integer(). It splits
# the integer in such a way that it can be processed by the english_cardinal()
# function defined in the lexicalization.sh script.
sub split_numeric_string
{
	my $str = $_[0];

	my @a = ();
	if ($str =~ /[0-9]00/) {
		@a = (substr($str, 0, 1), "00");
	} else {
		@a = ($str);
	}

	return @a;
}

# This function accepts an integer, and returns an array of numeric strings
# which now need to be passed to english_cardinal().
sub get_integer_parts
{
	my $i = $_[0];
	my @a = split_integer($i);
	my @r = ();
	foreach (@a) {
		if ($_ == 0) {
			next;
		}

		my @z = split_numeric_string("" . $_);
		@r = (@r, @z);
	}

	return @r;
}

1;
