param(
  [string]$Version = "v0.2-editorial",
  [switch]$Html,
  [switch]$Pdf
)

$ErrorActionPreference = "Stop"

Set-Location $PSScriptRoot

$project = "SPOTYBANK_GUIA_IA_MODERNIZACION"
$outDir = Join-Path (Join-Path $PSScriptRoot "dist") $Version
New-Item -ItemType Directory -Force -Path $outDir | Out-Null

$files = @(
  "$project/03_PARTES_PRELIMINARES/PORTADA.md",
  "$project/03_PARTES_PRELIMINARES/PREFACIO.md",
  "$project/02_PLANIFICACION/INDICE_PROVISIONAL.md",
  "$project/04_CUERPO_PRINCIPAL/CAP_01_Introduccion/CAP_01_BORRADOR.md",
  "$project/04_CUERPO_PRINCIPAL/CAP_02_Marco_Teorico/CAP_02_BORRADOR.md",
  "$project/04_CUERPO_PRINCIPAL/CAP_03_Metodologia/CAP_03_BORRADOR.md",
  "$project/04_CUERPO_PRINCIPAL/CAP_04_Desarrollo/CAP_04_BORRADOR.md",
  "$project/04_CUERPO_PRINCIPAL/CAP_05_Resultados/CAP_05_BORRADOR.md",
  "$project/04_CUERPO_PRINCIPAL/CAP_06_Discusion/CAP_06_BORRADOR.md",
  "$project/04_CUERPO_PRINCIPAL/CAP_07_Conclusiones/CAP_07_BORRADOR.md",
  "$project/04_CUERPO_PRINCIPAL/CAP_08_Despliegue_Cloud_Native/CAP_08_BORRADOR.md",
  "$project/04_CUERPO_PRINCIPAL/CAP_09_Performance_Escalamiento_Resiliencia/CAP_09_BORRADOR.md",
  "$project/04_CUERPO_PRINCIPAL/CAP_10_IA_Acelerador/CAP_10_BORRADOR.md",
  "$project/04_CUERPO_PRINCIPAL/CAP_11_Spotybank_Como_Curso/CAP_11_BORRADOR.md",
  "$project/04_CUERPO_PRINCIPAL/CAP_12_Roadmap_Evolucion/CAP_12_BORRADOR.md",
  "$project/05_APENDICES/APE_B_Glosario_Tecnico/GLOSARIO.md",
  "$project/05_APENDICES/APE_C_Acronimos/ACRONIMOS.md",
  "$project/05_APENDICES/APE_E_Codigo_Fuente/INSTRUCCIONES_CODIGO.md",
  "$project/05_APENDICES/APE_F_Ejercicios_Laboratorios/EJERCICIOS_POR_CAPITULO.md",
  "$project/05_APENDICES/APE_F_Ejercicios_Laboratorios/LABORATORIOS_POR_PERFIL.md",
  "$project/05_APENDICES/APE_F_Ejercicios_Laboratorios/RUBRICAS_EVALUACION.md",
  "$project/06_PARTES_FINALES/BIBLIOGRAFIA.md",
  "$project/06_PARTES_FINALES/SOBRE_EL_AUTOR.md",
  "$project/06_PARTES_FINALES/CONTRAPORTADA.md"
)

$missing = @($files | Where-Object { -not (Test-Path -LiteralPath $_) })
if ($missing.Count -gt 0) {
  Write-Host "Faltan archivos para exportar:"
  $missing | ForEach-Object { Write-Host " - $_" }
  throw "Exportacion detenida por archivos faltantes."
}

$bookMarkdown = Join-Path $outDir ("spotybank-guia-ia-modernizacion-" + $Version + ".md")
$lines = New-Object System.Collections.Generic.List[string]

foreach ($file in $files) {
  $relative = $file -replace "\\", "/"
  $lines.Add("")
  $lines.Add("<!-- fuente: $relative -->")
  $lines.Add("")
  $content = Get-Content -LiteralPath $file
  foreach ($line in $content) {
    $lines.Add($line)
  }
  $lines.Add("")
  $lines.Add("")
}

$lines | Set-Content -Path $bookMarkdown -Encoding UTF8
Write-Host "Markdown unico generado: $bookMarkdown"

$pandoc = Get-Command pandoc -ErrorAction SilentlyContinue
if (-not $pandoc) {
  Write-Host "pandoc no disponible; HTML/PDF quedan omitidos."
  exit 0
}

if ($Html) {
  $htmlOut = Join-Path $outDir ("spotybank-guia-ia-modernizacion-" + $Version + ".html")
  $htmlArgs = @()
  $htmlArgs += $files
  $htmlArgs += @(
    "--from", "gfm",
    "--standalone",
    "--toc",
    "--metadata", "title=Spotybank Guia IA de Modernizacion",
    "-o", $htmlOut
  )

  & $pandoc.Source @htmlArgs
  if ($LASTEXITCODE -ne 0) {
    throw "Fallo la exportacion HTML con pandoc."
  }
  Write-Host "HTML generado: $htmlOut"
}

if ($Pdf) {
  $pdfOut = Join-Path $outDir ("spotybank-guia-ia-modernizacion-" + $Version + ".pdf")
  $pdfArgs = @()
  $pdfArgs += $files
  $pdfArgs += @(
    "--from", "gfm",
    "--toc",
    "--metadata", "title=Spotybank Guia IA de Modernizacion",
    "--pdf-engine=xelatex",
    "-o", $pdfOut
  )

  & $pandoc.Source @pdfArgs
  if ($LASTEXITCODE -ne 0) {
    throw "Fallo la exportacion PDF con pandoc."
  }
  Write-Host "PDF generado: $pdfOut"
}
