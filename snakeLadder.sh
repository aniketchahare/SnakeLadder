#!/bin/bash -x

position=0
end_Position=100

while [ $position -lt $end_Position ]
do
	diesValue=$((RANDOM%6+1))
#	extraWinValue=$(($position+$diesValue))

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

	if [ $position -lt 0 ]
	then
		position=0
	elif [ $position -gt $end_Position ]
	then
		position=$(($position-$diesValue))
	fi
	echo "Position --> $position"
done
