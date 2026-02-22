# MenuPrincipal.ps1 - Menú interactivo
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
do {
    Clear-Host
    Write-Host "======== MENÚ PRINCIPAL ========" -ForegroundColor Cyan
    Write-Host "1. Listar servicios arrancados" -ForegroundColor Green
    Write-Host "2. Mostrar fecha del sistema" -ForegroundColor Green
    Write-Host "3. Ejecutar Bloc de notas" -ForegroundColor Green
    Write-Host "4. Ejecutar Calculadora" -ForegroundColor Green
    Write-Host "5. Salir" -ForegroundColor Red
    Write-Host "================================" -ForegroundColor Cyan    
    $opcion = Read-Host "Elige opción (1-5)"    
    switch ($opcion) {
        "1" {
            Clear-Host
            Write-Host "SERVICIOS ARRANCADOS:" -ForegroundColor Yellow
            Get-Service | Where-Object {$_.Status -eq "Running"} | Select-Object Name, Status, DisplayName | Format-Table -AutoSize
            Read-Host "Presiona Enter para continuar"
        }
        "2" {
            Clear-Host
            Write-Host "FECHA DEL SISTEMA: $(Get-Date -Format 'dddd, dd/MM/yyyy HH:mm:ss')" -ForegroundColor Yellow
            Read-Host "Presiona Enter para continuar"
        }
        "3" {
            Clear-Host
            Write-Host "Abriendo Bloc de notas..." -ForegroundColor Yellow
            notepad.exe
            Read-Host "Presiona Enter para continuar"
        }
        "4" {
            Clear-Host
            Write-Host "Abriendo Calculadora..." -ForegroundColor Yellow
            calc.exe
            Read-Host "Presiona Enter para continuar"
        }
        "5" {
            Write-Host "¡Hasta luego!" -ForegroundColor Green
            exit
        }
        default {
            Write-Host "Opción inválida. Intenta de nuevo." -ForegroundColor Red
            Start-Sleep 2
        }
    }
} while ($opcion -ne "5")
