#!/bin/bash

# Módulo de validación de entrada
# Autor: Emiliano
# Verifica que el usuario proporcione exactamente dos argumentos.

if [ "$#" -ne 2 ]; then
    echo "Uso incorrecto."
    echo "Uso: $0 \"palabra o frase\" /ruta/de/carpeta"
    exit 1
fi

PALABRA="$1"
RUTA="$2"

# Verifica que la ruta proporcionada exista y sea un directorio.
if [ ! -d "$RUTA" ]; then
    echo "Error: la ruta '$RUTA' no existe o no es un directorio válido."
    exit 1
fi

echo "Argumentos válidos."
echo "Palabra o frase a buscar: $PALABRA"
echo "Carpeta a analizar: $RUTA"
