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

clear

# Creada la carpeta en la raíz del disco. Para que funcione correctamente debes ser administrador por lo que deberias usar "sudo".
mkdir /IES

# Acceder a esta y crear las carpetas de alumno y profesor.
cd /IES
mkdir  Alumnos
mkdir Profesores

# Acceder a estas, crear las carpetas de los superiores y crear un fichero con infromacion de alumnos de cada una.
cd Alumnos
mkdir ASIR

#Se diferencia de "echo" en que respeta los caracteres de escape para añadir, por ejemplo, saltos de linea al archivo
printf "Nombre: Marta\nEdad: 20" > ASIR/marta.txt
printf "Nombre: Mario\nEdad:23" > ASIR/mario.txt

mkdir DAW
printf "Nombre: Pablo\nEdad: 26" > DAW/pablo.txt
printf "Nombre: Dani\nEdad: 19" > DAW/dani.txt

cd ../Profesores
mkdir ASIR
printf "Nombre: Elena\nClase: Bases de Datos" > ASIR/elena.txt
printf "Nombre: Marcos\nClase: Sistemas Informaticos" > ASIR/marcos.txt

mkdir DAW
printf "Nombre: Pascual\nClase: Lenguajes de MArcas" > DAW/pascual.txt
printf "Nombre: Jorge\nClase: Entornos de Desarrollo" > DAW/jorge.txt
