#!/bin/bash

# Lista archivos > 1024 bytes en directorio actual
echo "Archivos mayores a 500 bytes en $(pwd):"
ls -lh --color=auto | awk '$5 ~ /[0-9]/ && $5 > 500 {print}'
