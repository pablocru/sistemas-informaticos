#!/bin/bash
#
# Script que ayuda a la creacion de un usuario en linux.
#
# --------------------------------------------------------------------
# Author: Pablo Cru
# GitHub: https://github.com/pabcrudel
# --------------------------------------------------------------------

clear
echo

echo Bienvenido, vamos a crear un usuario
echo
read -p "Introduzca el nombre de usuario: " userName
echo
read -p "Indique a que grupo se añadira el usuario: " groupName
echo
read -p "Diga la carpeta home para el nuevo usuario: /home/" userFolder
echo
read -p "Proporcione el interprete de comandos que usara este usuario: /bin/" userShell
echo

if [ -z `grep -w ^$groupName /etc/group` ]; then
	groupadd $groupName
fi

useradd $userName -d /home/$userFolder -g $groupName -s /bin/$userShell -m

if [ $? -eq 0 ]; then
	echo Usuario creado correctamente
	echo
	read -p "Quieres ponerle una contraseña (y/n) " crearPasswd
	if [ $crearPasswd = "y" ]; then
		passwd $userName
	fi
	echo
	exit 0
else
	echo Fallo desconocido al crear el usuario
	echo
	exit 1
fi


