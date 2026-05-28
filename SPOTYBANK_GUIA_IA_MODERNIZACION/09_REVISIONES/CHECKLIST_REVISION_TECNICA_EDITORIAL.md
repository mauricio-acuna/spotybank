# Checklist de revision tecnica y editorial

Este checklist registra controles tecnicos y editoriales internos. Para `v0.2-editorial`, el estado actual se complementa con `CIERRE_TECNICO_CAPITULOS_v0.2-editorial.md` y `VALIDACION_INTEGRAL_CIERRE_TECNICO_v0.2-editorial.md`.

## Revision de identidad

- [ok] Todas las referencias publicas usan `Spotybank`.
- [ok] No hay nombres de entidades reales.
- [ok] No hay dominios privados o corporativos antiguos.
- [ok] No hay nombres de desarrolladores previos.
- [ok] No hay tokens, passwords, certificados ni secretos.
- [ok] Los placeholders son claramente ficticios.

## Revision tecnica

- [ok] Cada capitulo diferencia evidencia, inferencia, decision pendiente metodologica y validacion externa.
- [ok] Cada capitulo del cuerpo principal esta marcado como `CERRADO_TECNICO`.
- [ok] Las recomendaciones tienen criterio de validacion.
- [ok] Los capitulos no prometen SLAs reales.
- [ok] `spotybank-core-ledger` se presenta como pieza de diseno educativo, no como modulo productivo ya cerrado.
- [ok] Los capitulos de nube no dependen de proveedor unico.
- [ok] Los capitulos de IA incluyen limites de privacidad y validacion humana.
- [ok] Los ejercicios usan datos sinteticos.

## Revision editorial

- [ok] El tono es consistente.
- [ok] Los titulos siguen una estructura similar.
- [ok] Cada capitulo tiene objetivos, desarrollo, ejercicio, resumen y preguntas.
- [ok] Las tablas tienen sentido sin explicacion oral.
- [ok] Las figuras estan referenciadas en el texto o marcadas como material complementario.
- [ok] Los apendices no repiten contenido innecesariamente.
- [ok] El indice coincide con archivos reales.

## Revision docente

- [ok] Los ejercicios tienen entregables claros.
- [ok] Las rubricas permiten evaluar sin ambiguedad.
- [ok] Los planes de clase tienen tiempos realistas.
- [ok] Hay actividades para nivel inicial, intermedio y avanzado.
- [ok] El material sirve para universidad, empresa e instituto.

## Revision de publicacion

- [ok] Licencia definida.
- [ok] README principal actualizado.
- [ok] Version o tag definido.
- [ok] Repo remoto actualizado.
- [ok] Escaneo de referencias sensibles ejecutado.
- [ok] Formato fuente definido: Markdown versionado.
- [later] PDF, HTML, fasciculos exportados y formato de venta quedan para la etapa de salida.

## Criterio de salida

La obra puede considerarse apta para salida tecnica/editorial cuando:

- El cuerpo principal esta completo y en `CERRADO_TECNICO`.
- Los apendices docentes estan completos.
- La licencia esta definida.
- El escaneo de seguridad no encuentra coincidencias.
- Existe cierre interno tecnico/editorial documentado.
- La revision externa queda como criterio de salida si se decide crear tag `v0.2-editorial`.
