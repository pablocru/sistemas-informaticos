# Calculadora de operaciones matemáticas básicas (+, -, *, /)
Este programa realiza un calculo básico según los parámetros introducidos por el usuario:
- Parámetro 1: primer numero para la operación.
- Parámetro 2: operador que decide que calculo realizar.
- Parámetro 3: segundo numero para la operación.

## Como realizar el calculo
Se utiliza el comando `expr` para realiza el calculo entre los dos argumentos que se pasan al script. 

Por ejemplo: `expr $1 + $3`.

-   `expr`: es un comando de Unix que evalúa una expresión y muestra su resultado en la salida estándar. En este caso, se utiliza para realizar la operación aritmética de suma.
-   `$1`: es una variable especial en Bash que se refiere al primer argumento que se pasa al script. En esta línea, `$1` se utiliza como el primer número en la operación de suma.
-   `+`: este operador ira variando en funcion de lo que elija el usuario.
-   `$3`: es otra variable especial en Bash que se refiere al tercer argumento que se pasa al script. En esta línea, `$3` se utiliza como el segundo número en la operación de suma.

## Diferencias entre versiones
Hay 3 versiones:

- [if-else](#if-else)
- [switch](#switch)
- [switch simplificado](#simple-switch)

<a id="if-else"></a>
### Instrucción if-else - my-calc-if-else.sh
Se utiliza una instrucción `if-else` para hacer una u otra operación según el operador introducido por el usuario, que es accedido mediante `$2`.  Si no es valido no se realizara ninguna operación.
```bash
if [ $2 == mas ]; then
	res=`expr $1 + $3`
	echo La suma de $1 y $3 da $res
elif [ $2 == men ]; then
	res=`expr $1 - $3`
	echo La resta de $1 y $3 da $res
elif [ $2 == mul ]; then
	res=`expr $1 \* $3`
	echo La multiplicación de $1 y $3 da $res
elif [ $2 == div ]; then
	res=`expr $1 / $3`
	echo La división de $1 y $3 da $res
else
	echo $2 no es un operador valido. Los validos son mas, men, mul, div.
fi
```

<a id="switch"></a>
### Instrucción switch - my-calc-case.sh
Como lo que se esta verificando es que sea igual a un string, tiene mas sentido utilizar un switch. Se accede a la misma variable `$2` y si no es valida tampoco se realiza ninguna operacion.
```bash
case $2 in
	"mas")
		res=`expr $1 + $3`
		echo La suma de $1 y $3 da $res
	;;
	"men")
		res=`expr $1 - $3`
		echo La resta de $1 y $3 da $res
	;;
	"mul")
		res=`expr $1 \* $3`
		echo La multiplicación de $1 y $3 da $res
	;;
	"div")
		res=`expr $1 / $3`
		echo La división de $1 y $3 da $res
	;;
	*)
		echo $2 no es un operador valido. Los validos son mas, men, mul, div.
	;;
esac
```

<a id="simple-switch"></a>
### Instrucción switch simplificada - myCalcCase.sh
En los casos en los que el operador es valido, siempre se realiza la misma accion pero cambiando el operador:

1. Realizar el calculo
2. Sacar un mensaje

Para simplificar seria mejor hacer una función que acceda a los 2 números introducidos por el usuario y reciba el resultado de la operación matemática para imprimir por consola un mensaje con el resultado.

El parámetro `$1` para el script y para la función no es el mismo, por ello es necesario guardar los parámetros `$1`, `$2`, `$3` en unas variables distintas y así la función no los confundirá con sus parámetros.

```bash
num1=$1
num2=$3
op=$2

f_res(){
	echo La $1 de $num1 y $num2 da $2
	echo
}

case $2 in
	mas) f_res suma `expr $1 + $3`;;
	men) f_res resta `expr $1 - $3`;;
	por) f_res multiplicacion `expr $1 \* $3`;;
	div) f_res division `expr $1 / $3`;;
	*)
		echo Operador no valido
		exit 1
	;;
esac
```
