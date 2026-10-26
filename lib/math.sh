#!/bin/bash
# custom math library
# input format op1 operator op2
is_integer() {
    [[ "$1" =~ ^(0|-[1-9][0-9]*|[1-9][0-9]*)$ ]]
}

calculate_int (){
	local result=0

    if [[ "$1" == "not" ]]; then
        # Unary operator: not <operand>
        if [[ $# -ne 2 ]] || ! is_integer "$2"; then
            echo "operand: $2"
			echo "num: $#"
			return 1
        fi

        result=$(( ~$2 ))
		echo "$result"
		return

    else
        # Binary operator: <operand1> <operator> <operand2>
        if [[ $# -ne 3 ]] ||
           ! is_integer "$1" ||
           ! is_integer "$3"; then
            return 1
		else 
			operator="$2"
        fi
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
		pow)
			result=$(($1**$3))
			;;
		and)
			result=$(($1&$3))
			;;
		or)
			result=$(($1|$3))
			;;
		xor)
			result=$(($1^$3))
			;;
		*)
			echo "unknown operator"
			exit 1
			;;
	esac
	echo "$result"
}


