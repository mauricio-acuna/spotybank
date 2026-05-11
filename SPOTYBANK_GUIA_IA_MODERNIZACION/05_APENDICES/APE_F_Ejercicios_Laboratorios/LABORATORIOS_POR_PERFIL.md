# Laboratorios por perfil

Este documento organiza laboratorios para usar Spotybank en cursos, talleres o formacion interna. Cada laboratorio puede ejecutarse como actividad independiente o como parte de un proyecto final.

## Perfil backend

| Item | Descripcion |
|---|---|
| Duracion | 4 a 8 horas |
| Lecturas | Capitulos 2, 4, 5 y 6 |
| Objetivo | Entender un servicio, documentarlo y proponer una mejora pequena. |
| Entregables | README de servicio, lista de riesgos, prueba propuesta y ticket tecnico. |
| Evaluacion | Claridad tecnica, evidencia, alcance pequeno y criterio de validacion. |

Secuencia:

1. Elegir un servicio.
2. Identificar dependencias y configuracion.
3. Distinguir evidencia de inferencia.
4. Proponer una prueba de caracterizacion.
5. Crear un ticket de mejora incremental.

## Perfil arquitectura

| Item | Descripcion |
|---|---|
| Duracion | 6 a 10 horas |
| Lecturas | Capitulos 2, 4, 5, 8 y 12 |
| Objetivo | Construir un mapa de dominios y decisiones arquitectonicas. |
| Entregables | Mapa de dominios, matriz de relaciones, ADR y roadmap inicial. |
| Evaluacion | Calidad del modelo, limites claros y decisiones justificadas. |

Secuencia:

1. Agrupar servicios por dominio.
2. Identificar adapters e integraciones.
3. Definir fronteras canonicas.
4. Redactar una ADR sobre `spotybank-core-ledger`.
5. Presentar tradeoffs.

## Perfil seguridad y DevSecOps

| Item | Descripcion |
|---|---|
| Duracion | 4 a 8 horas |
| Lecturas | Capitulos 3, 7 y 10 |
| Objetivo | Evaluar riesgos de publicacion, secretos y controles de pipeline. |
| Entregables | Threat model, checklist de secretos, backlog DevSecOps y evidencia de escaneo. |
| Evaluacion | No exposicion de material sensible, controles verificables y priorizacion. |

Secuencia:

1. Revisar configuracion saneada.
2. Crear lista de activos protegidos.
3. Modelar amenazas de un flujo.
4. Proponer controles de pipeline.
5. Definir evidencia de cierre.

## Perfil DevOps/SRE

| Item | Descripcion |
|---|---|
| Duracion | 6 a 12 horas |
| Lecturas | Capitulos 8 y 9 |
| Objetivo | Disenar despliegue, observabilidad y resiliencia. |
| Entregables | Ficha de despliegue, SLO educativo, runbook y plan de rollback. |
| Evaluacion | Operabilidad, monitoreo, recursos y respuesta ante fallo. |

Secuencia:

1. Elegir servicio objetivo.
2. Completar unidad minima de despliegue.
3. Definir liveness/readiness.
4. Definir SLI/SLO.
5. Proponer dashboard y alerta.
6. Crear runbook de incidente.

## Perfil QA

| Item | Descripcion |
|---|---|
| Duracion | 4 a 10 horas |
| Lecturas | Capitulos 4, 6, 9 y 10 |
| Objetivo | Crear estrategia de pruebas para modernizacion incremental. |
| Entregables | Piramide de pruebas, datos sinteticos, casos de contrato y plan de regresion. |
| Evaluacion | Cobertura por riesgo, repetibilidad y trazabilidad de casos. |

Secuencia:

1. Identificar flujos criticos.
2. Clasificar pruebas por nivel.
3. Definir datos sinteticos.
4. Proponer pruebas de contrato.
5. Definir pruebas de carga basicas.

## Perfil gestion tecnica

| Item | Descripcion |
|---|---|
| Duracion | 3 a 6 horas |
| Lecturas | Capitulos 1, 5, 10, 11 y 12 |
| Objetivo | Convertir hallazgos en plan de trabajo defendible. |
| Entregables | Roadmap de 90 dias, matriz de riesgos y presentacion ejecutiva. |
| Evaluacion | Priorizacion, claridad, alcance y dependencias explicitas. |

Secuencia:

1. Revisar status de obra y backlog.
2. Elegir tres riesgos.
3. Priorizar por impacto y esfuerzo.
4. Definir fases y responsables.
5. Preparar presentacion de 10 minutos.

## Perfil docente

| Item | Descripcion |
|---|---|
| Duracion | 4 a 8 horas |
| Lecturas | Capitulos 1, 10 y 11 |
| Objetivo | Convertir un capitulo en una clase aplicable. |
| Entregables | Unidad didactica, rubrica y guia de facilitacion. |
| Evaluacion | Adecuacion al publico, tiempos realistas y evidencia evaluable. |

Secuencia:

1. Elegir perfil de estudiantes.
2. Elegir capitulo base.
3. Definir objetivo de aprendizaje.
4. Preparar consigna y entregable.
5. Definir rubrica.

## Laboratorio integrador

| Item | Descripcion |
|---|---|
| Duracion | 12 a 24 horas |
| Participantes | Equipos mixtos |
| Objetivo | Modernizar una capacidad Spotybank en papel tecnico defendible. |
| Entregables | Diagnostico, arquitectura, seguridad, pruebas, despliegue, SLOs y roadmap. |
| Evaluacion | Coherencia entre perfiles, evidencia y capacidad de defensa. |

Dinámica sugerida:

1. Equipo backend prepara inventario.
2. Equipo arquitectura define frontera.
3. Equipo seguridad modela amenazas.
4. Equipo DevOps define runtime.
5. Equipo QA propone validacion.
6. Equipo gestion tecnica prioriza roadmap.
7. Todos defienden una decision conjunta.
