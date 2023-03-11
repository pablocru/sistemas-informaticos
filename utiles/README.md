# Menú interactivo de opciones en Bash
Este script es un menú interactivo de opciones en Bash que muestra una lista de comandos que el usuario puede ejecutar.
Hay 3 versiones:

- V1: el programa hecho sin funciones.
- V2: el programa tiene cada acción en una función diferente.
- V3: el programa esta organizado de forma optima.  

La mejor versión es la 3, por como esta organizado el programa, y es la que se va a explicar a continuación. No obstante el contenido de las 3 versiones es el mismo. 

## Funciones

### Función `f_menu()`
```bash
f_menu(){
	echo "----------------------------------"
	echo "Introduzca una opción (99) para salir"
	echo 1 Para listar ficheros
	echo 2 Para listar permisos
	echo 3 Ver árbol
	echo 4 Ver ubicación actual
	echo 5 Ver memoria
	echo 6 Ver info máquina
	echo
	echo 99 salir
	echo "----------------------------------"
}
```
La función `f_menu` muestra el menú de opciones que el usuario puede seleccionar. Imprime una serie de mensajes en la salida estándar que muestran las diferentes opciones disponibles.
### Función `f_switch()`
```bash
f_switch(){
	case $opt in
		99) exit 0;;
		1) ls;;
		2) ls -l;;
		3) tree;;
		4) pwd;;
		5) free -h;;
		6) uname -a;;
		*) echo Operador no válido;;
	esac
}
```
La función `f_switch` contiene un switch que se encarga de ejecutar un comando en función de la opción seleccionada por el usuario. La variable `$opt` se utiliza para determinar qué comando se ejecutará.

## Programa
```bash
opt=$1

clear
while [ 0 ]; do
	# Mostrar el menú de opciones
	f_menu
	echo

	# Si no ha introducido una opción, se le pide al usuario
	if [ -z $opt ]; then
		read opt
	else
		echo $opt
	fi
	echo

	# Con un switch, se ejecuta un comando en función de la opción
	f_switch
	echo

	# Se espera a la acción del usuario para repetir el programa hasta que introduzca un 99
	echo Pulse enter para continuar o introduce otra opción.
	read opt
	clear
done
```
En la última parte del script, se inicializa la variable `$opt` con el primer argumento pasado al script. Luego, se ejecuta un ciclo `while` que muestra el menú de opciones, lee la opción seleccionada por el usuario, ejecuta el comando correspondiente y espera a que el usuario vuelva a seleccionar una opción. El ciclo se repite hasta que el usuario seleccione la opción "99", momento en el que el script finaliza.
