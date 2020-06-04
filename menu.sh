#!/bin/bash

archivo_o_directorio() {
	echo "Ingresa un Parametro"
	read ingreso
if [ -z "$ingreso" ]; then
echo "El Parametro $ingreso No existe!"
elif [ -f "$ingreso" ]; then
echo "El $ingreso es Archivo!"
elif [ -d "$ingreso" ]; then
echo "El $ingreso es Directorio!"
else
echo "El Parametro $ingreso es Invalido"
fi
}

obtenertamaño() {
echo "Ingresa un Parametro"
read ingreso
if [ -z "$ingreso" ]; then
echo "Parametro $ingreso Invalido!"
else
echo "El Archivo/Directorio $ingreso tiene el tamaño de"
 ls -s --block-size=M $ingreso | cut -d "M" -f1
echo "Megas"
fi
}

obteneropciones() {
echo "Tiene estas opciones para el argumento 1"
echo "archivo"
echo "directorio"
echo "obtener tamaño"
echo "saludo"
echo "mostrar informacion"
}


saludar() {
echo "Hola" $USER 
}

obtenerinformacion() {
echo "Ingresa un Parametro"
read ingreso
if [ -z "$ingreso" ]; then
echo "Parametro $ingreso Invalido!"
else
man $ingreso
fi
}

crearBackupAutomatico() {
#Ejecutar en screen

timeout=300
nombre=$(date +"backup-%d-%m-%y-%HH-%MM")
tar -czvf "$nombre.tar.gz" /home/$USER/Prueba &> /dev/null
if [ $? = 1 ]; then
	echo "Ocurrio un Error Generando el Backup"
else 
echo "EL backup se genero correctamente"
fi
#sleep $timeout

#./ejercicio6.sh
}

crearBackupMysqlAutomatico() {

timeout=300
nombre=$(date +"backup-%d-%m-%y-%HH-%MM.sql")
mysqldump 3ID_fabrizio_bravo -h localhost -u fabri -p > $nombre
}



OPCIONES="1 2 3 4 5 6 7 Salir"
echo "Hola, $USER Eliga una Opcion!"
select opt in $OPCIONES; do
if [ "$opt" = 1 ]; then
	archivo_o_directorio
elif [ "$opt" = 2 ]; then
	obtenertamaño
elif [ "$opt" = 3 ]; then
	obteneropciones
elif [ "$opt" = 4 ]; then
	saludar
elif [ "$opt" = 5 ]; then
obtenerinformacion
elif [ "$opt" = 6 ]; then
	crearBackupAutomatico
elif [ "$opt" = 7 ]; then
	crearBackupMysqlAutomatico
elif [ "$opt" = "Salir" ]; then
	clear
	exit
else
echo "Opcion erronea! Vuelva a ingresar la opcion!"
fi
done

