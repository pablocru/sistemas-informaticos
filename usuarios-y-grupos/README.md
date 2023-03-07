# Script de asistencia a la creacion de usuarios
El siguiente script en Bash tiene como objetivo crear un nuevo usuario en el sistema, permitiendo la especificación del nombre de usuario, grupo al que pertenece, carpeta home y el shell que utilizará.

## Creación de usuario
Al ejecutar el script, se mostrará el mensaje "Bienvenido, vamos a crear un usuario" para indicar al usuario el objetivo del script. Luego, se solicitará la información necesaria para crear el nuevo usuario a través de comandos de lectura (read).
- Solicita el nombre de usuario que se desea crear.
```bash
read -p "Introduzca el nombre de usuario: " userName
```
- Solicita el nombre del grupo al que pertenecerá el nuevo usuario.
```bash
read -p "Indique a que grupo se añadira el usuario: " groupName
```
- Solicita la carpeta home donde se almacenarán los archivos del nuevo usuario. El valor proporcionado se concatenará con "/home/".
```bash
read -p "Diga la carpeta home para el nuevo usuario: /home/
```
- Solicita el shell que utilizará el nuevo usuario. El valor proporcionado se concatenará con "/bin/".
```bash
read -p "Proporcione el interprete de comandos que usara este usuario: /bin/" userShell
```
