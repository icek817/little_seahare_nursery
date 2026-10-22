#!/bin/bash
# custom math library
# input format op1 operator op2
is_integer() {
    [[ "$1" =~ ^(0|-[1-9][0-9]*|[1-9][0-9]*)$ ]]
}

calculate_int (){
	result=0
	operator="$2"
	if ! is_integer "$1" || ! is_integer "$3"; then
        
        exit 1
    fi
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
	echo "$result"
}


