# Generar el NIF a partir del número de DNI
Este script permite generar el NIF (Número de Identificación Fiscal) a partir del número de DNI (Documento Nacional de Identidad) introducido por el usuario.

Hay 2 versiones, ambas permiten generar el NIF a partir del número de DNI, pero la versión 1 es más clara y fácil de entender.

## Diferencias entre versiones

| Version 1 | Version 2 |
|-----------|-----------|
| Utiliza comandos y utilidades de Unix más modernas y versátiles, como `cut`, que permiten hacer el script más compacto y fácil de entender. También utiliza el comando `read` con la opción `-p` para solicitar el número de DNI al usuario, lo que es más claro que el uso de `echo` y `read` en la versión 2. | El cálculo de la letra del NIF se hace mediante una estructura `case` que compara el resto de la división del número de DNI entre 23 con los posibles valores que puede tomar ese resto (0 a 22). Esta estructura es más complicada y menos legible que la simple búsqueda de la letra correspondiente en una cadena de letras, como se hace en la versión 1. |
| [saltar aquí](#version1) | [saltar aquí](#version2) |


<a id="version1"></a>
## Explicación del código versión 1
### Obtener el número de DNI
El primer paso del script es comprobar si se ha pasado el número de DNI como argumento al ejecutar el script o si es necesario pedírselo al usuario mediante la consola. Esto se hace con el siguiente código:
```bash
if [ -z $1 ]; then
	read -p "Dime tu numero de DNI (sin letra): " dni
	echo
else
	dni=$1
fi
```
Si el número de argumentos pasados al script es cero, se pide al usuario que introduzca su número de DNI, que se almacena en la variable `$dni`. Si, por el contrario, se ha pasado un argumento, se asigna a la variable `$dni` el valor del primer argumento pasado al script.

### Calcular la letra del NIF

A continuación, se define la cadena de letras que se utilizan para calcular la letra del NIF a partir del número de DNI:
```bash
letras=TRWAGMYFPDXBNJZSQVHLCKE
```
El siguiente paso es calcular el número correspondiente a la letra del NIF a partir del número de DNI. Esto se hace mediante el siguiente código:

```bash
num=`expr $dni % 23 + 1
```

Se obtiene el resto de la división del número de DNI entre 23 y se le suma 1 para obtener un número entre 1 y 23, que corresponde a la posición de la letra en la cadena definida anteriormente.

A continuación, se concatena el número de DNI con la letra correspondiente a la posición calculada anteriormente en la cadena de letras, mediante el siguiente código:
```bash
nif=$dni`echo $letras | cut -c$num`
```
El número de DNI se concatena con la letra correspondiente utilizando la utilidad `cut`, que extrae el caracter correspondiente a la posición calculada anteriormente en la cadena `$letras`.

### Mostrar el resultado

Por último, se muestra el resultado por pantalla, mediante el siguiente código:
```bash
echo Su NIF es $nif
echo
```
Se muestra el mensaje "Su NIF es " seguido del valor de la variable `$nif`, que contiene el número de DNI con la letra correspondiente del NIF. Además, se imprime una línea en blanco para separar el resultado del resto de la salida por pantalla.

<a id="version2"></a>
## Explicación del código versión 2

### Obtener el número de DNI del usuario
Comprueba si se ha proporcionado un argumento al ejecutar el script. Si se ha proporcionado, el número de DNI se almacena en la variable `num`. Si no se ha proporcionado, se solicita al usuario que introduzca el número de DNI y se almacena en la variable `num`. En ambos casos, se imprime una línea en blanco.
```bash
if [ $# -gt 0 ]; then
	num=$1
else
	echo Dime tu numero DNI
	read num
	echo
fi
```
### Calcular la letra correspondiente al número de DNI
La estructura `case` en este script toma el valor del número del DNI y lo divide por 23 para obtener el resto. Luego, se compara el resultado con los posibles valores que puede tomar ese resto (0 a 22). Dependiendo del valor del resto, se le asigna una letra correspondiente al número de DNI. Finalmente, se concatena el número del DNI y la letra correspondiente para formar el NIF.

Si el número de DNI es inválido (es decir, no se puede calcular la letra correspondiente), se imprime un mensaje de error y se sale del script con el código de error 1.
```bas
case `expr $num % 23` in
	0) letra=T;;
	1) letra=R;;
	2) letra=W;;
	3) letra=A;;
	4) letra=G;;
	5) letra=M;;
	6) letra=T;;
	7) letra=Y;;
	8) letra=P;;
	9) letra=D;;
	10) letra=X;;
	11) letra=B;;
	12) letra=N;;
	13) letra=J;;
	14) letra=Z;;
	15) letra=S;;
	16) letra=Q;;
	17) letra=V;;
	18) letra=H;;
	19) letra=L;;
	20) letra=C;;
	21) letra=K;;
	22) letra=E;;
	*)
		echo Numero no valido
		exit 1
	;;
esac
```
### Concatenar el DNI con la letra
Combina el número de DNI y la letra correspondiente para generar el NIF completo y lo imprime en pantalla.
```bash
nif=$num-$letra

echo Su nif es $nif
echo
```
