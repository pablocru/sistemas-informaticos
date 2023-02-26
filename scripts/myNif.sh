#!/bin/bash

clear

if [ -z $1 ]; then
	read -p "Dime tu numero de DNI (sin letra): " dni
	echo
else
	dni=$1
fi

letras=TRWAGMYFPDXBNJZSQVHLCKE

num=`expr $dni % 23 + 1`

nif=$dni`echo $letras | cut -c$num`

echo Su NIF es $nif
echo
