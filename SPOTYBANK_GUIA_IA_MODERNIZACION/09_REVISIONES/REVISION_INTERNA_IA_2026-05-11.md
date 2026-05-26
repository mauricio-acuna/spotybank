# Revision interna asistida - 2026-05-11

Esta revision es una lectura interna preparatoria de la obra Spotybank. No reemplaza una revision real por perfiles tecnicos, docentes o editoriales. Sirve para ordenar riesgos antes de pedir esa lectura.

Actualizacion 2026-05-26: esta revision queda como antecedente preparatorio. El cierre posterior esta documentado en `09_REVISIONES/ACTA_CIERRE_REVISION_TECNICA_EDITORIAL_2026-05-12.md` y en `00_GESTION_PROYECTO/statusObraLiteraria.md`.

## Alcance revisado

- Capitulos 1 a 12 en borrador.
- Ejercicios por capitulo.
- Laboratorios por perfil.
- Rubricas.
- Planes de clase.
- Figuras Mermaid iniciales.
- Propuesta de licencia.
- Plan de version publicable.
- Checklist de revision.

## Resultado general

| Area | Resultado | Observacion |
|---|---|---|
| Identidad Spotybank | OK preliminar | La obra mantiene nombre educativo Spotybank. |
| Estructura editorial | OK preliminar | Hay cuerpo principal completo y apendices docentes. |
| Seguridad editorial | OK preliminar | El escaneo automatizado no detecta patrones sensibles definidos. |
| Uso docente | OK preliminar | Existen ejercicios, laboratorios, rubricas y planes por duracion. |
| Publicacion | CERRADO PARA V0.1 | Licencia, acta, release notes y checklist quedaron definidos; falta publicar tag/release. |
| Figuras | ACEPTADO PARA V0.1 | Mermaid queda como formato inicial; arte final exportado pasa a v0.2. |

## Hallazgos

### REV-001 - Licencia todavia no confirmada

- Tipo: publicacion.
- Severidad: media.
- Estado: cerrado para v0.1.
- Evidencia: `10_PUBLICACION/PROPUESTA_LICENCIA_Y_USO.md`.
- Recomendacion: confirmar si se adopta CC BY-NC-SA 4.0 para texto y Apache 2.0 para codigo propio, o documentar otra decision.
  Decision posterior: licencia textual CC BY-NC-SA 4.0 y codigo propio Apache 2.0 definidos en acta de cierre.

### REV-002 - Falta revision humana por perfiles

- Tipo: calidad.
- Severidad: alta para publicacion final.
- Estado: no bloqueante para v0.1.
- Evidencia: `09_REVISIONES/CHECKLIST_REVISION_TECNICA_EDITORIAL.md`.
- Recomendacion: pedir revision minima a perfiles backend, arquitectura, seguridad, DevOps/SRE, QA y docente/editorial.
  Decision posterior: mantener revision externa por perfiles como mejora de v0.2.

### REV-003 - Figuras aun son borradores Mermaid

- Tipo: editorial.
- Severidad: baja para repo, media para PDF/libro.
- Estado: aceptado para v0.1.
- Evidencia: `07_FIGURAS_Y_TABLAS/FIGURAS_MERMAID_INICIALES.md`.
- Recomendacion: aceptar Mermaid para v0.1 o exportar a SVG/PNG antes de una edicion formal.
  Decision posterior: aceptar Mermaid en v0.1 y mover exportacion final a v0.2.

### REV-004 - `spotybank-core-ledger` sigue como pieza conceptual

- Tipo: arquitectura.
- Severidad: media.
- Estado: documentado.
- Evidencia: capitulos 5 y 12.
- Recomendacion: mantenerlo explicitamente como modulo educativo pendiente hasta que exista implementacion o laboratorio dedicado.

### REV-005 - Faltan ejercicios resueltos de referencia

- Tipo: docente.
- Severidad: baja para v0.1, media para adopcion docente.
- Estado: no bloqueante para v0.1.
- Evidencia: `05_APENDICES/APE_F_Ejercicios_Laboratorios`.
- Recomendacion: crear al menos un ejercicio resuelto para inventario, despliegue y roadmap.
  Decision posterior: mantener ejercicios resueltos de referencia como mejora docente posterior.

## Criterio para v0.1-publicable

La version `v0.1-publicable` puede prepararse como release borrador si:

- Se mantiene como version educativa preliminar.
- Se declara que no reemplaza revision legal, tecnica ni editorial formal.
- Se mantiene el escaneo de seguridad como requisito previo.
- Se documenta la licencia como propuesta o se confirma decision final.

## Recomendacion de avance

1. Publicar el commit documental de seguimiento.
2. Crear tag `v0.1-publicable`.
3. Reservar revision externa, ejercicios resueltos y arte final para `v0.2`.
