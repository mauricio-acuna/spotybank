# Rubricas de evaluacion

Las rubricas permiten evaluar entregas de Spotybank con criterios visibles. Cada criterio puede puntuarse de 1 a 4.

## Escala

| Nivel | Descripcion |
|---|---|
| 1 - Insuficiente | La entrega es incompleta, confusa o no tiene evidencia. |
| 2 - Basico | Cumple parte de la consigna pero mezcla supuestos o falta validacion. |
| 3 - Bueno | Cumple la consigna con evidencia, claridad y alcance razonable. |
| 4 - Excelente | Ademas de cumplir, anticipa riesgos, tradeoffs y proximos pasos. |

## Rubrica general

| Criterio | 1 | 2 | 3 | 4 |
|---|---|---|---|---|
| Evidencia | No cita fuentes | Cita fuentes parciales | Cita evidencia suficiente | Conecta evidencia, inferencia y decision pendiente |
| Seguridad | Expone o ignora riesgos | Menciona riesgos sin control | Evita datos sensibles y propone controles | Integra controles verificables y criterio de cierre |
| Claridad | Es dificil de seguir | Tiene estructura irregular | Es claro y navegable | Otro equipo puede continuar sin explicacion oral |
| Priorizacion | Lista sin orden | Orden parcial | Prioriza por riesgo o valor | Justifica impacto, esfuerzo y dependencias |
| Validacion | No define prueba | Define prueba vaga | Define criterio de exito | Incluye evidencia de cierre y rollback |
| Comunicacion | No adapta al lector | Usa jerga sin explicar | Comunica segun perfil | Presenta version tecnica y ejecutiva |

## Rubrica backend

| Criterio | Excelente |
|---|---|
| Lectura del servicio | Identifica proposito, dependencias, configuracion y puntos de extension. |
| Pruebas | Propone pruebas de caracterizacion antes de refactorizar. |
| Modernizacion | Divide cambios en pasos pequenos y reversibles. |
| Riesgo | Explica impacto de cambios sobre contratos y datos. |

## Rubrica arquitectura

| Criterio | Excelente |
|---|---|
| Dominio | Distingue dominio, adapter, integracion y dependencia externa. |
| Fronteras | Propone limites claros con tradeoffs. |
| Contratos | Identifica contratos existentes y pendientes. |
| Evolucion | Conecta decisiones con roadmap incremental. |

## Rubrica seguridad

| Criterio | Excelente |
|---|---|
| Saneamiento | No expone secretos ni identidad real. |
| Threat model | Relaciona activo, actor, vector, control y evidencia. |
| DevSecOps | Propone controles de pipeline y runtime. |
| Priorizacion | Ordena por impacto y urgencia. |

## Rubrica DevOps/SRE

| Criterio | Excelente |
|---|---|
| Runtime | Define imagen, configuracion, secrets, probes y recursos. |
| Observabilidad | Incluye logs, metricas, trazas y alertas. |
| Resiliencia | Considera timeouts, retries, DLQ y rollback. |
| Operacion | Entrega runbook usable. |

## Rubrica QA

| Criterio | Excelente |
|---|---|
| Estrategia | Organiza pruebas unitarias, integracion, contrato, carga y seguridad. |
| Datos | Usa datos sinteticos y repetibles. |
| Riesgo | Prioriza flujos criticos. |
| Evidencia | Define resultados esperados y criterio de aceptacion. |

## Rubrica docente

| Criterio | Excelente |
|---|---|
| Objetivo | Define aprendizaje observable. |
| Actividad | Ajusta dificultad al perfil y tiempo disponible. |
| Evaluacion | Usa rubrica clara y entregable concreto. |
| Facilitacion | Anticipa bloqueos, variantes y cierre. |

## Rubrica de proyecto final

| Criterio | Peso |
|---|---|
| Diagnostico con evidencia | 20% |
| Propuesta de arquitectura | 20% |
| Seguridad y cumplimiento educativo | 15% |
| Pruebas y calidad | 15% |
| Despliegue, observabilidad y resiliencia | 15% |
| Roadmap y presentacion ejecutiva | 15% |

Condicion de aprobacion: la entrega no puede incluir secretos, nombres reales, dominios privados ni datos no saneados.
