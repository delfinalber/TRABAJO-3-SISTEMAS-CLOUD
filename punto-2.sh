#!/bin/bash
# Renombra JPG añadiendo fecha YYYY-MM-DD
fecha=$(date +%Y-%m-%d)
contador=1
for archivo in *.jpg; do
    if [ -f "$archivo" ]; then
        nombre_base="${archivo%.*}"
        extension="${archivo##*.}"
        nuevo_nombre="${fecha}_${nombre_base}.${extension}"
        while [ -f "$nuevo_nombre" ]; do
            nuevo_nombre="${fecha}_${nombre_base}_${contador}.${extension}"
            ((contador++))
        done        
        echo "Renombrando: $archivo -> $nuevo_nombre"
         mv "$archivo" "$nuevo_nombre"  
    fi
done
echo "Descomenta 'mv' para aplicar cambios reales."
