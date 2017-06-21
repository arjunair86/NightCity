function rand1 {
	RANGE=6
	number=$RANDOM
	let "number %= $RANGE"
}

ticks=(█)

declare -A matrix

for((i=0;i<50;i++)) do
	rand1
	matrix[$i]=$number
done

for((i=0;i<6;i++)) do
	for((j=0;j<50;j++)) do
		if [[ ${matrix[$j]} == 0 ]]
		then
			echo -n ${ticks[0]}
		else
			((matrix[$j]-=1))
			echo -ne " "	
		fi
	done
	echo -e "\r"
done
