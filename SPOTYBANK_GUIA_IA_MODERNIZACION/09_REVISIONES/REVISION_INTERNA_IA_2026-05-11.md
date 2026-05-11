# Revision interna asistida - 2026-05-11

Esta revision es una lectura interna preparatoria de la obra Spotybank. No reemplaza una revision real por perfiles tecnicos, docentes o editoriales. Sirve para ordenar riesgos antes de pedir esa lectura.

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
| Publicacion | PARCIAL | Falta licencia final, revision externa y tag/release. |
| Figuras | PARCIAL | Hay Mermaid inicial; falta version final exportada o disenada. |

## Hallazgos

### REV-001 - Licencia todavia no confirmada

- Tipo: publicacion.
- Severidad: media.
- Estado: pendiente.
- Evidencia: `10_PUBLICACION/PROPUESTA_LICENCIA_Y_USO.md`.
- Recomendacion: confirmar si se adopta CC BY-NC-SA 4.0 para texto y Apache 2.0 para codigo propio, o documentar otra decision.

### REV-002 - Falta revision humana por perfiles

- Tipo: calidad.
- Severidad: alta para publicacion final.
- Estado: pendiente.
- Evidencia: `09_REVISIONES/CHECKLIST_REVISION_TECNICA_EDITORIAL.md`.
- Recomendacion: pedir revision minima a perfiles backend, arquitectura, seguridad, DevOps/SRE, QA y docente/editorial.

### REV-003 - Figuras aun son borradores Mermaid

- Tipo: editorial.
- Severidad: baja para repo, media para PDF/libro.
- Estado: pendiente.
- Evidencia: `07_FIGURAS_Y_TABLAS/FIGURAS_MERMAID_INICIALES.md`.
- Recomendacion: aceptar Mermaid para v0.1 o exportar a SVG/PNG antes de una edicion formal.

### REV-004 - `spotybank-core-ledger` sigue como pieza conceptual

- Tipo: arquitectura.
- Severidad: media.
- Estado: documentado.
- Evidencia: capitulos 5 y 12.
- Recomendacion: mantenerlo explicitamente como modulo educativo pendiente hasta que exista implementacion o laboratorio dedicado.

### REV-005 - Faltan ejercicios resueltos de referencia

- Tipo: docente.
- Severidad: baja para v0.1, media para adopcion docente.
- Estado: pendiente.
- Evidencia: `05_APENDICES/APE_F_Ejercicios_Laboratorios`.
- Recomendacion: crear al menos un ejercicio resuelto para inventario, despliegue y roadmap.

## Criterio para v0.1-publicable

La version `v0.1-publicable` puede prepararse como release borrador si:

- Se mantiene como version educativa preliminar.
- Se declara que no reemplaza revision legal, tecnica ni editorial formal.
- Se mantiene el escaneo de seguridad como requisito previo.
- Se documenta la licencia como propuesta o se confirma decision final.

## Recomendacion de avance

1. Crear matriz de revision por perfil.
2. Preparar notas de release.
3. Mantener estado en 97% hasta recibir revision/licencia final.
4. No crear tag final si la licencia queda sin confirmar.
