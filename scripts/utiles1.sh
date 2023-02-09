#!/bin/bash
#
# Script que muestra un menu de opciones con diferentes scripts de linux a eleccion.
# Para terminar el script hay que introducir un 99.
#
# --------------------------------------------------------------------
# Author: Pablo Cru
# GitHub: https://github.com/pabcrudel
# --------------------------------------------------------------------

clear

opcion=0

while [ $opcion -ne 99 ]; do
	echo
	echo "------------------------------"
	echo "Introduce una opcion (99 salir)"
	echo "1 Para listar ficheros"
	echo "2 Para listar permisos"
	echo "3 Ver arbol"
	echo "4 Para ver la ruta de tu ubicacion"
	echo "5 Ver memoria"
	echo "6 Ver info maquina"
	echo "------------------------------"
	read opcion
	echo

	case $opcion in
		1) ls
		;;
		2) ls -l
		;;
		3) tree
		;;
		4) pwd
		;;
		5) free -h
		;;
		6) uname -a
		;;
		99) exit
		;;
		*) echo "Opcion no valida. Vuelve a intentarlo..."
		;;
	esac

	echo
	echo Dale a enter para continuar
	read
	clear
	opcion=0

done
echo
