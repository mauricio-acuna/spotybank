# APENDICE B - Glosario tecnico

| Termino | Definicion | Referencia |
|---|---|---|
| ADR | Registro breve de una decision arquitectonica, su contexto, alternativas, tradeoffs y consecuencias. | Cap. 5, 12 |
| Adapter | Componente que traduce o aisla una integracion externa para reducir acoplamiento con el dominio. | Cap. 5, 6 |
| Anti-corruption layer | Capa que protege el modelo interno frente a contratos, vocabularios o fallos de sistemas externos. | Cap. 5 |
| API | Interfaz que permite que sistemas o servicios intercambien operaciones y datos mediante contratos definidos. | Cap. 2, 5, 7 |
| Backlog | Lista priorizada de trabajo tecnico, riesgos o mejoras con evidencia, impacto y criterio de cierre. | Cap. 6, 7, 10, 12 |
| Bounded context | Frontera conceptual donde un modelo de dominio mantiene significado propio y reglas consistentes. | Cap. 5 |
| ConfigMap | Recurso de Kubernetes/OpenShift para externalizar configuracion no sensible de una aplicacion. | Cap. 8 |
| DLQ | Cola de mensajes fallidos que permite aislar errores, diagnosticar causas y reprocesar con control. | Cap. 9 |
| Cloud native | Enfoque de construccion y operacion pensado para contenedores, automatizacion, escalamiento, resiliencia y observabilidad. | Cap. 8 |
| DevSecOps | Integracion de seguridad en el ciclo de desarrollo, entrega y operacion del software. | Cap. 7 |
| Evidencia local | Informacion observada directamente en archivos, configuracion, codigo, documentos o resultados verificables del workspace. | Cap. 1, 2, 10 |
| GitOps | Practica de operar cambios de plataforma desde repositorios versionados, revisionados y reversibles. | Cap. 8 |
| HPA | Mecanismo de autoscaling horizontal basado en metricas, requests y comportamiento entendido de la carga. | Cap. 8, 9 |
| IA como copiloto | Uso de inteligencia artificial para acelerar lectura, documentacion, diagnostico y propuestas, manteniendo revision humana. | Cap. 1, 10 |
| Idempotencia | Propiedad de una operacion que permite repetirla sin producir efectos duplicados no deseados. | Cap. 9, 12 |
| Inferencia | Conclusion razonable derivada de evidencia parcial, pero que requiere validacion antes de tratarse como hecho. | Cap. 1, 10 |
| Kubernetes/OpenShift | Plataformas de orquestacion usadas como referencia educativa para despliegue, configuracion, escalamiento y operacion. | Cap. 8 |
| Legacy | Sistema heredado que conserva valor funcional, pero acumula deuda tecnica, restricciones historicas o dependencias antiguas. | Cap. 1, 6 |
| Microservicio | Servicio desplegable de forma independiente, con responsabilidad acotada y comunicacion mediante contratos. | Cap. 2, 5 |
| Observabilidad | Capacidad de entender el estado interno de un sistema a partir de logs, metricas, trazas y eventos. | Cap. 8, 9 |
| Owner | Persona o rol con autoridad para confirmar decisiones, criticidad, contratos, metricas o alcance real. | Cap. 1, 10, 12 |
| Placeholder | Valor ficticio usado para reemplazar datos sensibles o no publicables. | Cap. 3 |
| Probe | Verificacion de salud usada por la plataforma para saber si un servicio esta vivo, listo o debe reiniciarse. | Cap. 8 |
| Rollback | Estrategia para volver a un estado anterior cuando una oleada, despliegue o cambio no cumple criterios de salida. | Cap. 6, 8 |
| Runbook | Guia operativa que describe sintomas, diagnostico, acciones seguras, escalamiento y evidencia de cierre. | Cap. 4, 8, 9 |
| SBOM | Inventario de componentes de software usado para trazabilidad, seguridad de dependencias y supply chain. | Cap. 7 |
| SLI | Indicador de nivel de servicio que mide una propiedad observable, como latencia, error rate o edad de cola. | Cap. 9 |
| SLO | Objetivo de nivel de servicio usado para orientar calidad operativa de forma medible. En esta obra se usa con fines educativos. | Cap. 9 |
| SRE | Disciplina que combina ingenieria y operacion para confiabilidad, observabilidad, resiliencia y respuesta ante incidentes. | Cap. 8, 9 |
| Spotybank | Caso educativo ficticio para estudiar modernizacion de microservicios bancarios. | Cap. 1 |
| Threat model | Modelo que relaciona activos, actores, vectores, controles y evidencia para razonar sobre riesgos de seguridad. | Cap. 7 |
| Validacion externa | Confirmacion que requiere revisor, owner, ambiente, metrica, traza o contexto fuera de la evidencia disponible. | Cap. 2, 10, 12 |
