# Capitulo 08 - Despliegue Cloud Native

Estado de cierre tecnico-editorial: `CERRADO_TECNICO`.

Dictamen del capitulo: apto como guia de despliegue cloud native educativo. El capitulo diferencia contenedores de operacion cloud native, define contrato runtime, unidad minima de despliegue, configuracion, secretos, probes, recursos, HPA, GitOps, rollout, red y continuidad sin prometer produccion bancaria real.

Desplegar microservicios no es levantar muchos contenedores. Es crear un entorno donde cada servicio tenga un contrato de runtime claro: que imagen ejecuta, que configuracion recibe, que secretos consume, como declara que esta listo, que recursos necesita, como se comunica, como se observa y como se recupera cuando falla.

Spotybank es util para estudiar esta transicion porque muestra una realidad frecuente: hay Dockerfiles, Docker Compose y manifiestos OpenShift/Kubernetes, pero eso no significa automaticamente que el sistema opere de forma cloud native. Estar containerizado es un punto de partida. Operar cloud native exige disciplina de plataforma.

La leccion central del capitulo es simple: cloud native no es una tecnologia unica; es una forma de disenar software para cambiar, fallar, observarse y recuperarse en ambientes dinamicos.

## Objetivos del capitulo

Al finalizar este capitulo, el lector podra:

- Disenar escenarios de despliegue para Spotybank segun madurez y objetivo educativo.
- Diferenciar laboratorio local, ambiente de integracion, staging y produccion simulada.
- Proponer una arquitectura Kubernetes/OpenShift para microservicios bancarios educativos.
- Separar configuracion, secretos, imagenes, pipelines y manifiestos.
- Definir probes, requests, limits, rollout y observabilidad con criterio tecnico.
- Explicar continuidad, respaldo y recuperacion sin prometer produccion real.
- Cerrar una ficha de despliegue con evidencia de runtime, seguridad, red, capacidad, rollout y rollback.

## 08.1 Desplegar no es solo levantar contenedores

En un sistema de microservicios, desplegar significa crear condiciones operativas. Los servicios deben poder comunicarse, fallar de forma controlada, exponer observabilidad, proteger secretos, recibir trafico y evolucionar sin que cada cambio se convierta en una operacion artesanal.

Un servicio puede compilar y aun asi no estar listo para plataforma. Puede faltarle:

- Health check.
- Readiness real.
- Configuracion externa.
- Manejo de secretos.
- Requests y limits.
- Versionado de imagenes.
- Politicas de red.
- Metricas.
- Trazas.
- Contrato de rollback.

La pregunta no es "arranca el contenedor?". La pregunta es: puede operar, degradarse y recuperarse de manera verificable?

## 08.2 Escenarios de despliegue

La obra propone cuatro escenarios. No todos necesitan el mismo nivel de complejidad.

| Escenario | Objetivo | Plataforma sugerida | Nivel de exigencia |
|---|---|---|---|
| Local | Aprender estructura y ejecutar pruebas pequenas | Docker Compose, Maven, mocks | Bajo |
| Laboratorio educativo | Simular integraciones y observabilidad basica | Minikube, Kind, OpenShift Local | Medio |
| Staging educativo | Validar pipelines, contratos y seguridad | Kubernetes/OpenShift compartido | Alto |
| Produccion simulada | Medir resiliencia y operar como producto | Kubernetes/OpenShift con GitOps | Alto |

El escenario local no debe intentar imitar toda la plataforma. Su objetivo es reducir friccion para aprender. La produccion simulada, en cambio, debe forzar disciplina: versionado, secretos, monitoreo, alertas, rollback y evidencia.

Ninguno de estos escenarios equivale por si mismo a produccion bancaria real. Para eso harian falta decisiones externas: compliance, residencia de datos, continuidad, soporte, auditoria, riesgos, controles legales y revision de seguridad formal.

## 08.3 Kubernetes u OpenShift como plataforma educativa

La evidencia de Spotybank apunta a contenedores y despliegue declarativo. Eso permite orientar el caso hacia Kubernetes/OpenShift. Kubernetes aporta el modelo comun: pods, deployments, services, config maps, secrets, ingress, jobs y autoscaling. OpenShift agrega opinion empresarial: routes, projects, security context constraints, builds y controles de operacion.

Para el lector, lo importante no es memorizar objetos. Lo importante es entender que cada microservicio necesita un contrato de runtime:

- Que imagen ejecuta.
- Que puerto expone.
- Que configuracion recibe.
- Que secretos consume.
- Como informa que esta vivo.
- Como informa que esta listo.
- Cuantos recursos necesita.
- Como se escala.
- Como se detiene sin perder trabajo.
- Que dependencias de red requiere.

Sin ese contrato, el despliegue queda atado a conocimiento tribal.

El contrato de runtime queda cerrado cuando puede responder:

| Dimension | Evidencia esperada |
|---|---|
| Imagen | Nombre, tag o digest y origen del build |
| Configuracion | Variables no sensibles y fuente de valores |
| Secretos | Referencias a Secret/Vault sin valor en Git |
| Salud | Startup, liveness y readiness con semantica real |
| Capacidad | Requests, limits y metrica inicial |
| Red | Dependencias permitidas y trafico bloqueado |
| Observabilidad | Logs, metricas, traces o correlation id |
| Rollback | Estrategia para volver a version anterior |

## 08.4 Unidad minima de despliegue

Cada microservicio Spotybank deberia tener una unidad minima de despliegue documentada. Esa unidad combina:

- Codigo fuente.
- Descriptor de build.
- Dockerfile o mecanismo de construccion de imagen.
- Manifiestos Kubernetes/OpenShift.
- Variables de configuracion no sensibles.
- Referencias a secretos.
- Startup, readiness y liveness probes.
- Requests y limits iniciales.
- Politicas de red esperadas.
- Smoke test minimo.

Un buen ejercicio docente es pedir que un equipo tome `spotybank-auth` o `spotybank-accounts` y complete esa unidad minima. El resultado no es solo tecnico; tambien revela preguntas pendientes sobre owner, criticidad, integraciones y seguridad.

La unidad minima no debe cerrarse si falta alguna de estas piezas: secreto referenciado sin mecanismo, readiness sin semantica, imagen sin version, ausencia de rollback o dependencia de red no declarada.

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
6. Cualquier valor accidentalmente versionado se considera comprometido.

Este enfoque ensena seguridad sin exponer material sensible.

## 08.7 Probes reales

Las probes no son decoracion YAML. Son el lenguaje con el que un servicio conversa con la plataforma.

| Probe | Pregunta | Error comun |
|---|---|---|
| Startup | El proceso termino de arrancar? | Reiniciar antes de que inicialice |
| Liveness | El proceso sigue vivo? | Matar procesos lentos pero recuperables |
| Readiness | Puede recibir trafico ahora? | Enviar trafico aunque falte DB, broker o cache |

Una readiness util no debe ser solo "el proceso responde". Debe reflejar condiciones minimas para atender trafico. En un worker, la pregunta puede ser distinta: puede conectarse al broker?, puede procesar sin saturacion?, esta pausado por decision operativa?

## 08.8 Resources, capacity y HPA

Spotybank muestra una oportunidad didactica clara: pasar de manifiestos incompletos a manifiestos operables. Requests y limits no son burocracia. Permiten scheduling confiable, protegen vecinos y habilitan decisiones de escalamiento.

Reglas de prudencia:

- No proponer HPA sin requests.
- No proponer HPA sin metrica relevante.
- No usar limits arbitrarios sin observar consumo.
- Separar servicios CPU-bound, IO-bound y workers.
- Medir antes de ajustar.

Un HPA mal configurado puede amplificar un problema. Escalar un sistema opaco no lo vuelve resiliente; puede hacerlo mas caro y mas dificil de diagnosticar.

Para habilitar HPA en un laboratorio avanzado, deben cumplirse estas condiciones:

| Condicion | Motivo |
|---|---|
| Requests definidos | El scheduler necesita una base para calcular uso relativo |
| Metrica relevante | CPU no sirve para todos los workers o adapters |
| Probes correctas | No conviene escalar pods que no estan listos |
| Limites observados | Evita matar procesos por limites arbitrarios |
| Escenario de carga | Permite comprobar que el escalamiento mejora algo |

## 08.9 Pipeline CI/CD

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

CI/CD no es automatizar cualquier cosa. Es automatizar con controles. Un pipeline que publica una imagen vulnerable mas rapido solo acelera el riesgo.

## 08.10 GitOps como disciplina

GitOps encaja bien en Spotybank porque convierte el estado deseado de la plataforma en material revisable. Los manifiestos se tratan como codigo. Cada cambio deja historia: quien lo pidio, que modifico, por que se aprobo y como se puede revertir.

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

Un cambio GitOps queda bien formado cuando incluye manifiesto, justificacion, impacto esperado, rollback y evidencia de validacion en ambiente no productivo.

## 08.11 Estrategias de rollout

No todos los servicios deben promoverse igual. Un backend interno puede usar rolling update. Un servicio de autenticacion necesita mas cuidado. Un ledger requiere aun mas control porque los errores pueden duplicar, perder o desordenar transacciones.

| Estrategia | Uso recomendado | Riesgo |
|---|---|---|
| Rolling update | Servicios stateless con pruebas maduras | Bajo/medio |
| Blue/green | Cambios con necesidad de rollback rapido | Medio |
| Canary | Cambios de riesgo controlable por porcentaje | Medio |
| Shadow traffic | Evaluar comportamiento sin afectar respuesta | Medio/alto |
| Migracion por oleadas | Cambios de plataforma o version mayor | Alto si no hay telemetria |

La estrategia depende del dominio. No es lo mismo desplegar una pantalla informativa que una pieza de autenticacion, MFA o ledger.

Para elegir estrategia de rollout, usar esta regla:

| Criticidad | Estrategia inicial |
|---|---|
| Baja, stateless, con pruebas maduras | Rolling update |
| Media, con consumidores relevantes | Blue/green o canary controlado |
| Alta, identidad, MFA o ledger educativo | Canary conservador, shadow o despliegue por oleadas |
| Desconocida | No promover hasta agregar observabilidad y smoke tests |

## 08.12 Observabilidad desde el despliegue

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

Para Spotybank, trazas distribuidas son un puente didactico excelente. Permiten mostrar como un flujo de autenticacion o notificacion atraviesa servicios, colas y adapters.

## 08.13 Network policies y comunicacion

En microservicios, la red no debe quedar abierta por defecto. Una politica basica deberia expresar que servicios pueden hablar entre si y por que.

Preguntas utiles:

- Que servicio llama a cual?
- Que worker necesita broker?
- Que servicio accede a base de datos?
- Que adapter sale hacia proveedor externo?
- Que endpoints son publicos, internos o administrativos?
- Que trafico deberia estar bloqueado?

Network policies no reemplazan autenticacion. Reducen superficie. En un entorno educativo ayudan a visualizar fronteras reales.

## 08.14 Respaldo y continuidad

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

La evidencia minima de continuidad incluye:

| Control | Evidencia |
|---|---|
| Backup | Politica, frecuencia y alcance |
| Restore | Prueba de restauracion documentada |
| RPO/RTO | Objetivo educativo o simulado declarado |
| Dependencias | Broker, base de datos, cache y configuracion cubiertos |
| Runbook | Pasos de recuperacion y escalamiento |

## 08.15 Ambientes y datos sinteticos

Los ambientes educativos deben usar datos sinteticos. Esto importa por privacidad y reproducibilidad. Un laboratorio que depende de datos reales no es portable ni seguro.

Tipos de datos recomendados:

- Usuarios ficticios.
- Cuentas ficticias.
- Transacciones simuladas.
- Tokens de ejemplo sin valor real.
- Mensajes de cola anonimos.
- Logs saneados.

El objetivo es que el alumno pueda romper, restaurar y repetir sin riesgo.

## 08.16 Backlog cloud native para Spotybank

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

## Ejercicio practico

Elegir un microservicio Spotybank y completar una ficha de despliegue.

### Entregables

1. Nombre del servicio.
2. Imagen esperada.
3. Puerto.
4. Variables no sensibles.
5. Secretos requeridos.
6. Startup, readiness y liveness.
7. Requests/limits iniciales.
8. Dependencias de red.
9. Estrategia de despliegue.
10. Smoke test minimo.
11. Criterio de rollback.

Luego justificar si el servicio puede usar rolling update o necesita una estrategia mas conservadora.

### Criterios de exito

| Criterio | Esperado |
|---|---|
| Runtime | La ficha define imagen, puerto, config y secretos |
| Operabilidad | Incluye probes con semantica real |
| Capacidad | Requests/limits tienen justificacion inicial |
| Seguridad | No expone secretos ni endpoints sensibles |
| Red | Declara dependencias y restricciones |
| Rollout | La estrategia coincide con criticidad del dominio |

El ejercicio queda cerrado si la ficha permite desplegar, observar, probar y revertir un servicio en ambiente educativo sin depender de conocimiento oral.

## Resumen del capitulo

- Cloud native es una disciplina operativa, no solo contenedores.
- Spotybank debe tener escenarios diferenciados: local, laboratorio, staging y produccion simulada.
- Cada microservicio necesita una unidad minima de despliegue y un contrato de runtime.
- Configuracion, secretos, contratos y politicas deben separarse.
- Probes, requests, limits y HPA requieren semantica y medicion.
- CI/CD y GitOps aportan trazabilidad, repetibilidad y control.
- La continuidad requiere backups, restauracion probada, RPO y RTO.

## Cierre tecnico-editorial del capitulo

| Control | Dictamen |
|---|---|
| Escenarios | Cerrado: local, laboratorio, staging educativo y produccion simulada quedan diferenciados |
| Contrato runtime | Cerrado: imagen, configuracion, secretos, salud, capacidad, red, observabilidad y rollback |
| Unidad minima | Cerrado: codigo, build, imagen, manifiestos, config, secretos, probes, resources, red y smoke test |
| Probes | Cerrado: startup, liveness y readiness tienen semantica diferenciada |
| Resources/HPA | Cerrado: HPA requiere requests, metrica, probes, limites observados y carga |
| GitOps | Cerrado: cambios revisables con justificacion, impacto, rollback y validacion |
| Rollout | Cerrado: estrategia depende de criticidad y evidencia |
| Continuidad | Cerrado: backup, restore, RPO/RTO, dependencias y runbook |

Pendientes editoriales internos del capitulo: ninguno.

## Preguntas de revision

1. Que diferencia hay entre ejecutar un contenedor y operar un microservicio cloud native?
2. Que informacion minima debe tener una ficha de despliegue?
3. Por que un secreto ficticio puede ser util en un laboratorio?
4. Cuando conviene usar canary en lugar de rolling update?
5. Que evidencia pedirias para afirmar que un backup funciona?
6. Que dimensiones debe cubrir un contrato de runtime?

## Referencias del capitulo

- `Documentacion/arquitectura/despliegue-nube.md`
- `Documentacion/arquitectura/matriz-despliegue.md`
- `Documentacion/arquitectura/escalamiento-performance.md`
- `Documentacion/arquitectura/seguridad-y-riesgos.md`
- `Documentacion/runbooks/incidentes-comunes.md`
- `SPOTYBANK_GUIA_IA_MODERNIZACION/02_PLANIFICACION/MAPA_MODERNIZACION_DESDE_FUENTES.md`
- `SPOTYBANK_GUIA_IA_MODERNIZACION/02_PLANIFICACION/FASCICULOS_EJECUTABLES_POR_PERFIL.md`
- `SPOTYBANK_GUIA_IA_MODERNIZACION/04_CUERPO_PRINCIPAL/CAP_07_Conclusiones/CAP_07_BORRADOR.md`
