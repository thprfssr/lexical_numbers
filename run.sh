#!/bin/bash

source lexicalization.sh

i=$1

if [ -z "$i" ]
then
	echo "Pass an integer as a parameter!"
	exit
fi

if [[ $i =~ ^[0-9]+$ ]]
then
	sleep 0s
else
	echo "Give me an INTEGER"
	exit
fi

if (( 1 <= $i && $i <= 999 ))
then
	a=$(lexicalize $1)
	echo $a
	exit
else
	echo "Enter a number between 1 and 999, inclusive."
	exit
fi
