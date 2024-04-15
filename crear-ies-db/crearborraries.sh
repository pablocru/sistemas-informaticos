#!/bin/bash
# Script que genera la carpeta del instituto con la siguiente informacion:
# - Una carpeta para alumnos y otro para profesores.
# - Una carpeta para cada superior dentro de estas.
# - 2 profesores y 2 alumnos por superior.
#
#-------------------------------------------------------------------------
# Author: Pablo Cru
# Github: https://github.com/pablocru
#-------------------------------------------------------------------------

# Muestra el menu de opciones del programa
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

# Sale del programa tras mostrar un mensaje por pantalla con el codigo 0: exito
f_salir() {
	echo
	echo "Gracias por emplear este programa"
	exit 0
	echo
}

# Muestra los creditos del programa
f_creditos() {
	echo
	echo "Script que genera la carpeta del instituto con la siguiente informacion:"
	echo "- Una carpeta para alumnos y otro para profesores."
	echo "- Una carpeta para cada superior dentro de estas."
	echo "- 2 profesores y 2 alumnos por superior."
	echo
	echo "------------------------------------------------------------------------"
	echo "Author: Pablo Cru"
	echo "Github: https://github.com/pablocru"
	echo "------------------------------------------------------------------------"
	echo
}

# Ejecuta la funcion del parametro 1 si la carpeta IES existe, sino, ejecuta la funcion del parametro 2.
ies=$HOME/IES
f_existeies() {
	if [ -d $ies ]; then
		$1
	else
		$2
	fi
}

# Borra la carpeta IES y sale del programa con el codigo 0: exito
f_borraries() {
	rm -r $ies && echo "Arbol borrado correctamente"
	echo
	exit 0
}
# La carpeta IES existe y no se puede borrar. Sale del programa con el codigo 2: no existe IES
f_errorborraries() {
	echo "Imposible borrar el arbol, no existe"
	echo
	exit 2
}

# Crea la carpeta IES, añade directorios y ficheros, y sale del programa con el codigo 0: exito
f_crearies() {
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
}
# Como ya existe la carpeta IES, no la crea. Sale del programa con el codigo 1: ya existe IES 
f_errorcrearies() {
	echo "Imposible crear el arbol, ya existe"
	echo
	exit 1
}

# Ejecuta una accion introducida por el usuario
f_switch() {
	case $opt in
		0) f_salir;;
		1) f_existeies f_errorcrearies f_crearies;;
		2) f_existeies f_borraries f_errorborraries;;
		3) f_creditos;;
		*) 
			echo
			echo Opcion no valida.
			echo
		;;
	esac
}

## Programa --------------------------------------------------------------------------------------------------
clear

# Si el usuario introduce una opcion por comando se ejecutara su accion correspondiente
opt=$1

# El bucle es infinito intencionadamente debido a: 
# - Las 3 primeras opciones salen del programa tras ejecutar su instruccion.
# - Las 2 ultimas opciones ejecutan su instruccion pero no salen del programa.
#	Esperan a que el usuario vuelva a solicitar una nueva opcion.
while [ 0 ]; do

	# El menu se muestra siempre para que el usuario vea que opcion ha introducido
	f_menu

	if [ -z $opt ]; then
		read opt
		f_switch
	else
		echo $opt
		f_switch
	fi

	# Tanto si se muestran los creditos como si se introduce una opcion no valida, se reinicia el programa
	echo Dale a enter para continuar o introduce una nueva opcion.
	read opt
	clear
done