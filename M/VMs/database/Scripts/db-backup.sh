#!/bin/bash

# Verificar que se haya pasado la ruta del archivo de configuración
if [ -z "$1" ]; then
    echo "Debe pasar la ruta del archivo .ini"
    exit 1
else
    source "$1"
fi

# Capturar timestamp
datetime=$(date '+%Y%m%d_%H%M%S')

# Validar nombre de archivo
if [ -z "$2" ]; then
    filename=$filename"_"$datetime.sql
else
    trimname=$(echo "$2" | tr -d " ")
    filename=$filename"_"$trimname.sql
fi

# Crear carpeta de backups si no existe
if [ ! -d "$backups" ]; then
    echo "Creando carpeta de backups: $backups"
    mkdir -p "$backups"
fi

echo "Iniciando el respaldo..."
mysqldump $database > $backups/$filename -u $user --password=$password

echo "Comprimiendo respaldo..."
cd $backups
tar cvfz $filename.tar.gz $filename
rm $filename