#!/bin/bash
# Script que imprime los 2 primeros parametros.
#
# ---------------------------------------------
# Autor: Pablo Cru
# Github: https://github.com/pabcrudel
# ---------------------------------------------

nombre=$1
apellido1=$2
apellido2=$3

clear
echo Su nombre es: $nombre
echo Sus apellidos son: $apellido1 $apellido2
echo Su nombre completo es: $*
echo El numero de parametros introducidos es: $#