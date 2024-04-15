#!/bin/bash
# Script que imprime lo que se introduce por consola.
#
# ---------------------------------------------------
# Autor: Pablo Cru
# Github: https://github.com/pablocru
# ---------------------------------------------------

clear
echo Introduce su nombre
read nombre

echo Introduce su/s apellido/s
echo Apellido 1: 
read apellido1

echo Apellido 2:
read apellido2

echo

echo Su nombre es: $nombre
echo Sus apellidos son: $apellido1 $apellido2