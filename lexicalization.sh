#!/bin/bash

function english_cardinal
{
	i=$1
	case $i in
		0)	str=zero;;
		1)	str=one;;
		2)	str=two;;
		3)	str=three;;
		4)	str=four;;
		5)	str=five;;
		6)	str=six;;
		7)	str=seven;;
		8)	str=eight;;
		9)	str=nine;;
		10)	str=ten;;
		11)	str=eleven;;
		12)	str=twelve;;
		13)	str=thirteen;;
		14)	str=fourteen;;
		15)	str=fifteen;;
		16)	str=sixteen;;
		17)	str=seventeen;;
		18)	str=eighteen;;
		19)	str=nineteen;;
		20)	str=twenty;;
		30)	str=thirty;;
		40)	str=forty;;
		50)	str=fifty;;
		60)	str=sixty;;
		70)	str=seventy;;
		80)	str=eighty;;
		90)	str=ninety;;
		00)	str=hundred;;
		000)	str=thousand;;
		000000)	str=million;;
		000000000)	str=million;;
		000000000000)	str=trillion;;
		*)
			echo "Error! Unrecognized pattern. Exiting..."
			exit -1
			;;
	esac

	echo $str
}

function english_ordinal
{
	i=$1
	case $i in
		0)	str=zeroth;;
		1)	str=first;;
		2)	str=second;;
		3)	str=third;;
		4)	str=fourth;;
		5)	str=fifth;;
		6)	str=sixth;;
		7)	str=seventh;;
		8)	str=eighth;;
		9)	str=ninth;;
		10)	str=tenth;;
		11)	str=eleventh;;
		12)	str=twelfth;;
		13)	str=thirteenth;;
		14)	str=fourteenth;;
		15)	str=fifteenth;;
		16)	str=sixteenth;;
		17)	str=seventeenth;;
		18)	str=eighteenth;;
		19)	str=nineteenth;;
		20)	str=twentieth;;
		30)	str=thirtieth;;
		40)	str=fourtieth;;
		50)	str=fiftieth;;
		60)	str=sixtieth;;
		70)	str=seventieth;;
		80)	str=eightieth;;
		90)	str=ninetieth;;
		00)	str=hundredth;;
		000)	str=thousandth;;
		000000)	str=millionth;;
		000000000)	str=billionth;;
		000000000000)	str=trillionth;;
		*)
			echo "Error! Unrecognized pattern. Exiting..."
			exit -1
			;;
	esac

	echo $str
}

function lexicalize
{
	i=$1
	src=./splitting.pl
	tmpfile=/tmp/alfjlajdflwoebc
	perl <<-EOF > $tmpfile
use strict;
require "$src";

my @a = get_integer_parts($i);
print "@a";
EOF
	a=$(cat $tmpfile)
	rm $tmpfile

	for e in ${a[*]}
	do
		echo $(english_cardinal $e)
	done
}
