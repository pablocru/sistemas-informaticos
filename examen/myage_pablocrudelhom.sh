#!/bin/bash
#
# Script que lee una edad introducida por parametros. Si no se ha introducido, se pedira al usuario.
# En funcion de la edad retornará una frase personalizada.
# Errores:
# - Error 1: No se acepta mas de 1 parametro.
# - Error 2: No se aceptan edades en negativo.
# - Error 3: No se aceptan edades superiores a 98.
#
# --------------------------------------------------------------------
# Author: Pablo Cru
# GitHub: https://github.com/pablocru
# --------------------------------------------------------------------

clear
echo

edad=$1

if [ $# -gt 1 ]; then
	echo Error solamente se acepta un parámetro.
	echo
	exit 1
elif [ -z $edad ]; then
	read -p "¿Cual es tú edad?: " edad
	echo
fi

if [ $edad -lt 0 ]; then
	echo Error número negativo
	echo
	exit 2
elif [ $edad -lt 3 ]; then
	echo Eres un Bebe
elif [ $edad -lt 6 ]; then
	echo Estás en educación infantil
elif [ $edad -lt 16 ]; then
	echo Estás en la ESO
elif [ $edad -lt 18 ]; then
	echo Estás en Bachiller o vagueas
elif [ $edad -lt 25 ]; then
	echo Estás en la Universidad, trabajas o eres un NEME
elif [ $edad -lt 40 ]; then
	echo Estás en la flor de la vida
elif [ $edad -lt 55 ]; then
	echo Estás perdiendo la vista y el oído
elif [ $edad -lt 89 ]; then
	echo Eres un viejuno, apúntate al INSERSO
elif [ $edad -lt 99 ]; then
	echo Tic tac, tic tac, tic tac
else
	echo Error número muy alto
	echo
	exit 3
fi

echo
