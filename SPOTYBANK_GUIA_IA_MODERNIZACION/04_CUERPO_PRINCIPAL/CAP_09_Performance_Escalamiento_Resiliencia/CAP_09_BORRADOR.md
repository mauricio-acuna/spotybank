# Capitulo 09 - Performance, Escalamiento y Resiliencia

Estado de cierre tecnico-editorial: `CERRADO_TECNICO`.

Dictamen del capitulo: apto como guia de performance, escalamiento y resiliencia educativa. El capitulo define SLIs/SLOs no productivos, percentiles, bottlenecks, pools, colas, HPA, pruebas de carga, resiliencia, observabilidad, capacity planning y backlog con criterios verificables.

Performance no es una sensacion. No es decir que un servicio "va rapido" ni que "esta lento" porque alguien lo percibe asi. Performance es comportamiento medible bajo condiciones conocidas. En microservicios, esa medicion debe incluir el servicio, sus dependencias, sus colas, su base de datos, su runtime y la plataforma que lo ejecuta.

Spotybank permite estudiar performance sin caer en promesas productivas. El objetivo no es inventar SLOs de un banco real. El objetivo es entrenar criterio: formular hipotesis, medir, encontrar limites, proponer mejoras y validar si funcionaron.

La regla del capitulo es sencilla: no se escala lo que no se entiende.

## Objetivos del capitulo

Al finalizar este capitulo, el lector podra:

- Definir SLIs y SLOs educativos para servicios Spotybank.
- Reconocer cuellos de botella frecuentes en microservicios bancarios.
- Relacionar latencia, throughput, concurrencia, pools, colas y recursos de plataforma.
- Proponer estrategias de escalamiento horizontal y vertical con evidencia.
- Disenar pruebas de carga y resiliencia sin usar datos reales.
- Convertir hallazgos de performance en backlog medible.
- Cerrar una hipotesis de performance con evidencia, decision y accion siguiente.

## 09.1 Performance como comportamiento observable

Performance implica observar un flujo, definir una carga, medir respuesta, identificar limites y decidir que mejorar. Un error comun en sistemas heredados es hablar de performance solo cuando aparece un incidente. La obra propone otro enfoque: medir desde el inicio, incluso en ambientes educativos.

Un laboratorio pequeno puede ensenar conceptos reales si define:

- Carga.
- Latencia esperada.
- Tasa de errores.
- Consumo de recursos.
- Dependencias involucradas.
- Duracion.
- Criterio de exito.

Sin esas condiciones, una prueba no produce evidencia fuerte. Produce impresiones.

## 09.2 SLIs, SLOs y presupuesto de error

Un SLI es una medicion. Un SLO es un objetivo. Un presupuesto de error expresa cuanto incumplimiento se acepta antes de revisar cambios, capacidad o arquitectura.

Para Spotybank, los SLOs no deben presentarse como compromisos productivos. Son metas educativas que ayudan a razonar.

| Dominio | SLI posible | SLO educativo inicial |
|---|---|---|
| Auth | Latencia de login | 95% de respuestas bajo 500 ms en laboratorio |
| Accounts | Tiempo de consulta de cuenta | 95% bajo 700 ms con datos sinteticos |
| Core Ledger | Registro transaccional sin duplicidad | 99% de operaciones simuladas idempotentes |
| Notificaciones | Tiempo hasta entrega al broker | 95% bajo 2 s en flujo simulado |
| MFA | Tiempo de generacion/validacion | 95% bajo 1 s sin proveedor externo real |

Los numeros son ejemplos. La habilidad importante es justificar el objetivo, medirlo y revisarlo con evidencia.

Cada SLO educativo debe declarar:

| Campo | Criterio |
|---|---|
| Escenario | Laboratorio, staging educativo o produccion simulada |
| Carga | Volumen, duracion y concurrencia |
| SLI | Medicion principal |
| Objetivo | Umbral esperado y razon |
| Exclusiones | Lo que no se esta prometiendo |
| Accion | Que ocurre si no se cumple |

Sin escenario y carga, un SLO queda flotando. Con escenario y carga, se convierte en herramienta de aprendizaje.

## 09.3 Latencia, throughput y concurrencia

La latencia mide cuanto tarda una operacion. El throughput mide cuantas operaciones se completan por unidad de tiempo. La concurrencia indica cuantas operaciones estan ocurriendo al mismo tiempo.

En microservicios, estos conceptos se mezclan con:

- Tiempos de red.
- Serializacion JSON/XML.
- Consultas a base de datos.
- Llamadas SOAP o REST externas.
- Colas y brokers.
- Pools HTTP, JDBC o JMS.
- CPU y memoria.
- Garbage collection.

Spotybank permite estudiar una idea importante: un servicio puede tener buena latencia aislado y mala latencia dentro de un flujo distribuido. Por eso las trazas son tan utiles.

## 09.4 Percentiles y promedios

El promedio suele ocultar dolor. Un promedio aceptable puede convivir con un p95 malo o un p99 inaceptable.

| Medida | Que muestra | Riesgo |
|---|---|---|
| Promedio | Comportamiento general | Oculta colas largas |
| p50 | Experiencia mediana | No muestra extremos |
| p95 | Experiencia de usuarios lentos | Requiere suficientes muestras |
| p99 | Casos extremos importantes | Puede ser sensible a ruido |

Para autenticacion, MFA o ledger, los percentiles altos importan. Los usuarios no sienten el promedio; sienten su propia transaccion.

## 09.5 Pools y limites invisibles

Muchos cuellos de botella aparecen en limites pequenos y poco visibles:

- Pool HTTP insuficiente.
- Pool de base de datos demasiado bajo.
- Timeout mayor que el tiempo de saturacion.
- Reintentos sin backoff.
- Threads bloqueados por I/O.
- Broker sin DLQ o con redelivery agresivo.
- Indices faltantes.
- Payloads demasiado grandes.

Una mejora responsable no empieza aumentando replicas. Primero identifica que recurso esta saturado y por que.

Para diagnosticar un cuello de botella, el lector debe separar:

| Plano | Evidencia |
|---|---|
| Aplicacion | Latencia por endpoint, errores, threads, heap, GC |
| Dependencia | DB, broker, SOAP/REST externo, cache |
| Plataforma | CPU, memoria, throttling, restarts, red |
| Datos | Tamano de payload, indices, cardinalidad, volumen |
| Codigo | Bloqueos, serializacion, retries, loops o locks |

## 09.6 Escalamiento horizontal

El escalamiento horizontal agrega replicas. Es util cuando el servicio es stateless o cuando su estado compartido esta bien externalizado.

Antes de escalar horizontalmente un servicio Spotybank hay que preguntar:

- El servicio es stateless?
- Tiene sesiones locales?
- Usa locks locales?
- Procesa mensajes con idempotencia?
- Puede duplicar efectos si dos replicas reciben eventos parecidos?
- Hay limites en dependencias aguas abajo?
- El balanceador distribuye correctamente?

Escalar un servicio sin mirar dependencias puede mover el problema a la base de datos, al broker o a un proveedor externo.

## 09.7 Escalamiento vertical y resources

El escalamiento vertical aumenta CPU o memoria por instancia. En Kubernetes/OpenShift, requests y limits ayudan al scheduler y protegen el cluster.

Reglas iniciales:

- Definir requests conservadores basados en medicion.
- Evitar limits de CPU demasiado agresivos si generan throttling.
- Revisar memoria por heap, metaspace, buffers y librerias.
- Observar garbage collection.
- Ajustar despues de pruebas, no por intuicion.

Spotybank puede usar laboratorios donde el mismo servicio se ejecuta con distintos requests/limits para observar impacto.

## 09.8 HPA y metricas adecuadas

El Horizontal Pod Autoscaler puede escalar por CPU, memoria o metricas custom. Para un sistema bancario, CPU no siempre expresa presion real. Un servicio puede estar saturado por I/O, broker, base de datos o latencia de proveedor externo mientras CPU parece normal.

Metricas candidatas:

- CPU.
- Memoria.
- Latencia p95/p99.
- Requests por segundo.
- Errores por segundo.
- Longitud de cola.
- Edad del mensaje mas antiguo.
- Tiempo de procesamiento por mensaje.

La decision clave es que el autoscaling debe proteger la experiencia y la estabilidad, no solo perseguir CPU. No conviene activar HPA antes de tener requests, metricas confiables y comportamiento entendido.

## 09.9 Colas, reintentos y DLQ

La mensajeria desacopla servicios, pero introduce fallos especificos:

- Mensajes duplicados.
- Mensajes fuera de orden.
- Reintentos infinitos.
- DLQ sin monitoreo.
- Consumidores lentos.
- Productores que no aplican backpressure.
- Payloads incompatibles.

Cada flujo por cola deberia documentar:

| Elemento | Pregunta |
|---|---|
| Productor | Quien publica el mensaje? |
| Consumidor | Quien lo procesa? |
| Idempotencia | Que evita duplicar efectos? |
| Reintento | Cuantas veces y con que espera? |
| DLQ | Donde va el mensaje fallido? |
| Reproceso | Como se corrige y reinyecta? |
| Alerta | Quien se entera? |

Una DLQ sin owner es solo un lugar donde los problemas se acumulan en silencio.

Una DLQ operable queda definida con:

| Campo | Criterio |
|---|---|
| Owner | Perfil responsable de revisar y decidir |
| Alerta | Umbral por cantidad, edad o tasa de ingreso |
| Clasificacion | Error funcional, tecnico, datos invalidos o dependencia |
| Reproceso | Procedimiento seguro e idempotente |
| Descarte | Criterio documentado para no reprocesar |
| Evidencia | Log, payload saneado, correlation id o ticket |

## 09.10 Resiliencia y patrones

Resiliencia es la capacidad de sostener comportamiento aceptable cuando algo falla. No significa que nada falle. Significa que el fallo fue previsto, limitado y observable.

Patrones utiles:

- Timeout corto y explicito.
- Retry con backoff.
- Circuit breaker.
- Bulkhead.
- Fallback controlado.
- Idempotencia.
- Rate limiting.
- Degradacion funcional.
- DLQ y reproceso.

El reto educativo es elegir el patron adecuado. No todo necesita circuit breaker. No todo retry es bueno. Reintentar una operacion no idempotente puede crear un incidente.

## 09.11 Pruebas de carga con hipotesis

Una prueba de carga util tiene una hipotesis. No es disparar trafico hasta que algo explote.

Ejemplo:

```text
Si spotybank-auth recibe 50 logins por segundo durante 10 minutos,
el p95 debe mantenerse bajo 500 ms y la tasa de error bajo 1%.
```

Elementos minimos:

- Ambiente definido.
- Version de artefactos.
- Datos sinteticos.
- Escenario de usuario.
- Carga objetivo.
- Duracion.
- Warm-up.
- Metricas capturadas.
- Resultado esperado.
- Criterio de exito/fallo.

La prueba debe ser repetible. Si no se puede repetir, no es evidencia fuerte.

Una prueba de carga queda lista para ejecutarse cuando:

- Usa datos sinteticos.
- Declara version del servicio y ambiente.
- Tiene warm-up y duracion.
- Captura p50, p95, p99, tasa de error y recursos.
- Incluye criterio de exito y criterio de abortar.
- Deja resultados comparables para una repeticion posterior.

## 09.12 Pruebas de resiliencia

Tambien hay que probar fallos. Un sistema parece estable hasta que una dependencia tarda, un broker corta conexion, una base responde lento o un proveedor externo devuelve errores.

Escenarios utiles:

- Timeout de proveedor externo.
- Broker detenido temporalmente.
- Cola con mensajes invalidos.
- Base de datos lenta.
- Replica reiniciada durante procesamiento.
- Error intermitente en adapter.

El objetivo no es provocar caos por espectaculo. Es comprobar que el sistema falla de forma controlada y observable.

Cada prueba de resiliencia debe responder:

| Pregunta | Criterio |
|---|---|
| Que falla? | Dependencia, broker, base, red, pod o adapter |
| Como se limita el impacto? | Timeout, retry, circuit breaker, bulkhead o fallback |
| Como se observa? | Metrica, log, trace, alerta o DLQ |
| Como se recupera? | Reintento, replay, rollback o accion operativa |
| Que no debe ocurrir? | Duplicacion, perdida silenciosa, fuga de datos o bloqueo indefinido |

## 09.13 Observabilidad para performance

Medir performance requiere combinar:

- Metricas de plataforma.
- Metricas de aplicacion.
- Logs estructurados.
- Trazas distribuidas.
- Eventos de broker.
- Metricas de base de datos.
- Errores por dependencia.

Una traza puede revelar que el tiempo no se pierde en el servicio que recibe la queja, sino en una llamada downstream. Esta es una de las mejores lecciones de Spotybank para equipos nuevos: no optimizar a ciegas.

## 09.14 Capacity planning educativo

Capacity planning responde una pregunta simple y dificil: cuanta capacidad necesitamos para una carga esperada?

Para un caso educativo, se puede trabajar con una tabla:

| Variable | Ejemplo |
|---|---|
| Usuarios concurrentes | 100 |
| Operaciones por segundo | 50 |
| Latencia p95 objetivo | 500 ms |
| Replicas iniciales | 2 |
| CPU request por replica | 250 m |
| Memoria request por replica | 512 Mi |
| Dependencia critica | Broker / base de datos |

La tabla no pretende ser definitiva. Pretende obligar a razonar en numeros.

## 09.15 Backlog de performance y resiliencia

| Prioridad | Tarea | Resultado esperado |
|---|---|---|
| P0 | Definir SLIs/SLOs educativos | Cada dominio tiene objetivos medibles |
| P0 | Documentar colas, reintentos y DLQ | No hay mensajeria sin owner ni reproceso |
| P1 | Agregar correlation ID extremo a extremo | Las trazas conectan servicios |
| P1 | Medir pools y timeouts | Los limites invisibles quedan visibles |
| P1 | Crear pruebas de carga base | Auth y accounts tienen escenarios repetibles |
| P2 | Explorar autoscaling con metricas custom | HPA se conecta a comportamiento real |
| P2 | Crear practica de resiliencia | Se simula caida de dependencia y recuperacion |

## Ejercicio practico

Disenar una prueba de carga para `spotybank-auth` o `spotybank-accounts`.

### Entregables

1. Hipotesis.
2. Endpoint o flujo.
3. Datos sinteticos.
4. Carga inicial.
5. Duracion.
6. SLI principal.
7. SLO esperado.
8. Metricas a capturar.
9. Riesgos de la prueba.
10. Resultado esperado.
11. Dos mejoras si el SLO no se cumple: una de aplicacion y una de plataforma.

### Criterios de exito

| Criterio | Esperado |
|---|---|
| Hipotesis | La prueba explica que quiere demostrar |
| Medicion | Usa p95/p99, errores y recursos |
| Seguridad | Usa datos sinteticos |
| Diagnostico | Distingue aplicacion, plataforma y dependencia externa |
| Resiliencia | Considera timeout, retry o DLQ cuando aplica |
| Accion | Termina en mejora verificable |

El ejercicio queda cerrado si la prueba se puede ejecutar dos veces y comparar resultados sin cambiar la definicion del escenario.

## Resumen del capitulo

- Performance debe medirse, no suponerse.
- SLIs y SLOs educativos ayudan a entrenar criterio tecnico.
- Los percentiles muestran experiencias que el promedio oculta.
- Los cuellos de botella pueden estar en pools, colas, bases de datos, red o dependencias.
- Escalar replicas no siempre resuelve el problema.
- Resiliencia requiere timeouts, retries, idempotencia, DLQ y observabilidad.
- Las pruebas de carga deben tener hipotesis, datos sinteticos y criterio de exito.

## Cierre tecnico-editorial del capitulo

| Control | Dictamen |
|---|---|
| SLIs/SLOs educativos | Cerrado: no se presentan como compromisos productivos y exigen escenario, carga, SLI, objetivo y accion |
| Percentiles | Cerrado: p50, p95 y p99 se usan para evitar promedios engañosos |
| Bottlenecks | Cerrado: aplicacion, dependencia, plataforma, datos y codigo quedan diferenciados |
| Escalamiento | Cerrado: HPA requiere requests, metricas, probes y comprension del cuello |
| Mensajeria | Cerrado: DLQ exige owner, alerta, clasificacion, reproceso y evidencia |
| Resiliencia | Cerrado: fallos se prueban con impacto, observabilidad, recuperacion y limites |
| Pruebas de carga | Cerrado: hipotesis, datos sinteticos, duracion, metricas y criterios de salida |
| Backlog | Cerrado: hallazgos terminan en tareas medibles y verificables |

Pendientes editoriales internos del capitulo: ninguno.

## Preguntas de revision

1. Que diferencia hay entre latencia y throughput?
2. Por que CPU no siempre es buena metrica para autoscaling?
3. Que riesgo tiene un retry sobre una operacion no idempotente?
4. Que informacion minima debe tener una DLQ operable?
5. Como justificarias un SLO educativo para `spotybank-accounts`?
6. Que diferencia hay entre criterio de exito y criterio de abortar en una prueba de carga?

## Referencias del capitulo

- `Documentacion/arquitectura/escalamiento-performance.md`
- `Documentacion/arquitectura/catalogo-mensajeria.md`
- `Documentacion/arquitectura/matriz-relaciones.md`
- `Documentacion/diagramas/secuencias-criticas.md`
- `Documentacion/runbooks/incidentes-comunes.md`
- `SPOTYBANK_GUIA_IA_MODERNIZACION/02_PLANIFICACION/MAPA_MODERNIZACION_DESDE_FUENTES.md`
- `SPOTYBANK_GUIA_IA_MODERNIZACION/02_PLANIFICACION/FASCICULOS_EJECUTABLES_POR_PERFIL.md`
- `SPOTYBANK_GUIA_IA_MODERNIZACION/04_CUERPO_PRINCIPAL/CAP_08_Despliegue_Cloud_Native/CAP_08_BORRADOR.md`
