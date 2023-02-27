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

f_opciones(){
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
}
f_listar_ficheros(){
	ls
}
f_listar_ficheros_detallados(){
	ls -l
}
f_ver_arbol(){
	tree
}
f_ver_ubicacion(){
	pwd
}
f_ver_memoria(){
	free -h
}
f_ver_info_maquina(){
	uname -a
}
f_salir(){
	exit
}
f_error(){
	echo "Opcion no valida. Vuelve a intentarlo..."
}
f_reiniciar_programa(){
	echo
        echo Dale a enter para continuar
        read
        clear
        opcion=0
}

while [ $opcion -ne 99 ]; do

	f_opciones
	case $opcion in
		1) f_listar_ficheros;;
		2) f_listar_ficheros_detallados;;
		3) f_ver_arbol;;
		4) f_ver_ubicacion;;
		5) f_ver_memoria;;
		6) f_ver_info_maquina;;
		99) f_salir;;
		*) f_error;;
	esac

	f_reiniciar_programa

done
echo
