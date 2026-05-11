# Evidencia desde fuentes de microservicios

Fecha de relevamiento: 2026-05-11

Este documento registra evidencia obtenida directamente desde el workspace local de Spotybank. Su objetivo editorial es separar lo observado en codigo, configuracion y manifiestos de despliegue de las propuestas de mejora. No reemplaza una validacion con owners, metricas reales, trazas productivas ni ambientes.

## Alcance inspeccionado

| Categoria | Conteo observado | Lectura editorial |
|---|---:|---|
| `pom.xml` | 63 | Ecosistema Maven amplio, con padres compartidos y artefactos de servicio, commons y adapters. |
| Java | 2604 | Base backend grande, con mezcla de controladores, rutas, workers, adapters, modelos y pruebas. |
| `application*.properties` | 132 | Configuracion muy externalizada, util para documentar dependencias y riesgo operacional. |
| Dockerfile | 47 | Hay empaquetado containerizado por varios modulos. |
| Docker Compose | 47 | Hay soporte local o de integracion, util para laboratorios educativos. |
| YAML/OpenShift/Kubernetes | 336 | Hay despliegue declarativo, principalmente con objetos de plataforma y configuracion externa. |

## Tecnologias observadas

| Senal en fuentes | Evidencia local | Interpretacion |
|---|---|---|
| Spring Boot | Padres `spotybank-parent-springboot`, starters y Actuator en multiples POMs | Servicios REST y workers Java con convenciones Spring. |
| Apache Camel/Fuse | Padres `spotybank-parent-fuse`, dependencias Camel, rutas y `RouteBuilder` | Capa de integracion con adapters, transformaciones y llamadas externas. |
| SOAP/CXF | Dependencias CXF, WSDL y rutas SOAP | Integracion con sistemas externos heredados o contratos formales. |
| JMS/ActiveMQ | `spring-boot-starter-activemq`, `@JmsListener` y workers | Procesamiento asincronico de eventos, actualizaciones y notificaciones. |
| MongoDB/JPA | Starters Mongo/JPA, repositorios y configuracion de datos | Persistencia mixta, con dominios documentales y relacionales. |
| Swagger/Springfox | Dependencias y anotaciones de documentacion API | Documentacion de APIs anterior al stack OpenAPI moderno. |
| Karate/JUnit | Dependencias `karate-*`, JUnit 4 y reportes Cucumber | Pruebas funcionales/API existentes, valiosas para preservar comportamiento. |
| OpenShift | `DeploymentConfig`, `BuildConfig`, `Route`, `ConfigMap`, `Secret` | Plataforma historica basada en OpenShift; conviene migrar por oleadas. |

## Hallazgos por tipo de fuente

### Maven

Los POMs muestran una arquitectura con padres compartidos y dependencias comunes. Las senales mas repetidas incluyen:

- `spotybank-parent-springboot`
- `spotybank-parent-fuse`
- `spotybank-parent-commons`
- `maven-jar-plugin`
- `spring-boot-starter-activemq`
- `spring-boot-starter-data-mongodb`
- `spring-boot-starter-data-jpa`
- `camel-cxf`
- `camel-hystrix-starter`
- `cxf-codegen-plugin`
- `swagger-annotations`
- `karate-junit4`
- `karate-apache`
- `cucumber-reporting`

Lectura para la obra: Spotybank es un buen caso de modernizacion porque combina servicios Spring, integraciones Camel, contratos SOAP, mensajeria, persistencia mixta y un set de pruebas que puede servir como red de seguridad.

### Java

Patrones relevantes encontrados:

- 6 consumidores JMS con `@JmsListener`.
- 115 lineas con patrones asociados a Hystrix.
- 118 lineas con controladores REST, DSL REST o endpoints.
- 188 lineas con rutas Camel.
- 400 lineas asociadas a Mongo, JPA o repositorios.
- 989 lineas asociadas a Swagger, API docs o Springfox.
- 844 lineas asociadas a Karate/Cucumber.
- 3192 lineas asociadas a CXF, SOAP o WSDL.

Lectura para la obra: el material permite explicar patrones de microservicios reales sin inventar ejemplos artificiales. Tambien permite armar ejercicios de lectura de codigo, modernizacion por contrato, refactor de adapters y pruebas de regresion.

### Mensajeria

Workers con `@JmsListener` observados:

- `cap-mfa-updater-master/.../MultifactorWorker.java`
- `pom-whatsapp-consumer-master/.../WhatsappMessageConsumerWorker.java`
- `pom-whatsapp-persistence-master/.../WhatsappPersistenceConsumerWorker.java`
- `pom-whatsapp-updater-master/.../WhatsappUpdaterConsumerWorker.java`
- `spotybank-auth-master/.../Listener.java`

Riesgos derivados:

- Reintentos y DLQ no deben quedar implicitos.
- Conviene definir idempotencia por mensaje.
- El log de payloads debe revisarse para evitar exposicion de datos personales o tokens.
- La trazabilidad debe incluir correlation id y resultado de procesamiento.

Resolucion propuesta:

- Crear contratos de mensajes.
- Definir DLQ por canal.
- Agregar redelivery policy documentada.
- Agregar pruebas de idempotencia.
- Sanitizar logs antes de publicar o ejecutar en ambientes compartidos.

### Integraciones Camel/SOAP

Se observaron rutas Camel con adapters SOAP, timeouts y fallback. Esto es muy util para explicar el patron de capa anticorrupcion: Spotybank puede mantener contratos externos mientras moderniza gradualmente su core interno.

Riesgos derivados:

- Dependencia de contratos externos y timeouts.
- Posible mezcla de logica de transformacion y resiliencia.
- Riesgo de fallback generico que oculte fallos reales.
- Dificultad para probar escenarios de latencia y error.

Resolucion propuesta:

- Encapsular cada adapter externo con contrato, timeout, circuit breaker y metricas propias.
- Agregar pruebas contractuales con fixtures saneados.
- Separar transformacion, llamada externa y manejo de error.
- Documentar politica de fallback por criticidad funcional.

### Despliegue

Senales de plataforma encontradas:

- 44 archivos YAML con referencias a `configMapKeyRef`.
- 25 archivos YAML con referencias a `secretKeyRef`.
- Solo 1 archivo YAML con `readinessProbe` o `livenessProbe`.
- 59 archivos YAML con `resources: {}`.
- Alta presencia de `DeploymentConfig`, `BuildConfig`, `ConfigMap` y `Secret`.

Lectura para la obra: hay una oportunidad pedagogica clara para explicar por que un sistema puede estar containerizado pero no ser plenamente cloud native. El paso de "corre en contenedores" a "opera con seguridad, escalabilidad y observabilidad" es uno de los ejes fuertes del caso Spotybank.

Riesgos derivados:

- Sin probes, la plataforma no sabe si un pod esta listo o bloqueado.
- Sin requests/limits, no hay base fiable para scheduling, HPA ni capacidad.
- Con replicas fijas en varios manifiestos, el escalamiento queda manual.
- Con secretos montados como variables, se debe reforzar gobierno de acceso y rotacion.

Resolucion propuesta:

- Agregar `startupProbe`, `readinessProbe` y `livenessProbe` por servicio.
- Definir `requests` y `limits` iniciales por perfil de consumo.
- Incorporar HPA solo despues de tener requests y metricas.
- Migrar `DeploymentConfig` a `Deployment` cuando no haya una necesidad especifica de la plataforma anterior.
- Externalizar secretos sensibles hacia un gestor con rotacion y auditoria.

## Debilidades que se pueden documentar sin decision externa

| Debilidad | Evidencia | Accion educativa |
|---|---|---|
| Stack de resiliencia heredado | Uso de Hystrix/Camel Hystrix | Crear guia de migracion hacia Resilience4j/Spring Cloud CircuitBreaker. |
| Pruebas en stack antiguo | Karate/JUnit 4/Cucumber report | Crear laboratorio de migracion a JUnit 5 y pruebas contractuales. |
| API docs heredadas | Swagger/Springfox | Crear laboratorio de migracion a OpenAPI 3 con springdoc. |
| Operacion incompleta en Kubernetes | Pocas probes y muchos `resources: {}` | Crear capitulo de readiness, liveness, startup, requests, limits y HPA. |
| Mensajeria sin contrato visible central | Workers JMS dispersos | Crear catalogo de eventos, DLQ, idempotencia y correlacion. |
| Integraciones externas acopladas | Rutas Camel/SOAP y CXF | Crear patron de adapter/anticorrupcion por proveedor externo. |
| Riesgo de logs sensibles | Workers que procesan payloads completos | Crear checklist de sanitizacion y observabilidad segura. |

## Informacion que sigue bloqueada

Estos puntos no deben inventarse en la obra:

- SLAs/SLOs reales.
- Volumen real de mensajes.
- Latencias reales de proveedores externos.
- Criticidad real por funcionalidad.
- Ownership tecnico y funcional.
- Contratos vigentes con sistemas externos.
- Decisiones de nube, region, residencia de datos y DR.
- Politica final de licenciamiento del material educativo.

## Uso sugerido en la obra

Este documento puede alimentar:

- Capitulo 2: inventario tecnico inicial.
- Capitulo 4: documentacion viva de microservicios.
- Capitulo 5: dominios, fronteras y adapters.
- Capitulo 6: modernizacion backend.
- Capitulo 7: seguridad y DevSecOps.
- Capitulo 8: despliegue cloud native.
- Capitulo 9: performance, escalamiento y resiliencia.
- Capitulo 12: roadmap de evolucion.

