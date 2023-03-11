#!/bin/bash
#
# Script que muestra un menu de opciones con diferentes scripts de linux a eleccion.
# Para terminar el script hay que introducir un 99.
#
# --------------------------------------------------------------------
# Author: Pablo Cru
# GitHub: https://github.com/pabcrudel
# --------------------------------------------------------------------

# *********************- Funciones -******************************
f_menu(){
	echo "----------------------------------"
	echo "Introduzca una opcion (99) para salir"
	echo 1 Para listar ficheros
	echo 2 Para listar permisos
	echo 3 Ver arbol
	echo 4 Ver ubicacion actual
	echo 5 Ver memoria
	echo 6 Ver info maquina
	echo
	echo 99 salir
	echo "----------------------------------"
}

f_switch(){
	case $opt in
		99) exit 0;;
		1) ls;;
		2) ls -l;;
		3) tree;;
		4) pwd;;
		5) free -h;;
		6) uname -a;;
		*) echo Operador no valido;;
	esac
}

# ***********************- Programa -*****************************
opt=$1

clear
while [ 0 ]; do
	# Mostrar el menu de opciones
	f_menu
	echo

	# Si no ha introducido una opcion se le pide al usuario
	if [ -z $opt ]; then
		read opt
	else
		echo $opt
	fi
	echo

	# Con un switch, se ejecuta un comando en funcion de la opcion
	f_switch
	echo

	# Se espera a la accion del usuario para repetir el programa hasta que introduzca un 99
	echo Pulse enter para continuar o introduce otra opcion.
	read opt
	clear
done
