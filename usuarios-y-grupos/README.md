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
read -p "Diga la carpeta home para el nuevo usuario: /home/ " userFolder
```
- Solicita el shell que utilizará el nuevo usuario. El valor proporcionado se concatenará con "/bin/".
```bash
read -p "Proporcione el interprete de comandos que usara este usuario: /bin/" userShell
```
Una vez obtenida la información necesaria, el script verifica si el grupo especificado ya existe en el sistema. Si el grupo no existe, se crea utilizando el comando "groupadd". El comando grep se utiliza para buscar una coincidencia exacta (-w) con el nombre del grupo proporcionado en el archivo "/etc/group". Si no se encuentra una coincidencia, se crea un nuevo grupo utilizando groupadd.
```bash
if [ -z `grep -w ^$groupName /etc/group` ]; then
    groupadd $groupName
fi
```
Posteriormente, se crea el nuevo usuario utilizando el comando "useradd". Se proporciona el nombre de usuario, la carpeta home, el grupo al que pertenecerá, el shell que utilizará y la opción (-m) para crear automáticamente la carpeta home. Si el comando se ejecuta correctamente, se mostrará el mensaje "Usuario creado correctamente".
```bash
useradd $userName -d /home/$userFolder -g $groupName -s /bin/$userShell -m

if [ $? -eq 0 ]; then
    echo Usuario creado correctamente
```
## Contraseña de usuario
Una vez creado el usuario, el script pregunta al usuario si desea establecer una contraseña para el nuevo usuario. Si la respuesta es "y" (sí), se solicita una nueva contraseña utilizando el comando "passwd".
```bash
read -p "Quieres ponerle una contraseña (y/n) " crearPasswd

if [ $crearPasswd = "y" ]; then
    passwd $userName
fi
```
## Errores
Si se produce algún error al crear el usuario, se mostrará el mensaje "Fallo desconocido al crear el usuario" y se finalizará el script con un código de salida de 1.
```bash
else
    echo Fallo desconocido al crear el usuario
    echo
    exit 1
fi
```
