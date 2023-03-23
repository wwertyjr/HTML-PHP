#!/bin/bash

#Añadimos una variable, la cual nos va a mostrar el puerto donde se va a alojar
localhost=localhost:8000

#Añadimos otra variable, para determinar donde esta el archivo index.php
PHP_FILE="index.php"

#Comunicamos que el servidor esta abriendo
echo -e "\e[1;33m[$(date)]\e[0m \e[1mServidor Web Carregant...\e[0m"

#Esperamos 10 Segundos (pura estetica)
sleep 2

# Iniciar el servidor web integrado de PHP
php -S $localhost $PHP_FILE

# Guardar el PID del proceso del servidor web en un archivo
echo $! > server.pid

# Configurar la acción que se realizará cuando se reciba la señal SIGINT
trap 'pkill -TERM -F server.pid; rm server.pid; echo "Cerrando el proceso PID"; exit 1' SIGINT
