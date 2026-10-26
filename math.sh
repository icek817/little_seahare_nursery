#!/bin/bash
# custom math library
# input format [op1] [operator] [op2]
operator="$2"
result=0
calculate_int (){
	case "$operator" in
		+)
			result=$(($1+$3))
			;;
		-)
			result=$(($1-$3))
			;;
		x)
			result=$(($1*$3))
			;;
		/)
			if [ "$3" = "0" ]; then
				echo "zero divison error"
				exit 1
			else
				result=$(($1/$3))
			fi
			;;
		*)
			echo "unknown operator"
			exit 1
			;;
	esac
}


