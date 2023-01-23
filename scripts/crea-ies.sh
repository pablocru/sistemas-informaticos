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

mkdir /IES

cd IES
mkdir  Alumnos
mkdir Profesores

cd Alumnos
mkdir ASIR
echo "Nombre: Marta; Edad: 20" > ASIR/marta.txt
echo "Nombre: Mario; Edad:23" > ASIR/mario.txt

mkdir DAW
echo "Nombre: Pablo; Edad: 26" > DAW/pablo.txt
echo "Nombre: Dani; Edad: 19" > DAW/dani.txt

cd ../Profesores
mkdir ASIR
echo "Nombre: Elena; Clase: Info4" > ASIR/elena.txt
echo "Nombre: Marcos; Clase: Info4" > ASIR/marcos.txt

mkdir DAW
echo "Nombre: Pascual; Clase: Info3" > DAW/pascual.txt
echo "Nombre: Jorge; Clase: Info3" > DAW/jorge.txt

cd ../..




