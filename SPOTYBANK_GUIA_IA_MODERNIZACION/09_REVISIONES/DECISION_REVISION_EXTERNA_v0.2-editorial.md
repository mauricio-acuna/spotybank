# Decision sobre revision externa v0.2-editorial

Fecha de decision: 2026-05-28

Estado: decision de salida documentada.

## Decision

La revision externa minima queda recomendada para aumentar madurez tecnica y editorial, pero no bloquea por si sola un tag editorial interno `v0.2-editorial` si el contenido ya tiene cierre tecnico, validacion integral, escaneo seguro y checklist final.

Si la salida se convierte en producto institucional, curso pago, licencia comercial, edicion impresa o release con artefactos descargables, la revision externa debe reabrirse como criterio de calidad antes de publicar esa version.

## Justificacion

- Los 12 capitulos ya fueron revisados y cerrados internamente con criterio tecnico-editorial.
- La validacion integral confirma coherencia entre capitulos, README, indice, status y documentos de salida.
- La revision externa requiere disponibilidad de revisores y no debe bloquear indefinidamente un tag documental.
- La obra mantiene advertencias claras: caso educativo, no productivo, sin datos reales ni promesas bancarias.

## Perfiles recomendados para ronda externa posterior

| Perfil | Prioridad | Motivo |
|---|---|---|
| Arquitectura de microservicios | Alta | Validar fronteras, roadmap, ledger educativo y eventos |
| Seguridad / DevSecOps | Alta | Revisar saneamiento, secretos, threat model y controles |
| Docencia / Editorial | Alta | Revisar progresion, actividades, rubricas y uso en curso |
| Backend Java/Spring | Media | Validar modernizacion incremental, pruebas y compatibilidad |
| DevOps / SRE | Media | Validar despliegue, observabilidad y resiliencia |
| QA / Testing | Media | Validar cobertura educativa, contratos y datos sinteticos |

## Regla de uso

- Tag editorial interno: puede avanzar sin dictamen externo si el checklist final queda en `[ok]`.
- Release con PDF/HTML: requiere al menos una revision editorial interna de artefactos.
- Producto institucional, venta o curso pago: requiere revision externa o decision explicita de asumir el riesgo.
