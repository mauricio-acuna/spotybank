# Notas de investigacion - Capitulo 09

## Fuentes revisadas

- `Documentacion/arquitectura/escalamiento-performance.md`
- `Documentacion/arquitectura/catalogo-mensajeria.md`
- `Documentacion/arquitectura/matriz-relaciones.md`
- `Documentacion/diagramas/secuencias-criticas.md`
- `Documentacion/runbooks/incidentes-comunes.md`
- `SPOTYBANK_GUIA_IA_MODERNIZACION/02_PLANIFICACION/MAPA_MODERNIZACION_DESDE_FUENTES.md`
- `SPOTYBANK_GUIA_IA_MODERNIZACION/02_PLANIFICACION/FASCICULOS_EJECUTABLES_POR_PERFIL.md`
- `SPOTYBANK_GUIA_IA_MODERNIZACION/04_CUERPO_PRINCIPAL/CAP_08_Despliegue_Cloud_Native/CAP_08_BORRADOR.md`

## Ideas clave

- Performance debe presentarse como comportamiento medible, no como percepcion.
- SLIs y SLOs son educativos, no compromisos productivos reales.
- Percentiles, pools, colas, dependencias y recursos de plataforma explican mas que promedios aislados.
- HPA no debe proponerse sin requests, metricas y comprension de bottlenecks.
- Resiliencia combina timeouts, retries, circuit breakers, idempotencia, DLQ y observabilidad.
- Pruebas de carga y resiliencia deben partir de hipotesis y datos sinteticos.

## Argumento editorial

El capitulo debe ensenar a convertir sospechas de performance en experimentos. La promesa no es "hacer rapido Spotybank", sino dar al lector una forma de medir, explicar y mejorar con prudencia.

La obra debe insistir en que escalar puede mover el problema a otra dependencia. Antes de agregar replicas hay que entender pools, colas, base de datos, brokers y proveedores externos.

## Decisiones cerradas

- Usar SLIs/SLOs como herramienta educativa.
- Incluir percentiles para evitar dependencia del promedio.
- Conectar performance con mensajeria, DLQ, idempotencia y resiliencia.
- Exigir hipotesis y criterio de exito en pruebas de carga.
- Mantener datos sinteticos como regla en laboratorios.

## Decisiones pendientes para versiones futuras

- Crear plantilla de prueba de carga.
- Agregar ejemplo resuelto con k6, JMeter o Gatling.
- Crear figura de flujo de observabilidad.
- Revisar plan con perfil SRE/performance externo.
