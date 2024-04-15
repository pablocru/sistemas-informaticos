#!/bin/bash
# Script que imprime lo que se introduce por consola.
# Utiliza modificadores en el comando "read"
#
# ---------------------------------------------------
# Autor: Pablo Cru
# Github: https://github.com/pablocru
# ---------------------------------------------------

clear
read -p "Introduce su nombre: " nombre

echo Introduce su/s apellido/s
read -p "Apellido 1: " apellido1
read -p "Apellido 2: " apellido2

echo

echo Su nombre es: $nombre
echo Sus apellidos son: $apellido1 $apellido2