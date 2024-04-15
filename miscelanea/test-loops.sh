#!/bin/bash
# Script para probar como se hacen los bucles.
#
# ---------------------------------------------
# Autor: Pablo Cru
# Github: https://github.com/pablocru
# ---------------------------------------------

clear
echo Dime un numero entre 0 y 10

lock=0
while [ "$lock" -eq 0 ]; do
    read numero

    if [ "$numero" -le 0 ] || [ "$numero" -gt 10 ];
    then
        echo No es valido, introduce otro numero
    else
        lock=1
    fi
done

echo
for ((i = 1 ; i <= $numero ; i++));
do
    echo "Hello $i"
done

echo