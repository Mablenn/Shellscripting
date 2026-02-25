#!/bin/bash

# 1. Parámetros de un script
# 2. Ejecutar comandos

echo ""
echo "================================="
echo "Parámetros del script y ejecución"
echo "de comandos."
echo "================================="
echo ""

# Un script recibe un array de parámetros. El tamaño del array puede contener desde 0 hasta n parámetros
# $# -> Contiene el nº total de parámetros.
# $@ -> Muestra el nombre
# $0 -> El parámetro 0 es el nombre el script.
# $1 -> El primer parámetro.
# $2 -> El segundo parámetro, $3 será el tercer parámetros, y así hasta los n parámetros del script.

echo "Nombre del script $0"
echo "Número de parámetros totales: $#"
echo "Nombre de los parámetros del script: $@"
echo "---------------------------------------"

# Para ejecutar comandos sólo debemos escrirlos para que lo ejecute el script:
echo "Usuario actual:"
whoami
echo ""
echo "Listado del directorio actual:"
ls -l
echo ""
echo "Directorio actual:"
pwd

