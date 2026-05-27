# Plan de version publicable

Este plan registra el cierre de Spotybank como primera version publicable preliminar.

## Version objetivo

```text
Spotybank Guia IA de Modernizacion - v0.1-publicable
```

## Alcance de v0.1

Incluye:

- Capitulos 1 a 12 en borrador revisado.
- Portada, prefacio, contraportada y sobre el autor.
- Ejercicios por capitulo.
- Laboratorios por perfil.
- Rubricas.
- Planes de clase.
- Figuras Mermaid iniciales.
- Licencia definida.
- Checklist de revision.

No incluye:

- Implementacion completa de `spotybank-core-ledger`.
- Ambientes cloud reales.
- Datos reales.
- Validacion con owners productivos.
- Maquetacion editorial profesional.
- ISBN.
- Portada grafica final.

## Formatos sugeridos

| Formato | Uso | Prioridad |
|---|---|---|
| Markdown | Repo, colaboracion y versionado | Alta |
| HTML | Navegacion web/local | Media |
| PDF | Entrega a estudiantes o lectores | Alta |
| Fasciculos PDF | Distribucion por perfil | Media |
| DOCX/ODT | Revision editorial externa | Baja/media |

## Secuencia de publicacion

1. [ok] Completar revision tecnica y editorial.
2. [ok] Definir licencia final.
3. [ok] Actualizar README y portada.
4. [ok] Revisar tablas y figuras iniciales.
5. [ok] Registrar cambios en status de obra.
6. [ok] Ejecutar escaneo de seguridad con el script de publicacion.
7. [ok] Crear tag `v0.1-publicable`.
8. [later] Exportar PDF/HTML si se decide.
9. [later] Publicar release en GitHub con artefactos exportados.

## Artefactos de release preparados

- `RELEASE_NOTES_v0.1-publicable_DRAFT.md`
- `CHECKLIST_TAG_RELEASE.md`
- `../09_REVISIONES/REVISION_INTERNA_IA_2026-05-11.md`
- `../09_REVISIONES/MATRIZ_REVISION_POR_PERFIL.md`
- `../09_REVISIONES/ACTA_CIERRE_REVISION_TECNICA_EDITORIAL_2026-05-12.md`

## Fasciculos candidatos

| Fasciculo | Capitulos base | Estado |
|---|---|---|
| 0 - Presentacion del caso | 1, 3 | Borrador listo |
| 1 - Inventario del sistema | 2, 4 | Borrador listo |
| 2 - Arquitectura | 5, 12 | Borrador listo |
| 3 - Seguridad y DevSecOps | 3, 7, 10 | Borrador listo |
| 4 - Modernizacion backend | 6, 10, 12 | Borrador listo |
| 5 - QA y testing | 6, 9, apendice F | Borrador listo |
| 6 - Nube y observabilidad | 8, 9 | Borrador listo |
| 7 - Diseno curricular | 11, apendice F, planes de clase | Borrador listo |

## Criterios de calidad

- Una persona nueva puede navegar la obra desde README.
- Cada capitulo tiene actividad aplicable.
- Las recomendaciones no dependen de datos secretos.
- Los limites del caso estan explicitos.
- Hay un camino claro para continuar aportes.

## Riesgos antes de publicar

| Riesgo | Mitigacion |
|---|---|
| Falta de revision externa | Publicar v0.1 como preliminar educativa y reservar revision externa para v0.2 |
| Figuras poco pulidas | Publicar como Mermaid inicial y mejorar despues |
| Licencia no definida | Resuelto: CC BY-NC-SA 4.0 para texto y Apache 2.0 para codigo propio |
| Exceso de alcance | Mantener v0.1 como version educativa, no productiva |
| Confusion entre caso educativo y sistema real | Reforzar disclaimers y limites |
