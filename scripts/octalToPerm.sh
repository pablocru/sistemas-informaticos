#!/bin/bash

clear

octal=$1
loop=0
while [ $loop -eq 0 ]; do
	if [ -z $octal ]; then
		echo
		read -p "Introduce permisos en octal: " octal
	fi

	if [[ $octal =~ ^([0-7]|[0-7][0-7]|[0-7][0-7][0-7])$ ]]; then
		loop=1
	else
		clear
		echo
		echo $octal no son permisos validos. Intenta otra vez.
		octal=""
		echo
	fi
done

if [ $octal -ge 0 ] && [ $octal -lt 10 ]; then
	user=0
	group=0
	others=$octal
elif [ $octal -lt 100 ]; then
	user=0
	group=`echo $octal | cut -c1`
	others=`echo $octal | cut -c2`
else
	user=`echo $octal | cut -c1`
	group=`echo $octal | cut -c2`
	others=`echo $octal | cut -c3`
fi

perm=""
f_perm(){
	perm=$perm$1
}

for var in $user $group $others
do
	case $var in
		7) f_perm "rwx";;
		6) f_perm "rw-";;
		5) f_perm "r-x";;
		4) f_perm "r--";;
		3) f_perm "-wx";;
		2) f_perm "-w-";;
		1) f_perm "--x";;
		0) f_perm "---";;
	esac
done

echo
echo Los permisos en octal $octal corresponden a $perm en letras
echo


