# Capitulo 06 - Modernizacion de Backend

Modernizar backend no es cambiar versiones por deporte. Tampoco es reescribir todo cuando el sistema se vuelve dificil de leer. En un ecosistema como Spotybank, modernizar significa mover una pieza con suficiente conocimiento para no romper las demas, reducir riesgo visible y dejar una base mas facil de probar, operar y explicar.

La tentacion de una migracion grande aparece rapido: subir Java, cambiar Spring Boot, reemplazar Swagger, retirar Hystrix, actualizar Camel, limpiar Maven, mover manifiestos a Kubernetes moderno, rehacer pruebas y ordenar paquetes. Todo eso puede ser necesario. El problema es hacerlo como una sola apuesta.

Una modernizacion responsable necesita cortes pequenos, evidencia, pruebas, observabilidad y criterio de rollback.

## Objetivos del capitulo

Al finalizar este capitulo, el lector podra:

- Disenar una ruta incremental para servicios Java/Spring heredados.
- Priorizar upgrades sin caer en una migracion Big Bang.
- Separar cambios de build, runtime, framework, dominio y plataforma.
- Usar pruebas, contratos y observabilidad como red de seguridad.
- Definir pilotos de bajo riesgo antes de tocar dominios criticos.
- Documentar decisiones tecnicas sin presentar como cerrado lo que requiere validacion externa.

## 06.1 Modernizar no es reescribir

Modernizar un sistema como Spotybank no significa borrar todo y empezar de cero. Esa tentacion suele aparecer cuando el stack parece viejo, la documentacion es incompleta y las dependencias estan dispersas. Sin embargo, una reescritura completa puede destruir conocimiento funcional, multiplicar riesgos y dejar al equipo durante meses sin entregar valor.

La modernizacion responsable busca evolucionar por cortes controlados. Cada corte debe tener un objetivo claro:

- Reducir riesgo.
- Mejorar mantenibilidad.
- Aumentar seguridad.
- Mejorar performance.
- Habilitar una capacidad nueva.
- Retirar una dependencia sin soporte.
- Crear una base mas verificable.

Si un cambio no se puede explicar con uno de esos objetivos, probablemente sea solo movimiento tecnico.

## 06.2 Punto de partida tecnologico

La inspeccion estatica de Spotybank muestra una base amplia: Java, Maven, Spring Boot, Spring MVC, Apache Camel/Fuse, SOAP/CXF, MongoDB, JPA, JMS, IBM MQ, Swagger/Springfox, Karate, JUnit, Mockito, Docker y OpenShift.

El problema no es que esas tecnologias existan. El problema aparece cuando:

- Las versiones ya no reciben soporte.
- Los parents Maven mezclan demasiadas responsabilidades.
- Los contratos no estan versionados.
- Las pruebas no protegen cambios de framework.
- La configuracion sensible vive demasiado cerca del codigo.
- Los despliegues dependen de convenciones antiguas.
- La observabilidad no permite comparar antes y despues.

El primer objetivo de modernizacion no es actualizar todo. Es saber que pieza se puede mover, con que pruebas y con que criterio de exito.

## 06.3 Separar capas de cambio

Un error frecuente es mezclar demasiados cambios en una sola iniciativa: upgrade de Java, cambio de framework, refactor de dominio, migracion de despliegue, limpieza de endpoints y reescritura de tests. Ese paquete es dificil de revisar, probar y revertir.

Para Spotybank conviene separar capas:

| Capa | Ejemplo de cambio | Riesgo principal |
|---|---|---|
| Build | Maven parent, plugins, versionado | Romper compilacion o dependencias transitivas |
| Runtime | Java LTS, imagen base, JVM flags | Cambios de comportamiento y performance |
| Framework | Spring Boot, Camel, Swagger/OpenAPI | Incompatibilidades de APIs y configuracion |
| Dominio | Separar reglas, DTOs, contratos | Regresiones funcionales |
| Plataforma | OpenShift/Kubernetes, probes, resources | Fallos de despliegue o escalamiento |
| Observabilidad | Logs, metricas, trazas | Ruido o perdida de correlacion |
| Seguridad | Secretos, headers, autenticacion, dependencias | Exposicion o bloqueo de flujos legitimos |

Separar capas no significa trabajarlas aisladas para siempre. Significa que cada paso debe tener una hipotesis, una validacion y una forma de volver atras.

## 06.4 Baseline antes del upgrade

Antes de modernizar, hay que congelar una foto tecnica. Sin baseline, no se sabe si el cambio mejoro o empeoro.

Un baseline minimo incluye:

- Versiones de Java, Maven, Spring, Camel y plugins.
- Dependencias directas y transitivas relevantes.
- Servicios desplegables, workers, adapters y commons.
- Endpoints, colas y contratos principales.
- Pruebas existentes y su estado.
- Imagenes base y manifiestos de despliegue.
- Metricas disponibles.
- Riesgos y decisiones pendientes.

En Spotybank, este baseline se apoya en el inventario inicial: POMs, archivos Java, properties, Dockerfiles, Docker Compose y YAML/OpenShift/Kubernetes. La modernizacion empieza convirtiendo esa evidencia en control.

## 06.5 Estrategia de oleadas

Una ruta prudente puede organizarse por oleadas:

| Oleada | Objetivo | Resultado esperado |
|---|---|---|
| 1. Inventario reproducible | Saber que existe y que se toca | Lista confiable de artefactos |
| 2. Pruebas de caracterizacion | Proteger comportamiento actual | Red minima de regresion |
| 3. Build y dependencias | Ordenar Maven y plugins | Compilacion reproducible |
| 4. Runtime Java | Subir a LTS con piloto | Servicio ejecutable en runtime moderno |
| 5. Framework | Migrar Spring/Camel por familia | Configuracion compatible |
| 6. Contratos | OpenAPI, SOAP, AsyncAPI | Cambios gobernados |
| 7. Resiliencia | Timeouts, circuit breakers, DLQ | Fallos acotados |
| 8. Observabilidad | Logs, trazas, metricas | Comparacion antes/despues |
| 9. Extension por dominio | Repetir con servicios criticos | Aprendizaje escalable |

La clave no es seguir la tabla de manera rigida. La clave es evitar saltar a la oleada 5 sin haber construido red de seguridad en la oleada 2.

## 06.6 Elegir un piloto

El primer piloto no deberia ser el servicio mas critico. Conviene buscar una pieza que tenga valor de aprendizaje, pero impacto acotado.

Candidatos razonables:

- Servicio de soporte.
- Mock mantenido.
- Adapter con contrato controlado.
- Servicio con pruebas existentes.
- Componente con dependencia clara y pocos consumidores.

Evitar como primer piloto:

- Autenticacion central.
- MFA critico.
- Ledger o movimientos.
- Commons consumido por demasiados servicios.
- Servicio sin forma de probar comportamiento.

El piloto debe producir una guia repetible: que cambio se hizo, que fallo, que prueba protegio, que ajuste de build fue necesario y que metrica confirmo estabilidad.

## 06.7 Maven y parents educativos

Los parents Maven son una pieza sensible. Centralizan versiones, plugins, repositorios y convenciones. Bien usados, reducen repeticion. Mal usados, hacen que cada servicio herede complejidad que no entiende.

Para Spotybank conviene disenar parents educativos simples:

- `spotybank-parent-springboot`: servicios REST Spring Boot.
- `spotybank-parent-fuse`: rutas Camel/Fuse o integraciones.
- `spotybank-parent-commons`: librerias compartidas.
- `spotybank-parent-testing`: convenciones de JUnit, Mockito, Karate y contract tests.

Cada parent deberia explicar:

- Por que existe.
- Que versiones controla.
- Que plugins hereda.
- Que tipo de modulo puede usarlo.
- Que casos no deberian usarlo.
- Como se valida un cambio de version.

Una actualizacion de parent puede tocar decenas de modulos. Por eso debe tratarse como cambio de plataforma interna, no como refactor menor.

## 06.8 Java LTS y runtime

La migracion desde Java 8 hacia una version LTS moderna debe tratarse como programa. Cambiar runtime puede afectar dependencias, serializacion, reflexion, librerias de seguridad, drivers, plugins Maven, imagenes base y rendimiento.

Una ruta posible:

1. Inventariar dependencias y plugins.
2. Generar SBOM por modulo o familia.
3. Actualizar plugins Maven antes de cambiar runtime.
4. Ejecutar pruebas en runtime actual.
5. Ejecutar las mismas pruebas en runtime objetivo.
6. Revisar warnings, APIs removidas y cambios de comportamiento.
7. Medir performance antes y despues.
8. Documentar incompatibilidades.

Java 17 o Java 21 deben decidirse con evidencia: soporte de plataforma, librerias, compatibilidad Jakarta, politica de soporte y capacidad del equipo. La obra puede proponer escenarios, pero no cerrar una decision productiva sin contexto.

## 06.9 Spring Boot, Spring MVC y configuracion

Spring Boot merece el mismo cuidado que Java. Saltar varias versiones puede requerir cambios en properties, Actuator, seguridad, validacion, serializacion, path matching, dependencias transitivas y tests.

Riesgos frecuentes:

- Cambios en Spring Security.
- Migracion de `javax.*` a `jakarta.*`.
- Actuator endpoints diferentes.
- Configuracion antigua que ya no aplica.
- Cambios en Jackson o validacion.
- Starters no compatibles.
- Dependencias transitivas duplicadas.

Una migracion sana no empieza editando todo el repositorio. Empieza con un servicio piloto, una matriz de compatibilidad y una lista de errores reproducibles.

## 06.10 Camel, Fuse, SOAP y adapters

Los adapters SOAP/Camel no deben verse como piezas de segunda categoria. En sistemas bancarios suelen encapsular integraciones criticas. Modernizarlos exige prudencia.

Una estrategia sana:

- Mantener contrato externo encapsulado.
- Introducir modelos internos propios.
- Normalizar errores.
- Definir timeouts.
- Agregar circuit breakers donde corresponda.
- Crear mocks contractuales.
- Medir latencia por dependencia.
- Evitar que reglas de dominio queden dentro de rutas tecnicas.

El objetivo no siempre es eliminar SOAP de inmediato. A veces el primer paso correcto es aislarlo mejor, probarlo mejor y hacerlo observable.

## 06.11 Swagger, OpenAPI y contratos

Spotybank muestra evidencia de Swagger/Springfox y APIs REST. En una modernizacion, la documentacion de API debe convertirse en contrato verificable.

Un contrato util incluye:

- Version.
- Request y response de ejemplo.
- Codigos de error.
- Headers relevantes.
- Seguridad.
- Reglas de compatibilidad.
- Pruebas en CI.

La migracion hacia OpenAPI moderno puede hacerse servicio por servicio. Lo importante es que cada consumidor sepa que puede cambiar y que no.

Para mensajeria, el equivalente es documentar canales, payloads, errores, redelivery y DLQ. Si el flujo es asincronico, el contrato no desaparece: cambia de forma.

## 06.12 Testing como red de seguridad

Sin pruebas, la modernizacion es una apuesta. Spotybank necesita una red de seguridad por capas:

| Tipo de prueba | Protege |
|---|---|
| Unitarias | Reglas locales y transformaciones |
| Integracion | Persistencia, configuracion y clientes |
| Contract tests REST | Compatibilidad entre APIs y consumidores |
| Contract tests SOAP | Adapters e integraciones externas |
| Tests de mensajeria | Consumidores, redelivery e idempotencia |
| Karate | Flujos HTTP representativos |
| Regresion por funcionalidad | Casos de negocio completos |
| Carga basica | Latencia, saturacion y errores bajo volumen |

No hace falta cubrir todo antes de empezar. Pero cada servicio que se moderniza debe dejar mas pruebas que antes. Esa es una regla practica y honesta.

## 06.13 Resiliencia y retiro de deuda

La modernizacion tambien implica retirar patrones obsoletos. Hystrix, por ejemplo, puede tratarse como deuda historica si aparece en el ecosistema. El reemplazo no deberia ser solo "cambiar libreria". Debe revisar el comportamiento esperado:

- Que timeout aplica?
- Que errores son reintentables?
- Hay fallback?
- Como se mide apertura de circuito?
- Que metrica dispara alerta?
- Que ocurre con operaciones no idempotentes?

Resilience4j o Spring Cloud CircuitBreaker pueden ser opciones modernas, pero la decision depende de compatibilidad, equipo y plataforma. Lo importante es que la resiliencia quede explicita, observable y probada.

## 06.14 Observabilidad durante la migracion

Una migracion sin observabilidad no permite aprender. Cada oleada deberia medir:

- Latencia p50/p95/p99.
- Errores 4xx/5xx.
- Timeouts por dependencia.
- Consumo JVM: heap, GC, threads.
- Profundidad de cola.
- Redeliveries y DLQ.
- Tasa de tokens o mensajes fallidos.
- Correlation id entre REST, JMS y adapters.

La observabilidad permite decidir si el cambio mejoro el sistema o solo cambio su forma. Tambien permite detener una oleada antes de que el problema llegue a produccion.

## 06.15 Rollback y criterios de salida

Todo cambio de modernizacion necesita salida clara. Antes de ejecutar una oleada, definir:

- Criterio de exito.
- Criterio de abortar.
- Plan de rollback.
- Datos que se van a comparar.
- Riesgos aceptados.
- Owner de decision.
- Evidencia que quedara documentada.

Un rollback no es fracaso. Es parte de una modernizacion adulta. Permite aprender sin convertir cada intento en una apuesta irreversible.

## 06.16 Roadmap recomendado para Spotybank

Una secuencia realista:

1. Confirmar servicios desplegables contra librerias.
2. Externalizar configuracion sensible y placeholders educativos.
3. Definir parents educativos limpios.
4. Crear un servicio piloto de bajo riesgo.
5. Agregar pruebas de caracterizacion.
6. Migrar build y runtime del piloto.
7. Medir antes y despues.
8. Documentar guia de migracion.
9. Repetir por familia tecnologica.
10. Abordar dominios criticos con red de seguridad madura.

La modernizacion no avanza por entusiasmo. Avanza por aprendizaje acumulado.

## Ejercicio practico

Elegir un servicio de soporte de Spotybank y disenar su plan de modernizacion.

### Entregables

1. Version actual inferida.
2. Dependencias principales.
3. Riesgos de upgrade.
4. Pruebas necesarias antes del cambio.
5. Cambios de Maven.
6. Cambios de runtime.
7. Contratos afectados.
8. Metricas antes/despues.
9. Evidencia de exito.
10. Plan de rollback.

### Criterios de exito

| Criterio | Esperado |
|---|---|
| Alcance | El plan separa build, runtime, framework y dominio |
| Prudencia | No propone migracion Big Bang |
| Pruebas | Define red minima antes del cambio |
| Observabilidad | Incluye metricas para comparar |
| Reversibilidad | Tiene criterio de abortar y rollback |
| Documentacion | Deja guia reutilizable para otros servicios |

## Resumen del capitulo

- Modernizar no es reescribir.
- Los cambios deben separarse por capas y oleadas.
- Maven, Java, Spring Boot, Camel y plataforma requieren rutas controladas.
- Las pruebas y contratos son la red de seguridad.
- La observabilidad convierte la modernizacion en aprendizaje medible.
- Un piloto bien elegido reduce riesgo y crea una guia repetible.
- Todo cambio serio necesita criterio de exito, criterio de abortar y rollback.

## Preguntas de revision

1. Por que una migracion Big Bang es riesgosa en Spotybank?
2. Que diferencia hay entre upgrade de runtime y refactor de dominio?
3. Por que los contract tests son importantes antes de cambiar framework?
4. Que servicio elegirias como piloto y por que?
5. Que metrica usarias para demostrar que una migracion mejoro el sistema?

## Referencias del capitulo

- `Documentacion/arquitectura/roadmap-mejoras.md`
- `Documentacion/arquitectura/backlog-tecnico.md`
- `Documentacion/arquitectura/vision-general.md`
- `Documentacion/microservicios/README.md`
- `Documentacion/gobernanza/definicion-done-documentacion.md`
- `SPOTYBANK_GUIA_IA_MODERNIZACION/02_PLANIFICACION/MAPA_MODERNIZACION_DESDE_FUENTES.md`
- `SPOTYBANK_GUIA_IA_MODERNIZACION/02_PLANIFICACION/FASCICULOS_EJECUTABLES_POR_PERFIL.md`
- `SPOTYBANK_GUIA_IA_MODERNIZACION/04_CUERPO_PRINCIPAL/CAP_02_Marco_Teorico/CAP_02_BORRADOR.md`
