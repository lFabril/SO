#!/bin/bash

#Ejecutaren screen

timeout=300
nombre=$(date +"backup-%d-%m-%y-%HH-%MM")
tar -czvf "$nombre.tar.gz" /home/$USER/
sleep $timeout

./ejercicio6.sh
