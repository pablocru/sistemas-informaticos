#!/bin/bash
#
# Script de asistencia al borrado de archivos temporales o de texto.
# Crea una carpeta llamada "papelera" a donde enviara dichos archivos.
# El usuario puede interactuar con el programa hasta que salga introduciendo un 8.
# Errores:
#	1) No se ha podido crear la carpeta papelera.
#	2) No se ha podido mover los ficheros solicitados a la papelera.
#	3) No se ha podido vaciar la papelera.
#	4) No se ha podido borrar la carpeta papelera.
#
# --------------------------------------------------------------------
# Author: Pablo Cru
# GitHub: https://github.com/pablocru
# --------------------------------------------------------------------


# -------------- FUNCIONES ---------------

# Menu con las opciones del programa.
f_menu() {
	echo "/* ----------------------------------------------------- */"
	echo "			PAPELERA DE RECICLAJE			 "
	echo "/* ----------------------------------------------------- */"
	echo "1) Numero de archivos *.tmp en tu home			 "
	echo "2) Mover los *.tmp a la papelera				 "
	echo "3) Numero de archivos *.txt en tu home			 "
	echo "4) Mover todos los *.txt a la papelera 			 "
	echo "5) Listar el contenido de la papelera			 "
	echo "6) Borrar el contenido de la papelera			 "
	echo "7) Eliminar la carpeta de la papelera			 "
	echo "8) Salir							 "
	echo "/* ----------------------------------------------------- */"
}

# Muestra cuantos archivos hay con la extension que se le indique.
f_listar_extension() {
	echo "Archivos con la extension $1: $(find $HOME -name $1 | wc -l)"
	echo
}

# Para las siguientes funciones, muestra un mensaje segun si ha funcionado o no el comando.
f_mensaje_post_comando() {
	if [ $? -eq 0 ]; then
		echo $1
		echo
	else
		echo $2
		echo
		exit $3
	fi
}

# Ruta de la papelera.
papelera=$HOME/papelera

# Crea la papelera si no exite.
f_crear_papelera() {
	if [ ! -d $papelera ]; then
		echo No existe la papalera.
		echo Creando papelera....
		echo
		mkdir $papelera
		f_mensaje_post_comando "Papelera creada" "Error: No se puede crear" 1
	else
		echo Ya exite la papelera
		echo
	fi
}

# Mueve los archivos de la extension indicada a la papelera.
f_mover_a_papelera() {
	echo Moviendo los archivos $1 a la papelera...
	echo
	find $HOME -name $1 -exec mv -t $papelera {} +
	f_mensaje_post_comando "Movimiento completado" "Error: No se ha podido mover." 2
}

# Muestra los archivos que contiene la papelera.
f_listar_papelera() {
	ls -l $papelera
	echo
}

# Borra el contenido de la papelera.
f_vaciar_papelera() {
	echo Vaciando los archivos de la papelera...
	echo
	rm -r $papelera/*
	f_mensaje_post_comando "Vaciado completado" "Error: No se ha podido vaciar." 3
}

# Borra la carpeta de la papalera y su contenido.
f_borrar_papelera() {
	echo Borrando la papelera...
	echo
	rm -r $papelera
	f_mensaje_post_comando "Borrado completado" "Error: No se ha podido borrar." 4
}

# Las funciones anteriores necesitan que la papelera exita. Si no exite la creara primero.
f_existe_papelera() {
	lock=0
	while [ $lock -eq 0 ]; do
		if [ -d $papelera ]; then
			$1
			lock=1
		else
			f_crear_papelera
		fi
	done
}


# -------------- PROGRAMA ---------------

clear
echo

# Como es lo primero que ocurre, no quiero que los mensajes salgan al principio del programa.
f_crear_papelera > /dev/null

# Se guarda si el usuario mete una opcion por parametro.
opt=$1

# El bucle es infinito ya que el usuario puede seguir interactuando con el programa hasta que introduzca un 8.
while [ 0 ]; do
	f_menu
	echo

	if [ -z $opt ]; then
		read opt
	else
		echo $opt
	fi
	echo

	case $opt in
		1) f_listar_extension *.tmp;;
		2) f_existe_papelera "f_mover_a_papelera *.tmp";;
		3) f_listar_extension *.txt;;
		4) f_existe_papelera "f_mover_a_papelera *.txt";;
		5) f_existe_papelera f_listar_papelera;;
		6) f_existe_papelera f_vaciar_papelera;;
		7) f_existe_papelera f_borrar_papelera;;
		8)exit 0;;
		*)
		echo Opcion no valida.
		echo
		;;
	esac
	echo Pulsa enter o introduce otra opcion para continuar.
	read opt
	clear
	echo
done
