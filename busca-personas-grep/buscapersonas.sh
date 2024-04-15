#!/bin/bash
#
# Lee el archivo "personas.dat" y muestra la lista de personas completa. Luego, el usuario podra hacer 3 acciones:
# - Mostrar las personas llamadas "Marcos"
# - Mostrar las personas casadas
# - Almacenar en un fichero (datos.txt) los profesores y las personas con 38 años
#
# --------------------------------------------------------------------
# Author: Pablo Cru
# GitHub: https://github.com/pablocru
# --------------------------------------------------------------------

clear
echo

cat personas.dat
echo

read

grep "Marcos" personas.dat
echo

read

grep "SI" personas.dat
echo

read

firstLine="------------------------------"
fileName="datos.txt"

echo $firstLine > $fileName
echo "Profesores tenemos:" >> $fileName
echo >> $fileName
grep "Profesor" personas.dat >> $fileName

echo $firstLine >> $fileName
echo "Personas con 38 años tenemos:" >> $fileName
echo >> $fileName
grep "38" personas.dat >> $fileName

cat $fileName
echo



