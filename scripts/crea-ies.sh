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

ies=$HOME/IES

rm -r $ies

clear

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

tree $ies
