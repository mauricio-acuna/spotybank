# Mapa de modernizacion desde fuentes

Fecha de elaboracion: 2026-05-11

Este mapa toma la evidencia local de Spotybank y la transforma en una secuencia de modernizacion que no requiere decidir producto final, nube definitiva ni owners reales. Sirve para seguir avanzando en la obra y para preparar laboratorios por perfil.

## Principio rector

La modernizacion de Spotybank debe tratarse como una migracion por oleadas. La meta no es cambiar todas las tecnologias a la vez, sino reducir riesgo mientras se conserva comportamiento verificable.

Orden recomendado:

1. Inventario reproducible.
2. Red de pruebas.
3. Seguridad de configuracion y secretos.
4. Observabilidad.
5. Runtime Java/Spring/Camel.
6. Despliegue Kubernetes/OpenShift moderno.
7. Performance y escalamiento.
8. Producto educativo y gobierno de contribuciones.

## Oleada 1: baseline tecnico

| Accion | Evidencia que la justifica | Resultado esperado |
|---|---|---|
| Congelar inventario Maven/Java/YAML | 63 POMs, 2604 Java, 336 YAML | Saber que se moderniza y que queda fuera. |
| Generar BOM educativo | Versiones repetidas y parents compartidos | Controlar dependencias sin tocar cada POM a mano. |
| Separar servicios, commons y adapters | Padres Spring Boot, Fuse y Commons | Evitar migraciones mezcladas. |
| Crear matriz de compatibilidad | Java, Spring, Camel, CXF, Karate | Decidir caminos Java 17/21 y Spring Boot 3/4 con evidencia. |

Decisiones que si requieren equipo: version objetivo final, soporte comercial, compatibilidad con plataforma y calendario de corte.

## Oleada 2: pruebas como red de seguridad

| Accion | Evidencia que la justifica | Resultado esperado |
|---|---|---|
| Migrar Karate/JUnit 4 a Karate JUnit 5 | Presencia alta de Karate, Cucumber y JUnit 4 | Mantener pruebas API ejecutables en toolchain moderna. |
| Crear pruebas contractuales para adapters SOAP | CXF/SOAP/WSDL y rutas Camel | Proteger integraciones externas durante refactor. |
| Agregar Testcontainers para Mongo/JMS | Mongo, JPA y JMS en fuentes | Probar con dependencias reales sin ambiente corporativo. |
| Crear fixtures saneados | Proyecto educativo publicable | Evitar datos reales y permitir laboratorios reproducibles. |

Regla de oro: no modernizar runtime sin una prueba que preserve al menos el flujo feliz y dos escenarios de error por servicio critico.

## Oleada 3: seguridad de configuracion

| Accion | Evidencia que la justifica | Resultado esperado |
|---|---|---|
| Auditar `application*.properties` | 132 archivos de propiedades | Separar secretos, endpoints y valores por ambiente. |
| Reemplazar secretos planos por referencias seguras | `secretKeyRef` en YAML | Reducir exposicion y preparar rotacion. |
| Cifrar y gobernar Secrets de cluster | Uso de Secrets de Kubernetes/OpenShift | Aplicar RBAC, cifrado en reposo y minimo privilegio. |
| Crear checklist ASVS/API Top 10 | APIs, Swagger/Springfox y servicios REST | Convertir seguridad en requisitos verificables. |

Esta oleada se puede escribir como fasciculo para seguridad, DevSecOps y arquitectura.

## Oleada 4: observabilidad primero

| Accion | Evidencia que la justifica | Resultado esperado |
|---|---|---|
| Introducir correlation id | REST, JMS y adapters externos | Seguir una transaccion entre servicios. |
| Activar OpenTelemetry Java Agent | Servicios Java con Spring/Camel | Trazas y metricas iniciales sin gran refactor. |
| Normalizar logs | Workers JMS y adapters | Evitar payloads sensibles y facilitar diagnostico. |
| Definir dashboards por dominio | MFA, notificaciones, auth, ledger | Operar por capacidad funcional, no solo por pod. |

La observabilidad debe llegar antes del escalamiento. Escalar un sistema opaco suele amplificar errores.

## Oleada 5: resiliencia y adapters

| Accion | Evidencia que la justifica | Resultado esperado |
|---|---|---|
| Reemplazar Hystrix | 115 lineas con patrones Hystrix | Circuit breakers actuales con metricas. |
| Definir timeouts por dependencia | Rutas SOAP/Camel | Fallos acotados y trazables. |
| Crear DLQ y redelivery por cola | Workers JMS | Procesamiento asincronico auditable. |
| Documentar idempotencia | Eventos y actualizaciones | Evitar duplicados en retries. |

Opcion recomendada para la obra: explicar Hystrix como deuda historica y Resilience4j/Spring Cloud CircuitBreaker como camino moderno.

## Oleada 6: APIs y eventos contract-first

| Accion | Evidencia que la justifica | Resultado esperado |
|---|---|---|
| Migrar Springfox a springdoc/OpenAPI 3 | Alta presencia Swagger/Springfox | Contratos REST actuales y automatizables. |
| Crear AsyncAPI para mensajes | JMS y workers dispersos | Eventos documentados con payload, canal y errores. |
| Versionar contratos | Multiples microservicios consumidores | Cambios compatibles y gobernados. |
| Agregar pruebas de compatibilidad | APIs y mensajes | Evitar regresiones en integraciones. |

La obra puede usar esta oleada para enseñar que documentar APIs no es decorar endpoints: es definir contratos operables.

## Oleada 7: despliegue cloud native

| Accion | Evidencia que la justifica | Resultado esperado |
|---|---|---|
| Migrar `DeploymentConfig` a `Deployment` cuando aplique | OpenShift moderno recomienda `Deployment` salvo necesidad especifica | Manifiestos mas alineados a Kubernetes. |
| Agregar probes por servicio | Solo un YAML con probes detectadas | Health real, rollout seguro y trafico controlado. |
| Definir `requests` y `limits` | 59 YAML con `resources: {}` | Scheduling fiable y base para HPA. |
| Agregar HPA por metrica | Replicas fijas y necesidad de escalamiento | Escalamiento horizontal gobernado. |
| Introducir GitOps | Muchas piezas YAML | Cambios auditables, reproducibles y revisables. |

Escenario adecuado inicial: cluster Kubernetes/OpenShift no productivo, con namespace por equipo, registry educativo, secretos ficticios, observabilidad activa y pipelines controlados. Para produccion bancaria real se requiere residencia de datos, compliance, DR, cifrado, auditoria, soporte y revisiones de riesgo.

## Oleada 8: performance

| Accion | Evidencia que la justifica | Resultado esperado |
|---|---|---|
| Definir presupuesto de latencia por flujo | REST, SOAP, JMS y DB | SLOs tecnicos por caso de uso. |
| Medir pools y timeouts | Rutas externas y bases de datos | Evitar saturacion silenciosa. |
| Probar carga con escenarios realistas | Notificaciones, MFA y ledger | Dimensionamiento inicial. |
| Revisar indices y queries | Mongo/JPA | Reducir latencia y costos. |

La obra debe evitar prometer mejoras de performance sin medicion. Lo correcto es proponer hipotesis y experimentos.

## Oleada 9: supply chain y publicacion educativa

| Accion | Evidencia que la justifica | Resultado esperado |
|---|---|---|
| Generar SBOM | Multiples dependencias Maven | Inventario de componentes. |
| Firmar artefactos | Publicacion educativa y reproducible | Trazabilidad de builds. |
| Agregar provenance/SLSA | Necesidad de confianza en entregables | Cadena de suministro verificable. |
| Mantener repo editorial separado | Obra ya versionada aparte | Evitar publicar codigo sensible accidentalmente. |

## Roadmap por perfiles

| Perfil | Primer bloque util | Entregable |
|---|---|---|
| Backend | Oleadas 1, 2, 5 y 6 | Servicio migrado con pruebas y contrato. |
| Arquitectura | Oleadas 1, 5, 6 y 7 | Decision records y mapa de dominios. |
| Seguridad | Oleadas 3 y 9 | Checklist ASVS/API, secreto saneado y SBOM. |
| DevOps/SRE | Oleadas 4, 7 y 8 | Manifiesto con probes, resources, HPA y dashboard. |
| QA | Oleada 2 | Suite Karate/JUnit 5 y fixtures saneados. |
| Docencia | Todas por fasciculos | Guia de clase, laboratorio y rubrica. |

## Pendientes que no conviene cerrar sin decision

- Version objetivo final: Java 17 o Java 21 como runtime principal.
- Camino Spring Boot 3.x o 4.x segun compatibilidad Jakarta y librerias.
- Plataforma final: Kubernetes generico, OpenShift, nube publica, nube privada o hibrida.
- Estrategia de secretos: Kubernetes Secrets endurecidos, vault externo o servicio gestionado.
- Licencia final de la obra.
- Release/tag publico de version estable.

