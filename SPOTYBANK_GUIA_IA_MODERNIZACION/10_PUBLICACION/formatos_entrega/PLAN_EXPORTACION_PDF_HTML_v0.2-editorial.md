# Plan de exportacion PDF/HTML v0.2-editorial

Este plan define como generar artefactos PDF/HTML para `v0.2-editorial` cuando se decida publicar una entrega descargable.

## Decision de formato

- Formato fuente: Markdown versionado en Git.
- Formato recomendado para entrega formal: PDF unico.
- Formato recomendado para navegacion: HTML unico con tabla de contenidos.
- Fasciculos PDF por perfil: mejora posterior si se preparan talleres especificos.

## Estado local de herramientas

Chequeo actualizado el 2026-06-04:

| Herramienta | Estado |
|---|---|
| `pandoc` | No disponible localmente |
| `wkhtmltopdf` | No disponible localmente |
| `typst` | No disponible localmente |

Por este motivo no se generaron artefactos PDF/HTML en este avance. El repo queda preparado con instrucciones reproducibles y con `Exportar_ObraLiteraria_Spotybank.ps1`, que genera un Markdown unico local y exporta HTML/PDF cuando Pandoc este disponible.

## Orden recomendado de archivos

Usar este orden para libro unico:

```text
SPOTYBANK_GUIA_IA_MODERNIZACION/03_PARTES_PRELIMINARES/PORTADA.md
SPOTYBANK_GUIA_IA_MODERNIZACION/03_PARTES_PRELIMINARES/PREFACIO.md
SPOTYBANK_GUIA_IA_MODERNIZACION/02_PLANIFICACION/INDICE_PROVISIONAL.md
SPOTYBANK_GUIA_IA_MODERNIZACION/04_CUERPO_PRINCIPAL/CAP_01_Introduccion/CAP_01_BORRADOR.md
SPOTYBANK_GUIA_IA_MODERNIZACION/04_CUERPO_PRINCIPAL/CAP_02_Marco_Teorico/CAP_02_BORRADOR.md
SPOTYBANK_GUIA_IA_MODERNIZACION/04_CUERPO_PRINCIPAL/CAP_03_Metodologia/CAP_03_BORRADOR.md
SPOTYBANK_GUIA_IA_MODERNIZACION/04_CUERPO_PRINCIPAL/CAP_04_Desarrollo/CAP_04_BORRADOR.md
SPOTYBANK_GUIA_IA_MODERNIZACION/04_CUERPO_PRINCIPAL/CAP_05_Resultados/CAP_05_BORRADOR.md
SPOTYBANK_GUIA_IA_MODERNIZACION/04_CUERPO_PRINCIPAL/CAP_06_Discusion/CAP_06_BORRADOR.md
SPOTYBANK_GUIA_IA_MODERNIZACION/04_CUERPO_PRINCIPAL/CAP_07_Conclusiones/CAP_07_BORRADOR.md
SPOTYBANK_GUIA_IA_MODERNIZACION/04_CUERPO_PRINCIPAL/CAP_08_Despliegue_Cloud_Native/CAP_08_BORRADOR.md
SPOTYBANK_GUIA_IA_MODERNIZACION/04_CUERPO_PRINCIPAL/CAP_09_Performance_Escalamiento_Resiliencia/CAP_09_BORRADOR.md
SPOTYBANK_GUIA_IA_MODERNIZACION/04_CUERPO_PRINCIPAL/CAP_10_IA_Acelerador/CAP_10_BORRADOR.md
SPOTYBANK_GUIA_IA_MODERNIZACION/04_CUERPO_PRINCIPAL/CAP_11_Spotybank_Como_Curso/CAP_11_BORRADOR.md
SPOTYBANK_GUIA_IA_MODERNIZACION/04_CUERPO_PRINCIPAL/CAP_12_Roadmap_Evolucion/CAP_12_BORRADOR.md
SPOTYBANK_GUIA_IA_MODERNIZACION/05_APENDICES/APE_B_Glosario_Tecnico/GLOSARIO.md
SPOTYBANK_GUIA_IA_MODERNIZACION/05_APENDICES/APE_C_Acronimos/ACRONIMOS.md
SPOTYBANK_GUIA_IA_MODERNIZACION/05_APENDICES/APE_E_Codigo_Fuente/INSTRUCCIONES_CODIGO.md
SPOTYBANK_GUIA_IA_MODERNIZACION/05_APENDICES/APE_F_Ejercicios_Laboratorios/EJERCICIOS_POR_CAPITULO.md
SPOTYBANK_GUIA_IA_MODERNIZACION/05_APENDICES/APE_F_Ejercicios_Laboratorios/LABORATORIOS_POR_PERFIL.md
SPOTYBANK_GUIA_IA_MODERNIZACION/05_APENDICES/APE_F_Ejercicios_Laboratorios/RUBRICAS_EVALUACION.md
SPOTYBANK_GUIA_IA_MODERNIZACION/06_PARTES_FINALES/BIBLIOGRAFIA.md
SPOTYBANK_GUIA_IA_MODERNIZACION/06_PARTES_FINALES/SOBRE_EL_AUTOR.md
SPOTYBANK_GUIA_IA_MODERNIZACION/06_PARTES_FINALES/CONTRAPORTADA.md
```

Las notas de investigacion no deben entrar en el libro unico salvo que se quiera publicar un anexo de trazabilidad.

## Comando sugerido para HTML

### Exportador local

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\Exportar_ObraLiteraria_Spotybank.ps1
powershell -NoProfile -ExecutionPolicy Bypass -File .\Exportar_ObraLiteraria_Spotybank.ps1 -Html
powershell -NoProfile -ExecutionPolicy Bypass -File .\Exportar_ObraLiteraria_Spotybank.ps1 -Html -Pdf
```

Salida local esperada:

```text
dist/v0.2-editorial/spotybank-guia-ia-modernizacion-v0.2-editorial.md
dist/v0.2-editorial/spotybank-guia-ia-modernizacion-v0.2-editorial.html
dist/v0.2-editorial/spotybank-guia-ia-modernizacion-v0.2-editorial.pdf
```

El directorio `dist/` queda ignorado por Git para evitar publicar builds por accidente. Si se decide crear un release con assets, agregar los artefactos de forma explicita.

### Comando manual con Pandoc

```powershell
$out = "dist/v0.2-editorial"
New-Item -ItemType Directory -Force $out
$files = @(
  "SPOTYBANK_GUIA_IA_MODERNIZACION/03_PARTES_PRELIMINARES/PORTADA.md",
  "SPOTYBANK_GUIA_IA_MODERNIZACION/03_PARTES_PRELIMINARES/PREFACIO.md",
  "SPOTYBANK_GUIA_IA_MODERNIZACION/02_PLANIFICACION/INDICE_PROVISIONAL.md",
  "SPOTYBANK_GUIA_IA_MODERNIZACION/04_CUERPO_PRINCIPAL/CAP_01_Introduccion/CAP_01_BORRADOR.md",
  "SPOTYBANK_GUIA_IA_MODERNIZACION/04_CUERPO_PRINCIPAL/CAP_02_Marco_Teorico/CAP_02_BORRADOR.md",
  "SPOTYBANK_GUIA_IA_MODERNIZACION/04_CUERPO_PRINCIPAL/CAP_03_Metodologia/CAP_03_BORRADOR.md",
  "SPOTYBANK_GUIA_IA_MODERNIZACION/04_CUERPO_PRINCIPAL/CAP_04_Desarrollo/CAP_04_BORRADOR.md",
  "SPOTYBANK_GUIA_IA_MODERNIZACION/04_CUERPO_PRINCIPAL/CAP_05_Resultados/CAP_05_BORRADOR.md",
  "SPOTYBANK_GUIA_IA_MODERNIZACION/04_CUERPO_PRINCIPAL/CAP_06_Discusion/CAP_06_BORRADOR.md",
  "SPOTYBANK_GUIA_IA_MODERNIZACION/04_CUERPO_PRINCIPAL/CAP_07_Conclusiones/CAP_07_BORRADOR.md",
  "SPOTYBANK_GUIA_IA_MODERNIZACION/04_CUERPO_PRINCIPAL/CAP_08_Despliegue_Cloud_Native/CAP_08_BORRADOR.md",
  "SPOTYBANK_GUIA_IA_MODERNIZACION/04_CUERPO_PRINCIPAL/CAP_09_Performance_Escalamiento_Resiliencia/CAP_09_BORRADOR.md",
  "SPOTYBANK_GUIA_IA_MODERNIZACION/04_CUERPO_PRINCIPAL/CAP_10_IA_Acelerador/CAP_10_BORRADOR.md",
  "SPOTYBANK_GUIA_IA_MODERNIZACION/04_CUERPO_PRINCIPAL/CAP_11_Spotybank_Como_Curso/CAP_11_BORRADOR.md",
  "SPOTYBANK_GUIA_IA_MODERNIZACION/04_CUERPO_PRINCIPAL/CAP_12_Roadmap_Evolucion/CAP_12_BORRADOR.md",
  "SPOTYBANK_GUIA_IA_MODERNIZACION/05_APENDICES/APE_B_Glosario_Tecnico/GLOSARIO.md",
  "SPOTYBANK_GUIA_IA_MODERNIZACION/05_APENDICES/APE_C_Acronimos/ACRONIMOS.md",
  "SPOTYBANK_GUIA_IA_MODERNIZACION/05_APENDICES/APE_E_Codigo_Fuente/INSTRUCCIONES_CODIGO.md",
  "SPOTYBANK_GUIA_IA_MODERNIZACION/05_APENDICES/APE_F_Ejercicios_Laboratorios/EJERCICIOS_POR_CAPITULO.md",
  "SPOTYBANK_GUIA_IA_MODERNIZACION/05_APENDICES/APE_F_Ejercicios_Laboratorios/LABORATORIOS_POR_PERFIL.md",
  "SPOTYBANK_GUIA_IA_MODERNIZACION/05_APENDICES/APE_F_Ejercicios_Laboratorios/RUBRICAS_EVALUACION.md",
  "SPOTYBANK_GUIA_IA_MODERNIZACION/06_PARTES_FINALES/BIBLIOGRAFIA.md",
  "SPOTYBANK_GUIA_IA_MODERNIZACION/06_PARTES_FINALES/SOBRE_EL_AUTOR.md",
  "SPOTYBANK_GUIA_IA_MODERNIZACION/06_PARTES_FINALES/CONTRAPORTADA.md"
)
pandoc $files --from gfm --standalone --toc --metadata title="Spotybank Guia IA de Modernizacion" -o "$out/spotybank-v0.2-editorial.html"
```

## Comando sugerido para PDF

```powershell
$out = "dist/v0.2-editorial"
New-Item -ItemType Directory -Force $out
pandoc $files --from gfm --toc --metadata title="Spotybank Guia IA de Modernizacion" --pdf-engine=xelatex -o "$out/spotybank-v0.2-editorial.pdf"
```

## Criterios antes de versionar artefactos

- Revisar que los titulos no dupliquen portada o indice.
- Confirmar que tablas anchas no rompen el PDF.
- Confirmar que bloques Mermaid se exportan como codigo o se reemplazan por imagenes.
- Ejecutar escaneo de publicacion segura antes de subir artefactos.
- No versionar directorios temporales ni builds intermedios.

## Decision de repo

Mantener Markdown como fuente canonica. Los artefactos `dist/v0.2-editorial/*.pdf` y `*.html` deben versionarse solo si se decide publicar un release con descargables.
