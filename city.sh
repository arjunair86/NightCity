no_of_builds=$1
height_of_builds=$2

function rand_heights {
	RANGE=$height_of_builds
	number=$RANDOM
	let "number %= $RANGE"
}

function rand_ticks {
	RANGE=3
	number2=$RANDOM
	let "number2 %= $RANGE"
}

function rand_sky {
	RANGE=6
	number3=$RANDOM
	let "number3 %= $RANGE"
}

ticks=(█ ▓ ▒ ║)
sky=("*" " " " " " " " " " ")

declare -A matrix
declare -A flag

for((i=0;i<$no_of_builds;i++)) 
do
	rand_heights
	matrix[$i]=$number
	flag[$i]=0
done

for((i=0;i<$height_of_builds;i++)) 
do
	for((j=0;j<$no_of_builds;j++)) 
	do
		if [[ ${matrix[$j]} == 0 ]]
		then
			if [[ ${flag[$j]} == 1 ]]
			then
				rand_ticks
				echo -n "${ticks[$number2]}"
			else
				flag[$j]=1
				echo -n "${ticks[3]}"
			fi
		else
			((matrix[$j]-=1))
			rand_sky
			echo -ne "${sky[$number3]}"
		fi
	done
	echo -e "\r"
done
