#!/bin/bash
# Script que lee 3 parametros y realiza un calculo en funcion de estos:
# -Parametro 1: primer numero para la operacion.
# -Parametro 2: operador que decide que calculo realizar.
# -Parametro 3: segundo numero para la operacion.
# Aunque seria mas correcto usar un switch (case), en este caso se utiliza una
# estructura if-else para practicar lo dado en el temario.
# --------------------------------------------------------------------
# Author: Pablo Cru
# GitHub: https://github.com/pablocru
# --------------------------------------------------------------------

clear

if [ $2 == mas ]; then
	res=`expr $1 + $3`
	echo La suma de $1 y $3 da $res
elif [ $2 == men ]; then
	res=`expr $1 - $3`
	echo La resta de $1 y $3 da $res
elif [ $2 == mul ]; then
	res=`expr $1 \* $3`
	echo La multiplicación de $1 y $3 da $res
elif [ $2 == div ]; then
	res=`expr $1 / $3`
	echo La división de $1 y $3 da $res
else
	echo $2 no es un operador valido. Los validos son mas, men, mul, div.
fi
