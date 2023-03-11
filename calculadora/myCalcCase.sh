#!/bin/bash
# Script que lee 3 parametros:
# -Parametro 1: primer numero para la operacion.
# -Parametro 2: operador que decide que calculo realizar.
# -Parametro 3: segundo numero para la operacion.
# Utilizando un switch (case) cambia el tipo de operacion segun el operador.
#
# --------------------------------------------------------------------
# Author: Pablo Cru
# GitHub: https://github.com/pabcrudel
# --------------------------------------------------------------------

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
