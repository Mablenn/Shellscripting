#! /bin/bash

echo -n "Introduce una palabra para generar la contraseña: "
read palabra

echo -n "¿De cuantos dígitos desea que esté compuesta la contraseña?"
read tamano

if [ -z $palabra -o -z $tamano ]; then
	echo "Uso: $1 necesita argumentos para generar una contraseña."
	exit 1
fi

function genera_pass_segura(){
	local hash=$(echo -n "$palabra" | openssl dgst -sha512 | awk '{print $2}')
	local pass_segura=${hash:0:$tamano}
	echo "$pass_segura"
}

contrasena=$(genera_pass_segura "$1")

echo "Contraseña segura generada: $contrasena"


