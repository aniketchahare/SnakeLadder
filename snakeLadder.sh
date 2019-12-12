#!/bin/bash -x

position=0

diesValue=$((RANDOM%6+1))

option=$((RANDOM%3))
case $option in
	0)
		position=$position
	;;
	1)
		position=$(($position+$diesValue))
	;;
	2)
		position=$(($position-$diesValue))
	;;
esac

echo "position--> $position"
