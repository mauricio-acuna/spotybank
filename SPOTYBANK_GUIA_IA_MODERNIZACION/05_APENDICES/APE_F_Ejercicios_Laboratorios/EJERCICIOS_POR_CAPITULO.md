# Ejercicios por capitulo

Este apendice convierte cada capitulo de la obra Spotybank en actividades practicas. Los ejercicios estan pensados para ejecutarse con evidencia saneada, sin datos reales, sin secretos y sin referencias a entidades externas al caso educativo.

## Reglas comunes

- Usar siempre la identidad publica `Spotybank`.
- No copiar secretos, tokens, endpoints privados ni datos reales.
- Distinguir evidencia, inferencia, decision pendiente y recomendacion.
- Entregar resultados en Markdown.
- Incluir fuentes consultadas dentro del workspace.
- Actualizar el status de la obra cuando una actividad cambie el alcance.

## Capitulo 1 - Introduccion

| Item | Descripcion |
|---|---|
| Objetivo | Explicar por que Spotybank es un caso educativo valido. |
| Actividad | Redactar una ficha de una pagina que describa publico objetivo, valor formativo, limites y riesgos del caso. |
| Entregable | `FICHA_USO_EDUCATIVO.md` |
| Evidencia | Capitulo 1, ficha de proyecto y status de obra. |
| Criterio de exito | La ficha puede ser leida por un docente o lider tecnico sin conocer el repositorio. |

Preguntas guia:

- Que problema de aprendizaje resuelve Spotybank?
- Que perfiles pueden usar el caso?
- Que no debe prometer la obra?
- Que riesgos aparecen al usar material heredado como caso educativo?

## Capitulo 2 - Inventario tecnico inicial

| Item | Descripcion |
|---|---|
| Objetivo | Practicar lectura ordenada de un sistema de microservicios. |
| Actividad | Elegir tres servicios y construir una tabla con proposito, tecnologia, dependencias, configuracion y riesgos. |
| Entregable | `INVENTARIO_3_SERVICIOS.md` |
| Evidencia | README de microservicios, vision general y matriz de relaciones. |
| Criterio de exito | Cada afirmacion indica si es evidencia o inferencia. |

Preguntas guia:

- Que servicio parece ser core y cual parece adapter?
- Que dependencias se repiten?
- Que informacion requiere validacion externa?

## Capitulo 3 - Anonimizacion y rebranding seguro

| Item | Descripcion |
|---|---|
| Objetivo | Practicar saneamiento antes de publicar material tecnico. |
| Actividad | Crear un checklist de publicacion segura para un repositorio educativo. |
| Entregable | `CHECKLIST_PUBLICACION_SEGURA.md` |
| Evidencia | Capitulo 3, refactor de identidad y scripts de publicacion. |
| Criterio de exito | El checklist bloquea secretos, nombres reales, dominios privados y archivos comprimidos no saneados. |

Preguntas guia:

- Que diferencia hay entre renombrar y sanear?
- Que archivos nunca deberian publicarse?
- Como se documenta una sustitucion por placeholder?

## Capitulo 4 - Documentacion viva de microservicios

| Item | Descripcion |
|---|---|
| Objetivo | Convertir inspeccion tecnica en documentacion mantenible. |
| Actividad | Mejorar el README de un servicio ficticio o crear una plantilla reutilizable. |
| Entregable | `PLANTILLA_README_SERVICIO.md` |
| Evidencia | README por servicio, catalogos y matriz de relaciones. |
| Criterio de exito | La plantilla incluye proposito, endpoints, dependencias, configuracion, riesgos y pruebas. |

Preguntas guia:

- Que necesita saber una persona nueva para trabajar en el servicio?
- Que informacion pertenece al README y que informacion pertenece a arquitectura?

## Capitulo 5 - Dominios bancarios y fronteras

| Item | Descripcion |
|---|---|
| Objetivo | Identificar dominios y responsabilidades. |
| Actividad | Crear un mapa de bounded contexts para `spotybank-auth`, `spotybank-accounts` y `spotybank-core-ledger`. |
| Entregable | `MAPA_DOMINIOS_SPOTYBANK.md` |
| Evidencia | Servicios canonicos y matriz de relaciones. |
| Criterio de exito | El mapa diferencia dominio, adapter, dependencia externa y decision pendiente. |

Preguntas guia:

- Que responsabilidad no debe quedar dentro de auth?
- Por que ledger merece frontera propia?
- Que integraciones requieren anti-corruption layer?

## Capitulo 6 - Modernizacion de backend

| Item | Descripcion |
|---|---|
| Objetivo | Disenar una ruta de modernizacion incremental. |
| Actividad | Proponer tres oleadas de upgrade para un conjunto de servicios. |
| Entregable | `PLAN_MODERNIZACION_BACKEND.md` |
| Evidencia | Capitulo 6, roadmap y backlog tecnico. |
| Criterio de exito | El plan evita Big Bang, incluye pruebas y define rollback. |

Preguntas guia:

- Que se debe medir antes de migrar?
- Que cambios pueden hacerse sin tocar negocio?
- Que tests protegen el comportamiento existente?

## Capitulo 7 - Seguridad y DevSecOps

| Item | Descripcion |
|---|---|
| Objetivo | Convertir riesgos en controles verificables. |
| Actividad | Crear un mini threat model para un flujo de autenticacion o MFA. |
| Entregable | `THREAT_MODEL_FLUJO.md` |
| Evidencia | Seguridad y riesgos, inventario sensible y capitulo 7. |
| Criterio de exito | Cada amenaza tiene control existente, control faltante y evidencia de cierre. |

Preguntas guia:

- Que activo se protege?
- Que actor podria abusar del flujo?
- Que controles pertenecen a aplicacion y cuales a plataforma?

## Capitulo 8 - Despliegue cloud native

| Item | Descripcion |
|---|---|
| Objetivo | Definir la unidad minima de despliegue de un servicio. |
| Actividad | Completar una ficha runtime para un servicio Spotybank. |
| Entregable | `FICHA_DESPLIEGUE_SERVICIO.md` |
| Evidencia | Despliegue nube, matriz de despliegue y capitulo 8. |
| Criterio de exito | Incluye imagen, puerto, config, secrets ficticios, probes, recursos y smoke test. |

Preguntas guia:

- Que diferencia hay entre liveness y readiness?
- Que configuracion no deberia estar dentro de la imagen?
- Como se valida un despliegue exitoso?

## Capitulo 9 - Performance, escalamiento y resiliencia

| Item | Descripcion |
|---|---|
| Objetivo | Disenar una prueba de carga con hipotesis. |
| Actividad | Definir SLI, SLO educativo, carga, datos sinteticos y criterio de exito para un flujo. |
| Entregable | `PLAN_PRUEBA_CARGA.md` |
| Evidencia | Escalamiento/performance, runbooks y catalogo de mensajeria. |
| Criterio de exito | La prueba es repetible y explica que decision habilita. |

Preguntas guia:

- Que mide p95?
- Por que CPU no siempre alcanza para autoscaling?
- Que ocurre si se reintenta una operacion no idempotente?

## Capitulo 10 - IA como acelerador

| Item | Descripcion |
|---|---|
| Objetivo | Usar IA con trazabilidad y seguridad. |
| Actividad | Tomar un hallazgo tecnico y convertirlo en evidencia, inferencia, decision pendiente y ticket. |
| Entregable | `HALLAZGO_ASISTIDO_IA.md` |
| Evidencia | Capitulo 10, backlog y registro de bloqueos. |
| Criterio de exito | El texto no presenta inferencias como hechos y no expone informacion sensible. |

Preguntas guia:

- Que parte salio de archivos?
- Que parte fue deduccion?
- Que parte requiere owner?
- Que validacion cerraria el hallazgo?

## Capitulo 11 - Spotybank como curso

| Item | Descripcion |
|---|---|
| Objetivo | Disenar una unidad formativa. |
| Actividad | Crear una clase de 2 horas basada en un capitulo de la obra. |
| Entregable | `UNIDAD_DIDACTICA_2H.md` |
| Evidencia | Capitulo 11 y plan por fasciculos. |
| Criterio de exito | La unidad incluye objetivo, actividad, entregable, rubrica y tiempos. |

Preguntas guia:

- Que perfil aprende con esta unidad?
- Que evidencia debe entregar?
- Como se adapta a nivel inicial o avanzado?

## Capitulo 12 - Roadmap de evolucion

| Item | Descripcion |
|---|---|
| Objetivo | Priorizar evolucion por capacidades. |
| Actividad | Crear un roadmap de 90 dias para Spotybank. |
| Entregable | `ROADMAP_90_DIAS.md` |
| Evidencia | Roadmap, backlog y capitulo 12. |
| Criterio de exito | El roadmap separa fases, responsables, riesgos, dependencias y evidencia de cierre. |

Preguntas guia:

- Que debe quedar fuera del alcance?
- Que capacidad habilita la siguiente?
- Como se medira avance real?

## Entrega integradora

Cada equipo debe elegir tres ejercicios de capitulos distintos y producir una entrega integrada. Ejemplo:

- Inventario de un servicio.
- Ficha de despliegue.
- Plan de prueba de carga.

La entrega debe incluir una seccion final: `Decisiones tomadas y evidencia`.
