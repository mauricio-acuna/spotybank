# Notas de investigacion - Capitulo 04

## Fuentes revisadas

- `Documentacion/microservicios/README.md`
- `Documentacion/arquitectura/matriz-relaciones.md`
- `Documentacion/arquitectura/catalogo-endpoints-rutas.md`
- `Documentacion/arquitectura/catalogo-mensajeria.md`
- `Documentacion/runbooks/incidentes-comunes.md`
- `Documentacion/gobernanza/definicion-done-documentacion.md`
- `SPOTYBANK_GUIA_IA_MODERNIZACION/02_PLANIFICACION/MAPA_EVIDENCIAS_SPOTYBANK.md`
- `SPOTYBANK_GUIA_IA_MODERNIZACION/09_REVISIONES/CHECKLIST_REVISION_TECNICA_EDITORIAL.md`

## Ideas clave

- La documentacion viva debe tratarse como parte del sistema, no como cierre decorativo.
- README por servicio, catalogos, matrices y runbooks resuelven necesidades distintas.
- La documentacion generada sirve para arrancar, pero debe diferenciarse de la validada.
- La documentacion operacional conecta arquitectura con respuesta ante incidentes.
- La gobernanza documental necesita controles simples en PR, release, incidente y refactor.
- La IA acelera mapas y borradores, pero debe marcar evidencia, inferencia y decision pendiente.

## Argumento editorial

El capitulo debe mostrar que una modernizacion sin documentacion viva vuelve a crear oscuridad. En Spotybank, documentar no es narrar lo que ya se hizo; es construir instrumentos para decidir, operar, ensenar y sostener cambios.

La idea central es que cada pieza documental debe tener una funcion concreta. Un README orienta. Una matriz muestra acoplamientos. Un catalogo de endpoints describe superficie tecnica. Un catalogo de mensajeria reduce riesgo asincronico. Un runbook permite actuar bajo presion.

## Decisiones cerradas

- Mantener README por microservicio como puerta de entrada.
- Usar documentacion por funcionalidad para flujos transversales.
- Tratar la matriz de relaciones como evidencia para priorizar refactors.
- Separar documentacion generada, validada y operacional.
- Incluir definicion de done documental como criterio de modernizacion.
- Cerrar el capitulo con criterios verificables para README, fichas vivas, matrices, catalogos, runbooks, gobernanza e IA documental.
- Registrar que no quedan pendientes editoriales internos para el capitulo 4 en el ciclo `v0.2-editorial`.

## Mejoras futuras no bloqueantes

- Crear ejemplos resueltos de fichas vivas por funcionalidad.
- Conectar catalogos con enlaces navegables desde README principal.
- Agregar un template reusable de README por servicio.
- Revisar runbooks con perfil DevOps/SRE externo antes de una edicion formal.
