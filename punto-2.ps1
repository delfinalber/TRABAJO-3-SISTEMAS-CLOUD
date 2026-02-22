$fecha = Get-Date -Format 'yyyy-MM-dd'
Get-ChildItem -Filter '*.jpg' -File | Sort-Object Name | ForEach-Object {
    if ($_.Name -match '^\d{4}-\d{2}-\d{2}_') { Continue }  # ya renombrado
    $base = $_.BaseName; $ext = $_.Extension.ToLower(); $i = 0    do {
        $suf = if ($i -gt 0) { "_$i" } else { "" }
        $nuevo = "${fecha}_${base}${suf}${ext}"
        $i++
    } while (Test-Path $nuevo)
    Rename-Item -LiteralPath $_.FullName -NewName $nuevo -Verbose
}
Write-Host '¡Archivos JPG renombrados con éxito!' -ForegroundColor Green -BackgroundColor Black