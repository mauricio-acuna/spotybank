param(
  [string]$TaskName = "Spotybank-ObraLiteraria-Publicar"
)

$ErrorActionPreference = "Stop"

Unregister-ScheduledTask -TaskName $TaskName -Confirm:$false
Write-Host "Tarea programada eliminada: $TaskName"
