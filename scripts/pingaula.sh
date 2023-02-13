#!/bin/bash
#
# Script que verifica los ordenadores del aula que estan encendidos y tienen comunicacion.
#
# ----------------------------------------------------------------------------------------
# Author: Pablo Cru
# GitHub: https://github.com/pabcrudel
# ----------------------------------------------------------------------------------------

clear
echo

echo -n "Dame el numero de PC inicial: "
read init
echo -n "Dame el numero de PC final: "
read fin

echo
echo Probando conectar con el aula 1, PC\'S desde $init hasta el $fin
echo

msg="El ordenador 10.2.1."

for i in `seq $init $fin`
do
	comand=`ping -c 1 10.2.1.$i`
	if [ $? -eq 0 ];then
	echo $msg$i esta en red
	else
	echo $msg$i NO se encuentra operativo
	fi
done
echo
