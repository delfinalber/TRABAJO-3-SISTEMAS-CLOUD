#!/bin/bash
echo "Ficheros mayores a 1024 bytes en $(pwd):"
ls -lh --color=auto | awk '$5 ~ /[0-9]/ && $5 > 1024 {print}'


