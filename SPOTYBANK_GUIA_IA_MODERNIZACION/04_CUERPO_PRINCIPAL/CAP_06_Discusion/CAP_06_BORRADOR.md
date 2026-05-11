# Capitulo 06 - Modernizacion de Backend

## Objetivos del capitulo

Al finalizar este capitulo, el lector podra:

- Diseñar una ruta de modernizacion incremental para servicios Java/Spring heredados.
- Priorizar upgrades sin caer en una migracion Big Bang.
- Separar cambios de plataforma, cambios de framework y cambios de dominio.
- Proponer pruebas, contratos y observabilidad como red de seguridad para evolucionar Spotybank.

## 06.1 Modernizar no es reescribir

Modernizar un sistema como Spotybank no significa borrar todo y empezar de cero. Esa tentacion suele aparecer cuando el stack parece viejo, la documentacion es incompleta y las dependencias estan dispersas. Sin embargo, una reescritura completa puede destruir conocimiento funcional, multiplicar riesgos y dejar al equipo durante meses sin entregar valor.

La modernizacion responsable busca evolucionar por cortes controlados. Cada corte debe tener un objetivo claro: reducir riesgo, mejorar mantenibilidad, aumentar seguridad, mejorar performance o habilitar una capacidad nueva. Si un cambio no se puede explicar en esos terminos, probablemente sea solo movimiento tecnico.

## 06.2 Punto de partida tecnologico

La inspeccion estatica de Spotybank muestra una base Java 8/Maven con Spring Boot, Apache Camel/Fuse, SOAP/CXF, MongoDB, JMS/IBM MQ, Swagger/Springfox, Karate, JUnit, Mockito, Docker y OpenShift. Esta combinacion es comun en sistemas empresariales que crecieron durante varias generaciones tecnologicas.

El problema no es que esas tecnologias existan. El problema aparece cuando:

- Las versiones ya no reciben soporte.
- Los parents Maven mezclan demasiadas responsabilidades.
- Los contratos no estan versionados.
- Las pruebas no protegen cambios de framework.
- La configuracion sensible vive demasiado cerca del codigo.
- Los despliegues dependen de convenciones antiguas.

El primer objetivo de modernizacion no es actualizar todo, sino saber que pieza se puede mover sin romper las demas.

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

Separar capas no significa trabajarlas de forma aislada para siempre. Significa que cada paso debe tener una hipotesis y una validacion.

## 06.4 Estrategia de oleadas

Una modernizacion incremental puede organizarse por oleadas:

1. Saneamiento y seguridad.
2. Compilacion reproducible.
3. Pruebas de caracterizacion.
4. Contratos REST/SOAP/mensajeria.
5. Upgrade de servicios de menor criticidad.
6. Piloto en un dominio controlado.
7. Extendido por familias de servicios.
8. Retiro de patrones obsoletos.

En Spotybank, una oleada prudente comenzaria por servicios de soporte, mocks o componentes menos criticos. Despues podria avanzar hacia autenticacion, MFA y notificaciones, siempre con pruebas y evidencia.

## 06.5 Maven y parents educativos

Los parents Maven son una pieza sensible. Centralizan versiones, plugins, repositorios y convenciones. Bien usados, reducen repeticion. Mal usados, hacen que cada servicio herede complejidad que no entiende.

Para Spotybank conviene diseñar parents educativos simples:

- `spotybank-parent-springboot`: servicios REST Spring Boot.
- `spotybank-parent-fuse`: rutas Camel/Fuse o integraciones.
- `spotybank-parent-commons`: librerias compartidas.
- `spotybank-parent-testing`: convenciones de JUnit, Mockito, Karate y contract tests.

Cada parent deberia explicar por que existe, que hereda y cuando no debe usarse.

## 06.6 Java y Spring Boot

La migracion desde Java 8 hacia una version LTS moderna debe tratarse como programa, no como tarea aislada. Cambiar la version del lenguaje puede afectar dependencias, serializacion, reflexion, librerias de seguridad, drivers, plugins Maven e imagenes base.

Una ruta posible:

1. Hacer inventario de dependencias.
2. Generar SBOM por modulo.
3. Actualizar plugins Maven.
4. Subir primero servicios de bajo riesgo.
5. Ejecutar pruebas de contrato y regresion.
6. Medir performance antes y despues.
7. Documentar incompatibilidades.

Spring Boot merece el mismo cuidado. Saltar varias versiones puede requerir cambios en properties, Actuator, seguridad, manejo de errores, path matching, serializacion y dependencias transversales.

## 06.7 Swagger, OpenAPI y contratos

Spotybank tiene evidencia de Swagger/Springfox y APIs REST. En una modernizacion, la documentacion de API debe convertirse en contrato verificable, no solo en pagina generada.

Un contrato util debe incluir:

- Version.
- Request y response de ejemplo.
- Codigos de error.
- Headers relevantes.
- Seguridad.
- Reglas de compatibilidad.
- Pruebas en CI.

La migracion hacia OpenAPI moderno puede hacerse servicio por servicio. Lo importante es que cada consumidor sepa que puede cambiar y que no.

## 06.8 SOAP, Camel y adapters

Los adapters SOAP/Camel no deben verse como piezas de segunda categoria. En sistemas bancarios, suelen encapsular integraciones criticas. Modernizarlos exige prudencia.

Una estrategia sana:

- Mantener contrato externo encapsulado.
- Introducir modelos internos propios.
- Normalizar errores.
- Definir timeouts.
- Agregar circuit breakers donde corresponda.
- Crear mocks contractuales.
- Medir latencia por dependencia.

El objetivo no siempre es eliminar SOAP de inmediato. A veces el primer paso correcto es aislarlo mejor.

## 06.9 Testing como red de seguridad

Sin pruebas, la modernizacion es una apuesta. Spotybank necesita una red de seguridad por capas:

- Tests unitarios para reglas locales.
- Tests de integracion para persistencia y configuracion.
- Contract tests para REST y SOAP.
- Tests de consumidores para colas.
- Karate para flujos HTTP representativos.
- Pruebas de regresion por funcionalidad.
- Pruebas de carga basicas antes de tocar performance.

No hace falta cubrir todo antes de empezar. Pero cada servicio que se moderniza debe dejar mas pruebas que antes.

## 06.10 Observabilidad durante la migracion

Una migracion sin observabilidad no permite aprender. Cada oleada deberia medir:

- Latencia p50/p95/p99.
- Errores 4xx/5xx.
- Timeouts por dependencia.
- Consumo JVM: heap, GC, threads.
- Profundidad de cola.
- Redeliveries y DLQ.
- Tasa de tokens o mensajes fallidos.

La observabilidad permite decidir si el cambio mejoro el sistema o solo cambio su forma.

## 06.11 Roadmap recomendado para Spotybank

Una secuencia realista:

1. Confirmar servicios desplegables contra librerias.
2. Rotar secretos y externalizar configuracion.
3. Definir parents educativos limpios.
4. Crear un servicio piloto de bajo riesgo.
5. Agregar pruebas de caracterizacion.
6. Migrar build y runtime del piloto.
7. Medir antes y despues.
8. Documentar guia de migracion.
9. Repetir por dominio.
10. Abordar dominios criticos con red de seguridad madura.

## 06.12 Ejercicio practico

Elegir un servicio de soporte de Spotybank y diseñar su plan de modernizacion:

- Version actual inferida.
- Dependencias principales.
- Riesgos de upgrade.
- Pruebas necesarias antes del cambio.
- Cambios de Maven.
- Cambios de runtime.
- Evidencia de exito.
- Plan de rollback.

## Resumen del capitulo

- Modernizar no es reescribir.
- Los cambios deben separarse por capas.
- Maven, Java, Spring Boot, Camel y plataforma requieren oleadas controladas.
- Las pruebas y contratos son la red de seguridad.
- La observabilidad convierte la modernizacion en aprendizaje medible.

## Preguntas de revision

1. Por que una migracion Big Bang es riesgosa en Spotybank?
2. Que diferencia hay entre upgrade de runtime y refactor de dominio?
3. Por que los contracts tests son importantes antes de cambiar framework?
4. Que servicio elegirias como piloto y por que?

## Referencias del capitulo

- `Documentacion/arquitectura/roadmap-mejoras.md`
- `Documentacion/arquitectura/backlog-tecnico.md`
- `Documentacion/arquitectura/vision-general.md`
- `Documentacion/microservicios/README.md`
- `Documentacion/gobernanza/definicion-done-documentacion.md`

