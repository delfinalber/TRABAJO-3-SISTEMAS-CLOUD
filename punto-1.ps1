Write-Host "Ficheros > 1024 bytes en $(Get-Location):" -ForegroundColor Cyan
Get-ChildItem -File | Where-Object { $_.Length -gt 1024 } | Select-Object Name, Length | Format-Table -AutoSize -Wrap