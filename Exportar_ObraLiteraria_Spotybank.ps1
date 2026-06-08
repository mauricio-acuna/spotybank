param(
  [string]$Version = "v0.2-editorial",
  [switch]$Html,
  [switch]$Pdf
)

$ErrorActionPreference = "Stop"

Set-Location $PSScriptRoot

function ConvertTo-SafeHtml {
  param([AllowNull()][string]$Text)

  if ($null -eq $Text) {
    return ""
  }

  [System.Net.WebUtility]::HtmlEncode($Text)
}

function Convert-InlineMarkdown {
  param([AllowNull()][string]$Text)

  $encoded = ConvertTo-SafeHtml $Text
  $encoded = [regex]::Replace($encoded, "\[([^\]]+)\]\(([^)]+)\)", {
    param($match)
    $label = $match.Groups[1].Value
    $href = ConvertTo-SafeHtml $match.Groups[2].Value
    "<a href=""$href"">$label</a>"
  })
  $encoded = [regex]::Replace($encoded, '`([^`]+)`', '<code>$1</code>')
  $encoded = [regex]::Replace($encoded, '\*\*([^*]+)\*\*', '<strong>$1</strong>')
  return $encoded
}

function New-HeadingSlug {
  param(
    [string]$Text,
    [hashtable]$Seen
  )

  $slug = $Text.ToLowerInvariant() -replace "[^a-z0-9]+", "-"
  $slug = $slug.Trim("-")
  if ([string]::IsNullOrWhiteSpace($slug)) {
    $slug = "seccion"
  }

  if ($Seen.ContainsKey($slug)) {
    $Seen[$slug] = $Seen[$slug] + 1
    return "$slug-$($Seen[$slug])"
  }

  $Seen[$slug] = 1
  return $slug
}

function Convert-MarkdownTableRow {
  param([string]$Line)

  $row = $Line.Trim()
  $row = $row.Trim("|")
  @($row -split "\|" | ForEach-Object { $_.Trim() })
}

function Test-MarkdownTableSeparator {
  param([string[]]$Cells)

  foreach ($cell in $Cells) {
    if ($cell -notmatch "^:?-{3,}:?$") {
      return $false
    }
  }

  return $true
}

function Convert-MarkdownToBasicHtml {
  param(
    [string[]]$MarkdownLines,
    [string]$Title
  )

  $body = New-Object System.Collections.Generic.List[string]
  $toc = New-Object System.Collections.Generic.List[object]
  $headingIds = @{}
  $script:tableRows = New-Object System.Collections.Generic.List[object]
  $script:listType = $null
  $inCode = $false

  function Close-List {
    if ($script:listType) {
      $body.Add("</$script:listType>")
      $script:listType = $null
    }
  }

  function Flush-Table {
    if ($script:tableRows.Count -eq 0) {
      return
    }

    Close-List
    $body.Add("<table>")
    $headerWritten = $false

    for ($i = 0; $i -lt $script:tableRows.Count; $i++) {
      $cells = $script:tableRows[$i]
      if (Test-MarkdownTableSeparator $cells) {
        continue
      }

      if (-not $headerWritten) {
        $body.Add("<thead><tr>")
        foreach ($cell in $cells) {
          $body.Add("<th>$(Convert-InlineMarkdown $cell)</th>")
        }
        $body.Add("</tr></thead><tbody>")
        $headerWritten = $true
        continue
      }

      $body.Add("<tr>")
      foreach ($cell in $cells) {
        $body.Add("<td>$(Convert-InlineMarkdown $cell)</td>")
      }
      $body.Add("</tr>")
    }

    if ($headerWritten) {
      $body.Add("</tbody>")
    }
    $body.Add("</table>")
    $script:tableRows.Clear()
  }

  foreach ($line in $MarkdownLines) {
    if ($line -match '^\s*```') {
      Flush-Table
      Close-List
      if ($inCode) {
        $body.Add("</code></pre>")
        $inCode = $false
      }
      else {
        $body.Add("<pre><code>")
        $inCode = $true
      }
      continue
    }

    if ($inCode) {
      $body.Add((ConvertTo-SafeHtml $line))
      continue
    }

    if ($line -match "^\s*<!--.*-->\s*$") {
      continue
    }

    if ($line -match "^\s*\|.*\|\s*$") {
      $script:tableRows.Add((Convert-MarkdownTableRow $line))
      continue
    }

    Flush-Table

    if ([string]::IsNullOrWhiteSpace($line)) {
      Close-List
      continue
    }

    if ($line -match "^(#{1,6})\s+(.+)$") {
      Close-List
      $level = $matches[1].Length
      $text = $matches[2].Trim()
      $slug = New-HeadingSlug -Text $text -Seen $headingIds
      $toc.Add([pscustomobject]@{ Level = $level; Text = $text; Id = $slug })
      $body.Add("<h$level id=""$slug"">$(Convert-InlineMarkdown $text)</h$level>")
      continue
    }

    if ($line -match "^\s*[-*]\s+(.+)$") {
      if ($script:listType -ne "ul") {
        Close-List
        $script:listType = "ul"
        $body.Add("<ul>")
      }
      $body.Add("<li>$(Convert-InlineMarkdown $matches[1])</li>")
      continue
    }

    if ($line -match "^\s*\d+\.\s+(.+)$") {
      if ($script:listType -ne "ol") {
        Close-List
        $script:listType = "ol"
        $body.Add("<ol>")
      }
      $body.Add("<li>$(Convert-InlineMarkdown $matches[1])</li>")
      continue
    }

    if ($line -match "^\s*>\s?(.*)$") {
      Close-List
      $body.Add("<blockquote>$(Convert-InlineMarkdown $matches[1])</blockquote>")
      continue
    }

    if ($line -match "^\s*-{3,}\s*$") {
      Close-List
      $body.Add("<hr>")
      continue
    }

    Close-List
    $body.Add("<p>$(Convert-InlineMarkdown $line)</p>")
  }

  Flush-Table
  Close-List

  if ($inCode) {
    $body.Add("</code></pre>")
  }

  [pscustomobject]@{
    Body = $body
    Toc = $toc
  }
}

function New-BasicHtmlDocument {
  param(
    [string[]]$MarkdownLines,
    [string]$Title
  )

  $converted = Convert-MarkdownToBasicHtml -MarkdownLines $MarkdownLines -Title $Title
  $safeTitle = ConvertTo-SafeHtml $Title
  $html = New-Object System.Collections.Generic.List[string]
  $html.Add("<!doctype html>")
  $html.Add("<html lang=""es"">")
  $html.Add("<head>")
  $html.Add("<meta charset=""utf-8"">")
  $html.Add("<meta name=""viewport"" content=""width=device-width, initial-scale=1"">")
  $html.Add("<title>$safeTitle</title>")
  $html.Add("<style>")
  $html.Add("body{margin:0;background:#f7f7f5;color:#1f2933;font-family:Segoe UI,Arial,sans-serif;line-height:1.65}")
  $html.Add("header{background:#0f172a;color:#fff;padding:32px 24px}")
  $html.Add("header h1{margin:0;font-size:28px;line-height:1.2;font-weight:700}")
  $html.Add("header p{margin:8px 0 0;color:#cbd5e1}")
  $html.Add(".layout{display:grid;grid-template-columns:minmax(220px,300px) minmax(0,1fr);gap:28px;max-width:1320px;margin:0 auto;padding:24px}")
  $html.Add("nav{position:sticky;top:16px;align-self:start;max-height:calc(100vh - 32px);overflow:auto;border-right:1px solid #d8ddd3;padding-right:18px}")
  $html.Add("nav h2{font-size:14px;text-transform:uppercase;color:#52616b;margin:0 0 12px}")
  $html.Add("nav a{display:block;color:#254d7a;text-decoration:none;font-size:13px;padding:3px 0}")
  $html.Add("nav a:hover{text-decoration:underline}")
  $html.Add("nav .l1{font-weight:700;margin-top:8px}.l2{padding-left:10px}.l3,.l4,.l5,.l6{padding-left:20px;color:#52616b}")
  $html.Add("main{background:#fff;border:1px solid #d8ddd3;padding:28px;min-width:0}")
  $html.Add("h1,h2,h3,h4,h5,h6{line-height:1.3;margin:28px 0 10px;color:#111827}")
  $html.Add("p{margin:10px 0}a{color:#1d4ed8}code{background:#edf2f7;padding:1px 4px;border-radius:4px}")
  $html.Add("pre{background:#111827;color:#f9fafb;overflow:auto;padding:14px;border-radius:6px;white-space:pre-wrap}")
  $html.Add("table{border-collapse:collapse;width:100%;margin:16px 0;display:block;overflow-x:auto}th,td{border:1px solid #cfd8dc;padding:8px;text-align:left;vertical-align:top}th{background:#edf2f7}")
  $html.Add("blockquote{border-left:4px solid #8aa2b2;margin:14px 0;padding:8px 14px;background:#f1f5f9;color:#334155}")
  $html.Add("hr{border:0;border-top:1px solid #d8ddd3;margin:24px 0}")
  $html.Add("@media(max-width:900px){.layout{display:block;padding:16px}nav{position:static;max-height:none;border-right:0;border-bottom:1px solid #d8ddd3;margin-bottom:18px;padding-bottom:14px}main{padding:18px}header{padding:24px 16px}}")
  $html.Add("</style>")
  $html.Add("</head>")
  $html.Add("<body>")
  $html.Add("<header><h1>$safeTitle</h1><p>Exportacion HTML local generada desde Markdown versionado.</p></header>")
  $html.Add("<div class=""layout"">")
  $html.Add("<nav aria-label=""Tabla de contenidos""><h2>Contenido</h2>")
  foreach ($item in $converted.Toc) {
    $html.Add("<a class=""l$($item.Level)"" href=""#$($item.Id)"">$(ConvertTo-SafeHtml $item.Text)</a>")
  }
  $html.Add("</nav>")
  $html.Add("<main>")
  foreach ($line in $converted.Body) {
    $html.Add($line)
  }
  $html.Add("</main>")
  $html.Add("</div>")
  $html.Add("</body>")
  $html.Add("</html>")
  return $html
}

function Write-ArtifactManifest {
  param(
    [string]$OutputDirectory,
    [string]$Version
  )

  $manifest = Join-Path $OutputDirectory ("spotybank-guia-ia-modernizacion-" + $Version + "-manifest.txt")
  $artifactPattern = "spotybank-guia-ia-modernizacion-$Version.*"
  $artifacts = @(Get-ChildItem -Path $OutputDirectory -File -Filter $artifactPattern | Where-Object { $_.FullName -ne $manifest })
  $lines = New-Object System.Collections.Generic.List[string]

  $lines.Add("Spotybank Guia IA de Modernizacion - manifiesto de artefactos")
  $lines.Add("Version: $Version")
  $lines.Add("Generado: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')")
  $lines.Add("")

  if ($artifacts.Count -eq 0) {
    $lines.Add("Sin artefactos generados.")
  }
  else {
    foreach ($artifact in $artifacts | Sort-Object Name) {
      $hash = Get-FileHash -Algorithm SHA256 -LiteralPath $artifact.FullName
      $lines.Add("Archivo: $($artifact.Name)")
      $lines.Add("Tamano: $($artifact.Length) bytes")
      $lines.Add("SHA256: $($hash.Hash)")
      $lines.Add("")
    }
  }

  $lines | Set-Content -Path $manifest -Encoding UTF8
  Write-Host "Manifiesto generado: $manifest"
}

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
  if ($Html) {
    $htmlOut = Join-Path $outDir ("spotybank-guia-ia-modernizacion-" + $Version + ".html")
    $htmlLines = New-BasicHtmlDocument -MarkdownLines $lines -Title "Spotybank Guia IA de Modernizacion"
    $htmlLines | Set-Content -Path $htmlOut -Encoding UTF8
    Write-Host "HTML basico generado sin pandoc: $htmlOut"
  }

  if ($Pdf) {
    Write-Host "pandoc no disponible; PDF omitido."
  }

  if (-not $Html -and -not $Pdf) {
    Write-Host "pandoc no disponible; HTML/PDF quedan omitidos."
  }

  Write-ArtifactManifest -OutputDirectory $outDir -Version $Version
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

Write-ArtifactManifest -OutputDirectory $outDir -Version $Version
