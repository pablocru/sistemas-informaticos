#!/bin/bash
# Script que almacenar la ruta actual en una variable utilizando el comando pwd (present working directory),
# luego utilizar esa variable para cambiar a esa ruta en un momento posterior utilizando el comando cd (change directory).
#
#-------------------------------------
# Author: Pablo Cru
# Github: https://github.com/pablocru
#-------------------------------------

clear

# Almacenar la ruta actual en una variable
ruta_actual=$(pwd)

# Realizar algunas acciones
echo "Haciendo algo en otra ruta"
cd ./scripts
pwd

# Volver a la ruta original
cd $ruta_actual