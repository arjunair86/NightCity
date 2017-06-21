function rand {
	RANGE=6
	number=$RANDOM
	let "number %= $RANGE"
}

function rand2 {
	RANGE=3
	number2=$RANDOM
	let "number2 %= $RANGE"
}

ticks=(█ ▓ ▒ ║)

declare -A matrix
declare -A flag

for((i=0;i<50;i++)) do
	rand
	matrix[$i]=$number
	flag[$i]=0
done

for((i=0;i<6;i++)) do
	for((j=0;j<50;j++)) do
		if [[ ${matrix[$j]} == 0 ]]
		then
			if [[ ${flag[$j]} == 1 ]]
			then
				rand2
				echo -n ${ticks[$number2]}
			else
				flag[$j]=1
				echo -n ${ticks[3]}
			fi
		else
			((matrix[$j]-=1))
			echo -ne " "	
		fi
	done
	echo -e "\r"
done
