# Referencias de modernizacion 2026

Fecha de consulta: 2026-05-11

Estas referencias son fuentes oficiales o primarias usadas para orientar propuestas de mejora sobre Spotybank. La obra debe distinguir siempre entre evidencia local y recomendacion basada en referencias actuales.

## Plataforma Java y Spring

| Tema | Fuente | Uso en Spotybank |
|---|---|---|
| Spring Boot actual y requisitos | https://docs.spring.io/spring-boot/system-requirements.html | Definir version objetivo y minimo Java/Maven. La documentacion actual consultada indica Spring Boot 4.0.6, Java 17 minimo y Maven 3.6.3 o superior. |
| Testcontainers con Spring Boot | https://docs.spring.io/spring-boot/reference/testing/testcontainers.html | Reemplazar mocks fragiles por pruebas de integracion con servicios reales en contenedores. |
| Spring Cloud Circuit Breaker | https://docs.spring.io/spring-cloud-circuitbreaker/reference/index.html | Sustituir patrones Hystrix heredados por Resilience4j, Spring Retry o retry nativo segun caso. |

## Integracion y APIs

| Tema | Fuente | Uso en Spotybank |
|---|---|---|
| Migracion Apache Camel 4 | https://camel.apache.org/manual/camel-4-migration-guide.html | Planificar paso de rutas Camel heredadas hacia Camel 4, Java 17 y JUnit 5. |
| Migracion Springfox a springdoc | https://springdoc.org/migrating-from-springfox.html | Actualizar documentacion REST desde Swagger/Springfox hacia OpenAPI 3. |
| OpenAPI/springdoc | https://springdoc.org/ | Generar contratos API modernos, versionables y utiles para clientes, QA y seguridad. |
| AsyncAPI | https://github.com/asyncapi/spec | Documentar mensajes JMS/eventos con contratos legibles y automatizables. |

## Kubernetes, OpenShift y cloud native

| Tema | Fuente | Uso en Spotybank |
|---|---|---|
| Probes Kubernetes | https://kubernetes.io/docs/concepts/configuration/liveness-readiness-startup-probes/ | Agregar `startupProbe`, `readinessProbe` y `livenessProbe` por microservicio. |
| Requests y limits | https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/ | Definir CPU/memoria para scheduling, capacidad y autoscaling. |
| HPA | https://kubernetes.io/docs/concepts/workloads/autoscaling/horizontal-pod-autoscale/ | Escalar por CPU, memoria o metricas custom luego de definir requests. |
| Secrets Kubernetes | https://kubernetes.io/docs/concepts/configuration/secret/ | Recordar que Secrets requieren cifrado, RBAC y gobierno; no deben tratarse como vault completo. |
| DeploymentConfig y Deployment en OpenShift | https://docs.redhat.com/en/documentation/openshift_container_platform/4.16/html/building_applications/deployments | Evaluar migracion de `DeploymentConfig` a `Deployment` cuando no se necesiten features especificas legacy. |

## Observabilidad

| Tema | Fuente | Uso en Spotybank |
|---|---|---|
| OpenTelemetry Java Agent | https://opentelemetry.io/docs/zero-code/java/agent/ | Incorporar trazas, metricas y logs correlacionados con bajo impacto inicial. |
| OpenTelemetry Java instrumentation | https://opentelemetry.io/docs/languages/java/instrumentation/ | Definir estrategia de instrumentacion automatica y manual por dominio. |

## Seguridad y supply chain

| Tema | Fuente | Uso en Spotybank |
|---|---|---|
| OWASP ASVS 5.0 | https://owasp.org/www-project-application-security-verification-standard/ | Usar ASVS como base de requisitos verificables de seguridad para APIs y servicios. |
| OWASP API Security Top 10 2023 | https://owasp.org/API-Security/editions/2023/en/0x03-introduction/ | Priorizar riesgos de autorizacion, consumo de recursos, inventario API y consumo inseguro de APIs. |
| SLSA 1.2 | https://slsa.dev/spec/v1.2/ | Definir madurez de supply chain, provenance, builds reproducibles y atestaciones. |

## Testing y QA

| Tema | Fuente | Uso en Spotybank |
|---|---|---|
| Karate JUnit 5 en Maven Central | https://central.sonatype.com/artifact/io.karatelabs/karate-junit5 | Modernizar pruebas API hacia artefactos actuales y JUnit 5. |
| Spring Boot testing con Testcontainers | https://docs.spring.io/spring-boot/reference/testing/testcontainers.html | Crear laboratorios con Mongo, broker JMS y servicios externos simulados. |

## Como usar estas referencias en la obra

1. Citar estas fuentes solo para recomendaciones actuales.
2. No afirmar que Spotybank ya implementa una practica si no aparece en el codigo o manifiestos.
3. Mantener el lenguaje educativo: "se propone", "conviene evaluar", "la evidencia sugiere".
4. Actualizar esta lista antes de publicar una version final, porque versiones de frameworks y guias pueden cambiar.

