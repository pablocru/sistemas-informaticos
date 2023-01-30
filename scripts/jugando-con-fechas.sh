#!/bin/bash
# Este scrip pregunta por el dia y el año.
# Si coincide con "lunes" y "2023" te felicita.
# En caso contrario da error.
# ---------------------------------------------
# Autor: Pablo Cru
# Github: https://github.com/pabcrudel
#----------------------------------------------

clear

read -p "¿Que dia es hoy? (en letras) " dia

read -p "¿En que año estamos? " anyo

if [ $dia = `date +%A` ] && [ $anyo -eq `date +%Y` ]; then
 echo "Enhorabuena!"
 else
 echo "Error!"
fi
