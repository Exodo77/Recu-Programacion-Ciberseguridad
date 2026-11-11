$servidor = "8.8.8.8"

for ($i = 1; $i -le 3; $i++) {
    $fechaHora = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Write-Host "`n[$fechaHora] Verificación #$i hacia $servidor" -ForegroundColor Cyan

    if ($i % 2 -eq 0) {
        Write-Host "Estado de iteración: El intento número $i es PAR."
    } else {
        Write-Host "Estado de iteración: El intento número $i es IMPAR."
    }

    $respuesta = Test-Connection -ComputerName $servidor -Count 1 -Quiet

    if ($respuesta) {
        Write-Host "Conectividad: ÉXITO - El servidor $servidor respondió correctamente." -ForegroundColor Green
    } else {
        Write-Host "Conectividad: FALLO - No hubo respuesta desde $servidor." -ForegroundColor Red
    }
}

Write-Host "`nEl monitoreo ha concluido con éxito." -ForegroundColor Yellow
