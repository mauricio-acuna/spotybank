param(
  [string]$TaskName = "Spotybank-ObraLiteraria-Publicar",
  [string[]]$Horas = @("09:00", "14:00", "19:00")
)

$ErrorActionPreference = "Stop"

$publishScript = Join-Path $PSScriptRoot "Publicar_ObraLiteraria_Spotybank.ps1"
if (-not (Test-Path -LiteralPath $publishScript)) {
  throw "No se encontro el script de publicacion: $publishScript"
}

$arguments = "-NoProfile -ExecutionPolicy Bypass -File `"$publishScript`""
$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument $arguments

$triggers = foreach ($hora in $Horas) {
  New-ScheduledTaskTrigger -Daily -At ([datetime]::ParseExact($hora, "HH:mm", $null))
}

$settings = New-ScheduledTaskSettingsSet `
  -StartWhenAvailable `
  -MultipleInstances IgnoreNew `
  -ExecutionTimeLimit (New-TimeSpan -Minutes 30)

$principal = New-ScheduledTaskPrincipal `
  -UserId "$env:USERDOMAIN\$env:USERNAME" `
  -LogonType Interactive `
  -RunLevel Limited

Register-ScheduledTask `
  -TaskName $TaskName `
  -Action $action `
  -Trigger $triggers `
  -Settings $settings `
  -Principal $principal `
  -Description "Publica solo la obra literaria tecnica Spotybank en GitHub 3 veces al dia." `
  -Force | Out-Null

Write-Host "Tarea programada creada: $TaskName"
Write-Host "Horarios locales: $($Horas -join ', ')"
Write-Host "Script ejecutado: $publishScript"
