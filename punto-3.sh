#!/bin/bash

# punto-3.sh - Discos < parámetro dado
PORCENTAJE_MIN=${1:-20}

echo "Discos < ${PORCENTAJE_MIN}% libre:"

# WMIC simple + powershell para cálculo preciso (funciona en Git Bash)
powershell.exe -NoProfile -Command "
Get-WmiObject Win32_LogicalDisk | Where {`$_.DriveType -eq 3 -and `$_.Size -gt 0 -and ( (`$_.FreeSpace / `$_.Size * 100) -lt $PORCENTAJE_MIN ) } | ForEach { 
    '\$(\$_.DeviceID) ' + [math]::Truncate(`$_.FreeSpace / 1GB) + 'GB ' + [math]::Truncate(`$_.Size / 1GB) + 'GB'
}
if (-not (Get-WmiObject Win32_LogicalDisk | Where {`$_.DriveType -eq 3 -and ( (`$_.FreeSpace / `$_.Size * 100) -lt $PORCENTAJE_MIN ) })) { 
    'TODOS los discos > ' + $PORCENTAJE_MIN + '% libre' 
}
"
