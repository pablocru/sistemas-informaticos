#!/bin/bash

clear

user=`echo $1 | cut -c1-3`
group=`echo $1 | cut -c4-6`
others=`echo $1 | cut -c7-9`

perm=""
f_perm(){
	perm=$perm$1
}

for var in $user $group $others
do
	case $var in
		"rwx") f_perm 7;;
		"rw-") f_perm 6;;
		"r-x") f_perm 5;;
		"r--") f_perm 4;;
		"-wx") f_perm 3;;
		"-w-") f_perm 2;;
		"--x") f_perm 1;;
		"---") f_perm 0;;
		*)
		echo Permisos no validos
		echo
		exit 1
		;;
	esac
done

echo Los permisos en letras $1 corresponden a $perm en octal
echo
