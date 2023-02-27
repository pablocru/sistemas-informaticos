#!/bin/bash
# Script que da un mensaje acorde a la nota introducida.
# - La nota se puede introducir por parametros o esperar a ser preguntado por el programa.
# - Si la nota no es valida saca un mensaje de error.
#
# --------------------------------------------------------------------
# Author: Pablo Cru
# GitHub: https://github.com/pabcrudel
# --------------------------------------------------------------------

clear
echo

if [ $# -gt 0 ]; then
	nota=$1
else
	echo "Por favor, introduzca su nota" 
	read nota
fi

echo

case $nota in
	[0-4])
		echo "****************************"
	        echo Oh, su nota es INSUFICIENTE
		echo "****************************"
	;;
	5)
		echo "***********************************"
	        echo Enhorabuena, su nota es SUFICIENTE
		echo "***********************************"
	;;
	6)
		echo "*****************************"
		echo Enhorabuena, su nota es BIEN
		echo "*****************************"
	;;
	7|8)
		echo "********************************"
	        echo Enhorabuena, su nota es NOTABLE
		echo "********************************"
	;;
	9|10)
		echo "**************************************"
		echo Enhorabuena, su nota es SOBRESALIENTE
		echo "**************************************"
	;;
	*)
		echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
		echo ERROR Nota no válida. USO $0 [0-10]
		echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
	;;
esac
echo

