#!/bin/bash
#
# Script que suma todos los parametros introducidos.
#
# --------------------------------------------------
# Author: Pablo Cru
# GitHub: https://github.com/pabcrudel
# --------------------------------------------------

clear
echo

if [ $# -eq 0 ]; then
	echo No hay parametros
	echo
	exit 1
fi

result=0
for i in $*
do
	result=`expr $result + $i`
done

echo La suma total es: $result
echo



