#!/bin/bash

clear

num1=$1
num2=$3
op=$2

f_res(){
	msg="La $1 de $num1 y $num2 da $2"
}

case $2 in
	mas) f_res suma `expr $1 + $3`;;
	men) f_res resta `expr $1 - $3`;;
	por) f_res multiplicacion `expr $1 \* $3`;;
	div) f_res division `expr $1 / $3`;;
	*)
	echo Operador no valido
	exit 1
	;;
esac

echo $msg
echo
