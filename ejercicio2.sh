#!/bin/bash

if [ -z "$1" ]; then
echo "Parametro 1 Invalido!"
else
echo "El Parametro 1 tiene el tamaño de"
 ls -s --block-size=M $1 | cut -d "M" -f1
echo "Megas"
fi