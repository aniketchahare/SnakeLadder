#!/bin/bash -x

positionOfPlayer1=0
positionOfPlayer2=0
end_Position=100
#diesCount=0

function getPosition() {
	position=$1
	diesValue=$((RANDOM%6+1))

#	((diesCount++))

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
	echo "$position"
}

read -p "Enter 1st player name:" player1
read -p "Enter 2nd player name:" player2

flag=1

while [[ $positionOfPlayer1 -lt $end_Position && $positionOfPlayer2 -lt $end_Position ]]
do
	if [ $flag -eq 1 ]
	then
		positionOfPlayer1=$(getPosition $positionOfPlayer1)
		flag=0
#		echo "position of player 1--> $positionOfPlayer1"
		if [ $positionOfPlayer1 -eq $end_Position ]
		then
				echo "Player 1 wins"
				exit
		fi
	else
		positionOfPlayer2=$(getPosition $positionOfPlayer2)
		flag=1
#		echo "position of player 2--> $positionOfPlayer2"
		if [ $positionOfPlayer2 -eq $end_Position ]
		then
				echo "Player 2 wins"
				exit
		fi
	fi
done

#echo "Number of time dies role--> $diesCount"
