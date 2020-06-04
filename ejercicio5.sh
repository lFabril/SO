#!/bin/bash

if [ -z "$1" ]; then
echo "Parametro 1 Invalido!"
else
man $1
fi