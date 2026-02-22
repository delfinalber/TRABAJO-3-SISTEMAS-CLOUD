param([int]$PorcentajeMinimo=90)
$drives = Get-CimInstance Win32_LogicalDisk | Where-Object { $_.FreeSpace -ne $null -and $_.Size -ne $null } |
    Select-Object @{Name='Unidad';Expression={$_.DeviceID}},
                  @{Name='Libre_GB';Expression={[math]::Round($_.FreeSpace/1GB,0)}},
                  @{Name='PorcLibre';Expression={[math]::Round($_.FreeSpace/$_.Size*100,0)}}
Write-Output "Unidad    Libre_GB    PorcLibre"
$drives | Sort-Object Unidad | ForEach-Object {
    "{0,-6} {1,9}GB {2,7}%" -f $_.Unidad,$_.Libre_GB,$_.PorcLibre
} | ForEach-Object { Write-Output $_ }
# Alertas para unidades por debajo del umbral
$drives | Where-Object { $_.PorcLibre -lt $PorcentajeMinimo } |
    ForEach-Object { Write-Output "La unidad $($_.Unidad) tiene solo $($_.PorcLibre)% de espacio libre ($($_.Libre_GB) GB)." }
