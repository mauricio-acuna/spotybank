# Notas de investigacion - Capitulo 02

## Fuentes revisadas

- `01_INVESTIGACION/notas_campo/EVIDENCIA_FUENTES_MICROSERVICIOS_2026-05-11.md`
- `02_PLANIFICACION/MAPA_EVIDENCIAS_SPOTYBANK.md`
- `02_PLANIFICACION/MAPA_MODERNIZACION_DESDE_FUENTES.md`
- `07_FIGURAS_Y_TABLAS/TABLAS_EJECUTIVAS_MODERNIZACION.md`
- `02_PLANIFICACION/INDICE_PROVISIONAL.md`

## Evidencia usada

- 63 archivos `pom.xml`.
- 2604 archivos Java.
- 132 archivos `application*.properties`.
- 47 Dockerfiles.
- 47 archivos Docker Compose.
- 336 archivos YAML/OpenShift/Kubernetes.
- Senales de Spring Boot, Spring MVC, Apache Camel/Fuse, SOAP/CXF, JMS, MongoDB, JPA, Swagger/Springfox, Karate, JUnit, Mockito, Docker y OpenShift.

## Ideas clave

- El inventario es el primer acto de gobierno tecnico de una modernizacion.
- No todo modulo Maven es un microservicio; hay que distinguir servicios, workers, adapters, librerias, parents, mocks y soporte.
- La configuracion es evidencia, pero tambien riesgo de exposicion.
- Estar containerizado no equivale a operar de forma cloud native.
- La IA puede acelerar el inventario si se le exige separar evidencia, inferencia y decision pendiente.

## Argumento editorial

El capitulo 2 debe convencer al lector de que inventariar no es una tarea administrativa. Es la base que evita migraciones impulsivas, diagnosticos superficiales y decisiones sin trazabilidad. El tono debe ser tecnico y directo: antes de modernizar, hay que saber que existe y cuanto de eso se puede afirmar.

## Decisiones cerradas

- Usar los conteos observados como fotografia estatica, no como certificacion productiva.
- Organizar el capitulo por evidencia, clasificacion, stack, configuracion, dependencias y validacion externa.
- Mantener una actividad practica centrada en clasificar componentes y formular preguntas para owners.
- Cerrar el capitulo con baseline reproducible, matriz de riesgo, salida minima esperada de IA y controles de ejercicio.
- Registrar que no quedan pendientes editoriales internos para el capitulo 2 en el ciclo `v0.2-editorial`.
