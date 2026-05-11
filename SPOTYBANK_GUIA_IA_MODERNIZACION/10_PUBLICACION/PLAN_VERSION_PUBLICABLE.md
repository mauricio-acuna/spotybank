# Plan de version publicable

Este plan define como llevar Spotybank desde borrador completo hacia una primera version publicable.

## Version objetivo

```text
Spotybank Guia IA de Modernizacion - v0.1-publicable
```

## Alcance de v0.1

Incluye:

- Capitulos 1 a 12 en borrador revisado.
- Ejercicios por capitulo.
- Laboratorios por perfil.
- Rubricas.
- Planes de clase.
- Figuras Mermaid iniciales.
- Propuesta de licencia.
- Checklist de revision.

No incluye:

- Implementacion completa de `spotybank-core-ledger`.
- Ambientes cloud reales.
- Datos reales.
- Validacion con owners productivos.
- Maquetacion editorial profesional.

## Formatos sugeridos

| Formato | Uso | Prioridad |
|---|---|---|
| Markdown | Repo, colaboracion y versionado | Alta |
| HTML | Navegacion web/local | Media |
| PDF | Entrega a estudiantes o lectores | Alta |
| Fasciculos PDF | Distribucion por perfil | Media |
| DOCX/ODT | Revision editorial externa | Baja/media |

## Secuencia de publicacion

1. Completar revision tecnica y editorial.
2. Definir licencia final.
3. Actualizar README y portada.
4. Revisar enlaces internos.
5. Revisar tablas y figuras.
6. Ejecutar escaneo de seguridad.
7. Crear tag `v0.1-publicable`.
8. Exportar PDF/HTML si se decide.
9. Publicar release en GitHub.
10. Registrar cambios en status de obra.

## Artefactos de release preparados

- `RELEASE_NOTES_v0.1-publicable_DRAFT.md`
- `CHECKLIST_TAG_RELEASE.md`
- `../09_REVISIONES/REVISION_INTERNA_IA_2026-05-11.md`
- `../09_REVISIONES/MATRIZ_REVISION_POR_PERFIL.md`

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
| Falta de revision externa | Usar checklist y pedir revision por perfil |
| Figuras poco pulidas | Publicar como Mermaid inicial y mejorar despues |
| Licencia no definida | Resolver antes de tag/release |
| Exceso de alcance | Mantener v0.1 como version educativa, no productiva |
| Confusion entre caso educativo y sistema real | Reforzar disclaimers y limites |
