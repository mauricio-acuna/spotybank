# Validacion HTML local v0.2-formatos

Fecha de validacion: 2026-06-08

Estado: HTML local navegable generado y revisado como artefacto no versionado.

## Alcance

Esta validacion revisa la salida local generada por:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\Exportar_ObraLiteraria_Spotybank.ps1 -Html
```

Artefactos revisados:

| Artefacto | Tamano | Estado |
|---|---:|---|
| `dist/v0.2-editorial/spotybank-guia-ia-modernizacion-v0.2-editorial.md` | 279239 bytes | Generado |
| `dist/v0.2-editorial/spotybank-guia-ia-modernizacion-v0.2-editorial.html` | 379385 bytes | Generado |

Los artefactos quedan fuera de Git por decision editorial y tecnica: `dist/` esta ignorado para evitar publicar builds por accidente.

## Controles ejecutados

| Control | Resultado |
|---|---|
| Markdown unico generado | OK |
| HTML basico generado sin Pandoc | OK |
| Tabla de contenidos presente | OK |
| Cantidad de enlaces de TOC detectados | 361 |
| Contenedor `nav` presente | OK |
| Contenedor `main` presente | OK |
| Tablas renderizadas como HTML | OK |
| Bloques de codigo renderizados como HTML | OK |
| Capitulo 12 presente | OK |
| Contraportada presente | OK |
| Comentarios `fuente:` no visibles en HTML | OK |

## Limitaciones conocidas

- El HTML basico no reemplaza una maquetacion profesional.
- Mermaid queda como bloque de codigo si no se procesa con una herramienta especifica.
- El PDF sigue pendiente porque requiere Pandoc y un motor PDF disponible.
- Antes de publicar assets descargables debe realizarse una revision editorial visual del HTML/PDF final.

## Decision

El HTML local queda aceptado como vista navegable interna y como prueba de exportabilidad del libro unico. No se publica como release asset hasta que exista una decision explicita de distribucion, revision editorial de artefactos y escaneo de publicacion segura.
