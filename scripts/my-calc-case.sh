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

echo
case $2 in
	"mas")
		res=`expr $1 + $3`
	        echo La suma de $1 y $3 da $res;;
	"men")
		res=`expr $1 - $3`
	        echo La resta de $1 y $3 da $res;;
	"mul")
		res=`expr $1 \* $3`
	        echo La multiplicación de $1 y $3 da $res;;
	"div")
		res=`expr $1 / $3`
	        echo La división de $1 y $3 da $res;;
	*)
		echo $2 no es un operador valido. Los validos son mas, men, mul, div.;;
esac
echo
