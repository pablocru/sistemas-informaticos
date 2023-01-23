#!/bin/bash
# Script que imprime lo que se introduce por consola.
#Utiliza modificadores en el comando "echo"
#
# ---------------------------------------------------
# Autor: Pablo Cru
# Github: https://github.com/pabcrudel
# ---------------------------------------------------

clear
echo -n "Introduce su nombre: "
read nombre

echo Introduce su/s apellido/s
echo -n "Apellido 1: "
read apellido1

echo -n "Apellido 2: "
read apellido2

echo

echo Su nombre es: $nombre
echo Sus apellidos son: $apellido1 $apellido2