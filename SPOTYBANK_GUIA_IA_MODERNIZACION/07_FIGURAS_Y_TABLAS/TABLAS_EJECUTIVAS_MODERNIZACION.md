# Tablas ejecutivas de modernizacion

Fecha de elaboracion: 2026-05-12

Estas tablas resumen la propuesta de modernizacion de Spotybank en formato reutilizable para capitulos, fasciculos, presentaciones y revision por perfiles. Son material propio, derivado de la evidencia local y de las referencias de modernizacion registradas en la obra.

## TAB_002 - Inventario tecnico base

| Dimension | Evidencia local | Riesgo si no se gestiona | Uso educativo |
|---|---:|---|---|
| POMs Maven | 63 | Dependencias duplicadas, versiones divergentes, upgrades inseguros | Ensena lectura de build y BOM. |
| Java | 2604 archivos | Cambios masivos sin mapa de impacto | Ensena inventario y slicing. |
| Properties | 132 archivos | Configuracion dispersa y secretos mal gobernados | Ensena saneamiento y externalizacion. |
| Dockerfiles | 47 | Imagenes inconsistentes o base obsoleta | Ensena estandarizacion container. |
| Compose | 47 | Entornos locales no alineados | Ensena laboratorio reproducible. |
| YAML/OpenShift | 336 | Operacion no cloud native completa | Ensena probes, resources y HPA. |

## TAB_003 - Relacion entre evidencia y capitulos

| Evidencia | Capitulos donde aporta | Pregunta que ayuda a responder |
|---|---|---|
| POMs y dependencias | 2, 6, 12 | Que stack existe y como modernizarlo. |
| Java y rutas | 2, 4, 5, 6 | Donde estan las fronteras tecnicas reales. |
| JMS/workers | 5, 9 | Como se procesan eventos y reintentos. |
| Camel/SOAP/CXF | 5, 6, 9 | Que adapters externos condicionan la migracion. |
| Swagger/Springfox | 6, 7 | Como actualizar contratos API. |
| Karate/JUnit | 5, 6 | Que red de seguridad puede preservarse. |
| YAML/OpenShift | 8, 9 | Que falta para operar cloud native. |
| Configuracion sensible | 3, 7 | Que debe sanearse antes de publicar. |

## TAB_004 - Oleadas de modernizacion

| Oleada | Nombre | Objetivo | Entregable |
|---:|---|---|---|
| 1 | Baseline tecnico | Saber que se moderniza | Inventario reproducible y BOM educativo. |
| 2 | Pruebas | Preservar comportamiento | Suite de regresion y contratos. |
| 3 | Seguridad de configuracion | Evitar exposicion | Checklist de secretos y hardening. |
| 4 | Observabilidad | Ver antes de escalar | Correlation id, traces, metricas y logs. |
| 5 | Resiliencia y adapters | Aislar fallos externos | Timeouts, circuit breakers, DLQ e idempotencia. |
| 6 | APIs y eventos contract-first | Gobernar integraciones | OpenAPI/AsyncAPI y versionado. |
| 7 | Cloud native | Operar con plataforma moderna | Deployment, probes, resources, HPA y GitOps. |
| 8 | Performance | Medir y optimizar | Plan de carga y SLO educativo. |
| 9 | Supply chain | Confiar en entregables | SBOM, firma y provenance. |

## TAB_005 - Matriz de decision tecnica

| Decision | Puede prepararse sin equipo | Requiere decision externa | Evidencia necesaria |
|---|---|---|---|
| Elegir Java 17 o 21 | Si, con matriz comparativa | Si | Compatibilidad de librerias y plataforma. |
| Migrar Spring Boot | Si, con piloto | Si | Versiones parent, Jakarta, pruebas. |
| Migrar Camel/Fuse | Si, por adapter piloto | Si | Rutas criticas, contratos SOAP, timeouts. |
| Sustituir Hystrix | Si | Parcial | Politica de resiliencia por dominio. |
| Cambiar plataforma cloud | Si, con escenario educativo | Si | Nube objetivo, compliance, redes, DR. |
| Publicar v0.1 | Si, con checklist | Si | Licencia y revision humana. |

## TAB_006 - Backlog por perfil

| Perfil | Primer ticket recomendado | Evidencia de cierre |
|---|---|---|
| Backend | Crear matriz de dependencias por servicio piloto | POM auditado, riesgos y propuesta de upgrade. |
| Arquitectura | Dibujar bounded contexts de Spotybank | Diagrama y ADR con fronteras. |
| Seguridad | Ejecutar checklist de publicacion segura | Escaneo sin hallazgos y reporte. |
| DevOps/SRE | Agregar probes/resources a manifiesto modelo | YAML educativo y explicacion. |
| QA | Migrar caso de prueba modelo a JUnit 5 | Prueba ejecutable o pseudocodigo validado. |
| Performance | Definir SLI/SLO para flujo critico | Tabla de metricas y plan de carga. |
| Docencia | Armar programa de curso de 24 h | Agenda, practicas y rubrica. |

## TAB_007 - Riesgos futuros y resolucion

| Riesgo | Sintoma probable | Resolucion propuesta |
|---|---|---|
| Upgrade masivo sin pruebas | Fallos cruzados dificiles de aislar | Migrar por servicio piloto y contrato. |
| Logs con datos sensibles | Exposicion en consola o plataforma | Sanitizar payloads y usar correlation id. |
| HPA sin requests | Escalamiento erratico | Definir CPU/memoria antes de autoscaling. |
| Retry sin idempotencia | Duplicacion de operaciones | Idempotency key, DLQ y compensacion. |
| Contratos no versionados | Clientes rotos por cambios | OpenAPI/AsyncAPI versionados. |
| Secretos tratados como config normal | Fuga o rotacion manual | Vault/Secrets endurecidos y RBAC. |
| Adapter externo acoplado | Caida de proveedor impacta core | Capa anticorrupcion, timeout y circuit breaker. |

## TAB_008 - Escenarios de despliegue

| Escenario | Adecuado para | No adecuado para | Requisitos minimos |
|---|---|---|---|
| Local con Compose | Laboratorio, onboarding, pruebas educativas | Validar escalamiento real | Datos ficticios y servicios simulados. |
| Kind/Minikube | Taller cloud native basico | Performance y HA | Manifiestos reducidos y registry local. |
| OpenShift educativo | DevOps/SRE, rutas, build y deployment | Cargas productivas reales | Namespace aislado y secretos ficticios. |
| Kubernetes gestionado | Piloto tecnico avanzado | Sin gobierno cloud | IAM, red, observabilidad y costos. |
| Produccion bancaria real | Solo con aprobacion formal | Cursos sin compliance | Seguridad, DR, auditoria, residencia de datos y SLOs reales. |

## TAB_009 - SLIs educativos por dominio

| Dominio | SLI sugerido | Medicion minima |
|---|---|---|
| Autenticacion | Latencia p95 de login educativo | Traces REST y metricas HTTP. |
| MFA | Tiempo de procesamiento de challenge | Correlation id entre request y worker. |
| Notificaciones | Edad maxima de mensaje en cola | Metrica broker y DLQ. |
| Accounts | Error rate de consulta de cuenta | HTTP status, DB latency y logs. |
| Ledger propuesto | Consistencia de asiento transaccional | Prueba de idempotencia y compensacion. |
| Adapters externos | Timeout rate por dependencia | Circuit breaker y traces. |

## TAB_013 - Madurez cloud native

| Nivel | Caracteristica | Evidencia esperada |
|---|---|---|
| 0 | Corre localmente | Compose o ejecucion Maven. |
| 1 | Corre en contenedor | Dockerfile funcional. |
| 2 | Despliega en cluster | Deployment/Service/Route o Ingress. |
| 3 | Opera con salud | Probes y logs estructurados. |
| 4 | Escala con control | Requests, limits y HPA. |
| 5 | Observa y recupera | Traces, metricas, DLQ y runbooks. |
| 6 | Entrega confiable | GitOps, SBOM, firma y provenance. |

## TAB_014 - Evaluacion educativa

| Criterio | Excelente | A mejorar |
|---|---|---|
| Evidencia | Cada afirmacion apunta a fuente o documento | Hay afirmaciones sin soporte. |
| Seguridad | No se expone identidad ni secretos | Hay valores reales o ambiguos. |
| Arquitectura | Dominios, adapters y contratos quedan claros | Se mezclan carpetas con dominios. |
| Modernizacion | Hay oleadas, pruebas y rollback | Se propone cambio masivo. |
| Operacion | Incluye probes, resources, metricas y runbooks | Solo describe despliegue basico. |
| Comunicacion | El entregable sirve a otro perfil | El documento solo sirve al autor. |
