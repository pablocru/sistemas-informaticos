#!/bin/bash
#
# Script que genera la letra de un DNI o NIF introducido por el usuario.
#
# --------------------------------------------------------------------
# Author: Pablo Cru
# GitHub: https://github.com/pablocru
# --------------------------------------------------------------------

clear
echo

if [ $# -gt 0 ]; then
	num=$1
else
	echo Dime tu numero DNI
	read num
	echo
fi

case `expr $num % 23` in
	0) letra=T;;
	1) letra=R;;
	2) letra=W;;
	3) letra=A;;
	4) letra=G;;
	5) letra=M;;
	6) letra=T;;
	7) letra=Y;;
	8) letra=P;;
	9) letra=D;;
	10) letra=X;;
	11) letra=B;;
	12) letra=N;;
	13) letra=J;;
	14) letra=Z;;
	15) letra=S;;
	16) letra=Q;;
	17) letra=V;;
	18) letra=H;;
	19) letra=L;;
	20) letra=C;;
	21) letra=K;;
	22) letra=E;;
	*)
		echo Numero no valido
		exit 1
	;;
esac

nif=$num-$letra

echo Su nif es $nif
echo



