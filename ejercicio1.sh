#!/bin/bash

if [ -z "$1" ]; then
echo "Parametro 1 No existe!"
else
if [ -f "$1" ]; then
echo "El $1 es Archivo!"
elif [ -d "$1" ]; then
echo "El $1 es Directorio!"
else
echo "El Parametro 1 es Invalido"
fi
fi