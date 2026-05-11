param(
  [string]$RemoteUrl = "https://github.com/mauricio-acuna/spotybank.git",
  [switch]$SkipPush
)

$ErrorActionPreference = "Stop"
$script:TranscriptStarted = $false

function Start-PublicacionLog {
  $logDir = Join-Path $PSScriptRoot "_logs"
  New-Item -ItemType Directory -Force -Path $logDir | Out-Null
  $logFile = Join-Path $logDir ("publicacion-" + (Get-Date -Format "yyyy-MM-dd") + ".log")
  Start-Transcript -Path $logFile -Append | Out-Null
  $script:TranscriptStarted = $true
}

function Stop-PublicacionLog {
  if ($script:TranscriptStarted) {
    Stop-Transcript | Out-Null
    $script:TranscriptStarted = $false
  }
}

trap {
  Stop-PublicacionLog
  throw $_
}

function Invoke-Git {
  $Arguments = $args

  & git @Arguments
  if ($LASTEXITCODE -ne 0) {
    throw "Fallo git $($Arguments -join ' ')"
  }
}

function Invoke-GitCapture {
  $Arguments = $args

  $previousErrorActionPreference = $ErrorActionPreference
  $ErrorActionPreference = "Continue"
  try {
    $output = & git @Arguments 2>$null
    $code = $LASTEXITCODE
  }
  finally {
    $ErrorActionPreference = $previousErrorActionPreference
  }

  [pscustomobject]@{
    Output = $output
    ExitCode = $code
  }
}

function Assert-GitDisponible {
  Get-Command git -ErrorAction Stop | Out-Null
}

function Assert-RepoSeguro {
  $root = (Resolve-Path $PSScriptRoot).Path
  $topLevelResult = Invoke-GitCapture rev-parse --show-toplevel

  if ($topLevelResult.ExitCode -eq 0) {
    $topLevel = $topLevelResult.Output | Select-Object -First 1
    $gitRoot = (Resolve-Path $topLevel).Path
    if ($gitRoot -ne $root) {
      throw "El repo Git activo no apunta a ObraLiteraria. Raiz detectada: $gitRoot"
    }
  }
}

function Assert-ContenidoPublicable {
  $terms = @(
    ("gali" + "cia"),
    ("banco" + "gali" + "cia"),
    ("banco " + "gali" + "cia"),
    ("gl" + "pat-"),
    ("tele" + "kom"),
    ("t-" + "sys" + "tems"),
    ("mauricio-" + "hern" + "ando"),
    ("P0" + "-4PP")
  )
  $pattern = ($terms | ForEach-Object { [regex]::Escape($_) }) -join "|"
  $matches = & rg -n -i $pattern . -g "!.git/**" -g "!_logs/**" 2>$null
  $code = $LASTEXITCODE

  if ($code -eq 0 -and $matches) {
    Write-Host "Se detectaron referencias no publicables:"
    $matches | ForEach-Object { Write-Host $_ }
    throw "Publicacion detenida por escaneo de seguridad."
  }

  if ($code -gt 1) {
    throw "No se pudo ejecutar el escaneo de seguridad con rg."
  }
}

Set-Location $PSScriptRoot
Start-PublicacionLog

Assert-GitDisponible

if (-not (Test-Path -LiteralPath ".git")) {
  Invoke-Git init
}

Assert-RepoSeguro
Invoke-Git checkout -B main

$localUserName = Invoke-GitCapture config user.name
if ($localUserName.ExitCode -ne 0 -or [string]::IsNullOrWhiteSpace(($localUserName.Output -join ""))) {
  Invoke-Git config user.name "Hernando"
}

$localUserEmail = Invoke-GitCapture config user.email
if ($localUserEmail.ExitCode -ne 0 -or [string]::IsNullOrWhiteSpace(($localUserEmail.Output -join ""))) {
  Invoke-Git config user.email "maundroid@gmail.com"
}

$origin = Invoke-GitCapture remote get-url origin
if ($origin.ExitCode -ne 0) {
  Invoke-Git remote add origin $RemoteUrl
}
elseif (($origin.Output | Select-Object -First 1) -ne $RemoteUrl) {
  Invoke-Git remote set-url origin $RemoteUrl
}

Assert-ContenidoPublicable

Invoke-Git add -A .
$changes = & git status --porcelain

if (-not $changes) {
  Write-Host "Sin cambios para publicar en la obra literaria Spotybank."
  Stop-PublicacionLog
  exit 0
}

$stamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
Invoke-Git commit -m "docs: actualiza obra literaria Spotybank $stamp"

if ($SkipPush) {
  Write-Host "Commit local creado. Push omitido por parametro -SkipPush."
  Stop-PublicacionLog
  exit 0
}

Invoke-Git push -u origin main
Write-Host "Obra literaria Spotybank publicada en $RemoteUrl"
Stop-PublicacionLog
