#!/bin/bash
#
# Script que pasa una secuencia de permisos de formato Letra a Octal
#
# --------------------------------------------------------------------
# Author: Pablo Cru
# GitHub: https://github.com/pabcrudel
# --------------------------------------------------------------------

clear
echo

propi=`echo $1 | cut -c1-3`
grupo=`echo $1 | cut -c4-6`
otros=`echo $1 | cut -c7-9`

perm=""
for var in $propi $grupo $otros
do
	case $var in
		"rwx") perm=$perm"7";;
		"rw-") perm=$perm"6";;
		"r-x") perm=$perm"5";;
		"r--") perm=$perm"4";;
		"-wx") perm=$perm"3";;
		"-w-") perm=$perm"2";;
		"--x") perm=$perm"1";;
		"---") perm=$perm"0";;
	esac
done
echo Los permisos en letras $1 corresponden a $perm en octal
echo

