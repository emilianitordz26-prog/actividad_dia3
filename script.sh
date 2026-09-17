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
# Módulo del motor de búsqueda
# Autor: Sofia
# Busca recursivamente los archivos que contienen la palabra o frase indicada.

echo ""
echo "Buscando archivos que contienen: '$PALABRA'"
echo "Resultados encontrados:"

# Módulo de formato de salida y conteo
# Autor: Emiliano
# Cuenta cuántas veces aparece la palabra o frase en cada archivo encontrado.

while IFS= read -r ARCHIVO; do
    CONTEO=$(grep -oFi -- "$PALABRA" "$ARCHIVO" 2>/dev/null | wc -l | tr -d ' ')
    echo "$ARCHIVO : $CONTEO ocurrencia(s)"
done < <(grep -ril -- "$PALABRA" "$RUTA")
