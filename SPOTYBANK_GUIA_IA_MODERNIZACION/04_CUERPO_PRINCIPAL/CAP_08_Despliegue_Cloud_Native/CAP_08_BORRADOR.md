# Capitulo 08 - Despliegue Cloud Native

## Objetivos del capitulo

Al finalizar este capitulo, el lector podra:

- Disenar escenarios de despliegue para Spotybank segun madurez y objetivo educativo.
- Diferenciar laboratorio local, ambiente de integracion, staging y produccion simulada.
- Proponer una arquitectura Kubernetes/OpenShift para microservicios bancarios.
- Separar configuracion, secretos, imagenes, pipelines y manifiestos.
- Definir una estrategia de continuidad, respaldo y recuperacion ante fallos.

## 08.1 Desplegar no es solo levantar contenedores

En un sistema de microservicios, desplegar no significa ejecutar muchos procesos al mismo tiempo. Significa crear un entorno donde los servicios puedan comunicarse, fallar de forma controlada, exponer observabilidad, proteger secretos, recibir trafico y evolucionar sin que cada cambio se convierta en una operacion artesanal.

Spotybank es util como caso educativo porque permite mostrar la diferencia entre "funciona en mi maquina" y "puede operar como producto". Un servicio puede compilar y aun asi no estar listo para una plataforma cloud native. Puede faltarle health check, configuracion externa, manejo de secretos, limites de recursos, versionado de imagenes, metricas o contratos de red.

La leccion central del capitulo es esta: cloud native no es una tecnologia unica, es una forma de disenar software para operar en ambientes dinamicos.

## 08.2 Escenarios de despliegue

La obra propone cuatro escenarios. No todos necesitan el mismo nivel de complejidad.

| Escenario | Objetivo | Plataforma sugerida | Nivel de exigencia |
|---|---|---|---|
| Local | Aprender estructura y ejecutar pruebas pequenas | Docker Compose, Maven, mocks | Bajo |
| Laboratorio educativo | Simular integraciones y observabilidad basica | Minikube, Kind, OpenShift Local | Medio |
| Staging educativo | Validar pipelines, contratos y seguridad | Kubernetes/OpenShift compartido | Alto |
| Produccion simulada | Medir resiliencia y operar como producto | Kubernetes/OpenShift con GitOps | Alto |

El escenario local no debe intentar imitar toda la plataforma. Su objetivo es reducir friccion para aprender. El escenario de produccion simulada, en cambio, debe forzar disciplina: versionado, secretos, monitoreo, alertas, rollback y evidencia.

## 08.3 Plataforma objetivo: Kubernetes u OpenShift

La documentacion tecnica de Spotybank detecta artefactos asociados a contenedores y despliegue. Eso permite orientar el caso hacia Kubernetes/OpenShift como plataforma educativa. OpenShift suma opinion y controles empresariales: rutas, proyectos, security context constraints, builds y experiencia de operacion. Kubernetes aporta el modelo comun: pods, deployments, services, config maps, secrets, ingress, jobs y autoscaling.

Para el lector, lo importante no es memorizar objetos de plataforma. Lo importante es entender que cada microservicio necesita un contrato de runtime:

- Que imagen ejecuta.
- Que puerto expone.
- Que configuracion recibe.
- Que secretos consume.
- Como informa que esta vivo.
- Como informa que esta listo.
- Cuantos recursos necesita.
- Como se escala.
- Como se detiene sin perder trabajo.

Sin ese contrato, el despliegue queda atado a conocimiento tribal.

## 08.4 Unidad minima de despliegue

Cada microservicio Spotybank deberia tener una unidad minima de despliegue documentada. Esa unidad combina:

- Codigo fuente.
- Archivo `pom.xml` o descriptor de build.
- Dockerfile o mecanismo de construccion de imagen.
- Manifiestos Kubernetes/OpenShift.
- Variables de configuracion no sensibles.
- Referencias a secretos.
- Probes.
- Recursos minimos.
- Politicas de red esperadas.

Un buen ejercicio docente es pedir que un equipo tome `spotybank-auth` o `spotybank-accounts` y complete esa unidad minima. El resultado no es solo tecnico; tambien revela preguntas pendientes sobre owner, criticidad, integraciones y seguridad.

## 08.5 Configuracion externa

Un servicio moderno no debe requerir recompilacion para cambiar endpoints, colas, timeouts o flags de comportamiento. La configuracion debe estar fuera del binario.

En Spotybank conviene separar:

| Tipo | Ejemplos | Mecanismo |
|---|---|---|
| Configuracion no sensible | timeouts, URLs logicas, feature flags | ConfigMap, properties externas |
| Secretos | passwords, tokens, certificados | Secret, Vault, Secret Manager |
| Contratos | OpenAPI, WSDL, AsyncAPI | Repositorio versionado |
| Politicas | limites de reintento, circuit breaker | Configuracion externa validada |

Esta separacion facilita laboratorios seguros. El estudiante puede modificar timeouts o flags sin acceder a secretos reales. La institucion puede publicar material didactico sin filtrar credenciales.

## 08.6 Secrets y entornos educativos

Los secretos de un caso educativo deben ser ficticios. Pero el patron de uso debe parecerse a un entorno real. Por eso Spotybank no debe esconder la existencia de secrets; debe ensenar como se gestionan.

Patron recomendado:

1. El README explica que secretos necesita el servicio.
2. El manifiesto referencia el secreto por nombre.
3. El valor real no aparece en Git.
4. El laboratorio entrega un archivo de ejemplo con placeholders.
5. El pipeline valida que no haya secretos en texto plano.

Este enfoque ensena seguridad sin exponer material sensible.

## 08.7 Pipeline CI/CD

Un pipeline minimo para Spotybank deberia cubrir:

1. Restaurar dependencias.
2. Compilar.
3. Ejecutar tests unitarios.
4. Ejecutar tests de contrato si existen.
5. Escanear secretos.
6. Escanear dependencias.
7. Construir imagen.
8. Escanear imagen.
9. Publicar artefacto.
10. Desplegar en ambiente no productivo.
11. Ejecutar smoke tests.
12. Promover con aprobacion.

La obra debe insistir en que CI/CD no es automatizar cualquier cosa. Es automatizar con controles. Un pipeline que publica una imagen vulnerable mas rapido solo acelera el riesgo.

## 08.8 GitOps como disciplina

GitOps encaja bien en Spotybank porque convierte el estado deseado de la plataforma en material revisable. Los manifiestos de despliegue se tratan como codigo. Cada cambio deja una historia: quien lo pidio, que modifico, por que se aprobo y como se puede revertir.

Una estructura posible:

```text
spotybank-platform/
|
|-- apps/
|   |-- spotybank-auth/
|   |-- spotybank-accounts/
|   |-- spotybank-core-ledger/
|
|-- envs/
|   |-- lab/
|   |-- staging/
|   |-- prod-sim/
|
|-- policies/
|-- observability/
```

En un curso, GitOps permite que estudiantes propongan cambios por pull request y discutan arquitectura con evidencia concreta.

## 08.9 Estrategias de promocion

No todos los servicios deben promoverse igual. Un backend interno puede usar rolling update. Un servicio de autenticacion necesita mas cuidado. Un ledger requiere aun mas control porque los errores pueden duplicar, perder o desordenar transacciones.

Estrategias a comparar:

| Estrategia | Uso recomendado | Riesgo |
|---|---|---|
| Rolling update | Servicios stateless con pruebas maduras | Bajo/medio |
| Blue/green | Cambios con necesidad de rollback rapido | Medio |
| Canary | Cambios de riesgo controlable por porcentaje | Medio |
| Shadow traffic | Evaluar comportamiento sin afectar respuesta | Medio/alto |
| Migracion por oleadas | Cambios de plataforma o version mayor | Alto si no hay telemetria |

Spotybank debe ensenar que la estrategia depende del dominio. No es lo mismo desplegar una pantalla informativa que una pieza de autenticacion o ledger.

## 08.10 Observabilidad desde el despliegue

La observabilidad no se agrega cuando algo falla. Debe formar parte del despliegue.

Cada servicio deberia exponer:

- Health minimo.
- Readiness real.
- Logs estructurados.
- Correlation ID.
- Metricas tecnicas.
- Metricas de negocio cuando aplique.
- Trazas distribuidas.
- Version de build en runtime.

Para Spotybank, Jaeger y trazas son un puente didactico excelente. Permiten mostrar como un flujo de autenticacion o notificacion atraviesa servicios, colas y adapters.

## 08.11 Respaldo y continuidad

Un despliegue bancario simulado debe hablar de continuidad. Aunque Spotybank sea educativo, la arquitectura debe entrenar preguntas reales:

- Que datos deben respaldarse?
- Cada cuanto?
- Donde se guardan?
- Quien puede restaurarlos?
- Como se prueba una restauracion?
- Cual es el RPO?
- Cual es el RTO?
- Que servicios son criticos?
- Que integraciones pueden degradarse?

La continuidad no se documenta para cumplir una formalidad. Se prueba. Un backup no probado es una esperanza, no una garantia.

## 08.12 Ambientes y datos

Los ambientes educativos deben usar datos sinteticos. Esto importa por privacidad y por reproducibilidad. Un laboratorio que depende de datos reales no es portable ni seguro.

Tipos de datos recomendados:

- Usuarios ficticios.
- Cuentas ficticias.
- Transacciones simuladas.
- Tokens de ejemplo sin valor real.
- Mensajes de cola anonimos.
- Logs saneados.

El objetivo es que el alumno pueda romper, restaurar y repetir sin riesgo.

## 08.13 Backlog cloud native para Spotybank

Un backlog inicial podria incluir:

| Prioridad | Tarea | Resultado esperado |
|---|---|---|
| P0 | Definir unidad minima de despliegue por servicio | Cada servicio tiene manifiestos y contrato runtime |
| P0 | Separar secretos de configuracion | Ningun secreto queda en properties versionadas |
| P1 | Crear ambiente lab reproducible | Estudiantes pueden desplegar una parte del sistema |
| P1 | Definir probes reales | La plataforma distingue vivo de listo |
| P1 | Agregar requests/limits | El cluster puede planificar capacidad |
| P2 | Implementar GitOps | Cambios de plataforma pasan por revision |
| P2 | Crear runbook de rollback | Cada servicio tiene respuesta ante despliegue fallido |

El valor de este backlog es que convierte la nube en trabajo verificable.

## 08.14 Ejercicio practico

Elegir un microservicio Spotybank y completar una ficha de despliegue:

- Nombre del servicio.
- Imagen esperada.
- Puerto.
- Variables no sensibles.
- Secretos requeridos.
- Readiness.
- Liveness.
- Requests/limits iniciales.
- Dependencias de red.
- Estrategia de despliegue.
- Smoke test minimo.

Luego justificar si el servicio puede usar rolling update o necesita una estrategia mas conservadora.

## Resumen del capitulo

- Cloud native es una disciplina operativa, no solo contenedores.
- Spotybank debe tener escenarios diferenciados: local, laboratorio, staging y produccion simulada.
- Cada microservicio necesita una unidad minima de despliegue.
- Configuracion, secretos, contratos y politicas deben separarse.
- CI/CD y GitOps aportan trazabilidad, repetibilidad y control.
- La continuidad requiere backups, restauracion probada, RPO y RTO.

## Preguntas de revision

1. Que diferencia hay entre ejecutar un contenedor y operar un microservicio cloud native?
2. Que informacion minima debe tener una ficha de despliegue?
3. Por que un secreto ficticio puede ser util en un laboratorio?
4. Cuando conviene usar canary en lugar de rolling update?
5. Que evidencia pedirias para afirmar que un backup funciona?

## Referencias del capitulo

- `Documentacion/arquitectura/despliegue-nube.md`
- `Documentacion/arquitectura/matriz-despliegue.md`
- `Documentacion/arquitectura/escalamiento-performance.md`
- `Documentacion/arquitectura/seguridad-y-riesgos.md`
- `Documentacion/runbooks/incidentes-comunes.md`
