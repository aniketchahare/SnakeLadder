#!/bin/bash -x

position=0
end_Position=100

while [ $position -ne $end_Position ]
do
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
	if [[ $position -lt 0 || $position -gt $end_Position ]]
	then
		position=0
	fi
	echo "Position --> $position"
done
