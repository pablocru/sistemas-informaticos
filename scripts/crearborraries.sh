#!/bin/bash
# Script que genera la carpeta del instituto con la siguiente informacion:
# - Una carpeta para alumnos y otro para profesores.
# - Una carpeta para cada superior dentro de estas.
# - 2 profesores y 2 alumnos por superior.
#
#-------------------------------------------------------------------------
# Author: Pablo Cru
# Github: https://github.com/pabcrudel
#-------------------------------------------------------------------------

nombrescript=`echo $0 | cut -c3-`

f_menu() {
	echo
	echo "******************************************"
	echo "	    $nombrescript"
	echo "******************************************"
	echo "0) Para salir"
	echo "1) Para crear arbol"
	echo "2) Para borrar"
	echo "3) Creditos"
	echo "******************************************"
	echo
}

f_creditos() {
	echo
        echo "Script que genera la carpeta del instituto con la siguiente informacion:"
        echo "- Una carpeta para alumnos y otro para profesores."
        echo "- Una carpeta para cada superior dentro de estas."
        echo "- 2 profesores y 2 alumnos por superior."
        echo
        echo "------------------------------------------------------------------------"
        echo "Author: Pablo Cru"
        echo "Github: https://github.com/pabcrudel"
        echo "------------------------------------------------------------------------"
	echo
}

f_salir() {
	echo
	echo "Gracias por emplear este programa"
	echo
	exit 0
}

ies=$HOME/IES

f_borraries() {
	if [ -d $ies ]; then
		rm -r $ies && echo "Arbol borrado correctamente"
		echo
		exit 0
	else
		echo "Imposible borrar el arbol, no existe"
		echo
		exit 2
	fi
}
f_crearies() {
	if [ -d $ies ]; then
		echo "Imposible crear el arbol, ya existe"
		echo
		exit 1
	else
		alumn=$ies/Alumnos
		prof=$ies/Profesores

		mkdir -p $alumn/ASIR
		mkdir -p $alumn/DAW
		mkdir -p $prof/ASIR
		mkdir -p $prof/DAW

		# Alumnos Asir
		aluAsir=$alumn/ASIR
		echo -e "Nombre: Marta;\nEdad: 20;\nNota: 7;" > $aluAsir/marta.txt
		echo -e "Nombre: Mario;\n Edad:23;\nNota: 9;" > $aluAsir/mario.txt

		# Alumnos DAW
		aluDaw=$alumn/DAW
		echo -e "Nombre: Pablo;\nEdad: 26;\nNota: 8;" > $aluDaw/pablo.txt
		echo -e "Nombre: Dani;\nEdad: 19;\nNota: 10;" > $aluDaw/dani.txt

		# Profesores ASIR
		profAsir=$prof/ASIR
		echo -e "Nombre: Elena;\nClase: Info4;\nAsignatura: Base de Datos;" > $profAsir/elena.txt
		echo -e "Nombre: Marcos;\nClase: Info4;\nAsignatura: Sistemas;" > $profAsir/marcos.txt

		# Profesores DAW
		profDaw=$prof/DAW
		echo -e "Nombre: Pascual;\nClase: Info3;\nAsignatura: Lenguajes de Marcas;" > $profDaw/pascual.txt
		echo -e "Nombre: Jorge;\nClase: Info3;\nAsignatura: Entornos;" > $profDaw/jorge.txt

		echo "Arbol creado correctamente"
		tree $ies
		echo
		exit 0
	fi
}

clear

loop=0
while [ $loop ]; do
	loop=1

	f_menu
	read opt

	case $opt in
		0) f_salir;;
		1) f_crearies;;
		2) f_borraries;;
		3) f_creditos;;
	esac

	echo
	echo Dale a enter para continuar
	read
	clear
	loop=0
done
echo
