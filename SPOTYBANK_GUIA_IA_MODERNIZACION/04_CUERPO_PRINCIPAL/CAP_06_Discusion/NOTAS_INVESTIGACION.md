# Notas de investigacion - Capitulo 06

## Fuentes revisadas

- `Documentacion/arquitectura/roadmap-mejoras.md`
- `Documentacion/arquitectura/backlog-tecnico.md`
- `Documentacion/arquitectura/vision-general.md`
- `Documentacion/microservicios/README.md`
- `Documentacion/gobernanza/definicion-done-documentacion.md`
- `SPOTYBANK_GUIA_IA_MODERNIZACION/02_PLANIFICACION/MAPA_MODERNIZACION_DESDE_FUENTES.md`
- `SPOTYBANK_GUIA_IA_MODERNIZACION/02_PLANIFICACION/FASCICULOS_EJECUTABLES_POR_PERFIL.md`
- `SPOTYBANK_GUIA_IA_MODERNIZACION/04_CUERPO_PRINCIPAL/CAP_02_Marco_Teorico/CAP_02_BORRADOR.md`

## Ideas clave

- Modernizar backend no equivale a reescribir ni a subir versiones de forma masiva.
- La ruta debe separar build, runtime, framework, dominio, plataforma, observabilidad y seguridad.
- Java 17/21 y Spring Boot 3/4 son validaciones externas que dependen de compatibilidad y soporte.
- Los parents Maven deben tratarse como plataforma interna.
- Pruebas, contratos y observabilidad son la red minima antes de tocar servicios criticos.
- Hystrix/Springfox/JUnit 4 pueden presentarse como deuda historica y camino de migracion.
- Cada oleada necesita criterio de exito, criterio de abortar y rollback.

## Argumento editorial

El capitulo debe evitar dos extremos: la reescritura total y la actualizacion mecanica sin criterio. La modernizacion se presenta como aprendizaje incremental: escoger un piloto, proteger comportamiento, mover una capa, medir y repetir.

La obra debe insistir en que no todas las decisiones tecnicas pueden cerrarse desde evidencia estatica. Version final de Java, ruta Spring Boot, compatibilidad Camel/CXF y estrategia de plataforma requieren validacion externa o laboratorio especifico.

## Decisiones cerradas

- Proponer modernizacion por oleadas, no Big Bang.
- Separar claramente build, runtime, framework, dominio, plataforma, observabilidad y seguridad.
- Recomendar piloto de bajo riesgo antes de dominios criticos.
- Exigir pruebas de caracterizacion y contratos como red de seguridad.
- Incluir rollback y criterios de salida como parte de la modernizacion.
- Cerrar el capitulo con compuertas de baseline, oleada, matriz Java/Spring, pruebas, observabilidad y rollback.
- Registrar que no quedan pendientes editoriales internos para el capitulo 6 en el ciclo `v0.2-editorial`.

## Mejoras futuras no bloqueantes

- Definir laboratorio resuelto de migracion de un servicio piloto.
- Crear matriz comparativa Java 17 vs Java 21 para el caso educativo.
- Detallar ruta Spring Boot 3.x/4.x segun compatibilidad Jakarta.
- Agregar plantilla de contract test REST/SOAP/mensajeria.
- Revisar estrategia con perfil backend senior externo.
