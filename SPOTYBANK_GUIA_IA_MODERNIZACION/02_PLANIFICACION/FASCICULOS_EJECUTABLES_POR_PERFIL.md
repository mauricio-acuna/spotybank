# Fasciculos ejecutables por perfil

Fecha de elaboracion: 2026-05-12

Este documento convierte el plan editorial de Spotybank en paquetes de trabajo utilizables en aula, empresa, instituto o equipo de mantenimiento. Cada fasciculo puede publicarse de forma independiente o integrarse como parte de un libro unico.

La regla de diseno es simple: cada fasciculo debe tener una promesa clara, una practica verificable y un entregable que pueda revisarse sin acceso a sistemas reales.

## Vista general

| Fasciculo | Perfil principal | Duracion sugerida | Entregable principal | Requiere decision externa |
|---|---|---:|---|---|
| 0 - Presentacion del caso | Direccion academica, lideres tecnicos | 2 a 4 h | Ficha de adopcion del caso Spotybank | No |
| 1 - Inventario del sistema | Backend, onboarding tecnico | 6 a 8 h | Inventario tecnico reproducible | No |
| 2 - Arquitectura y dominios | Arquitectura, backend senior | 8 a 12 h | Mapa de dominios y fronteras | No |
| 3 - Seguridad y DevSecOps | Seguridad, DevOps, arquitectura | 8 a 12 h | Checklist de saneamiento y hardening | No |
| 4 - Modernizacion Java/Spring/Maven | Backend senior | 12 a 16 h | Plan de migracion incremental | Parcial |
| 5 - QA, contratos y datos de prueba | QA, backend, arquitectura | 8 a 12 h | Suite de regresion y contratos | No |
| 6 - Nube y observabilidad | DevOps/SRE, arquitectura | 8 a 12 h | Manifiesto cloud native modelo | Parcial |
| 7 - Performance y resiliencia | SRE, performance, backend | 8 a 12 h | Plan de medicion y resiliencia | Parcial |
| 8 - Diseno curricular | Docentes, formadores, coordinacion | 4 a 8 h | Programa de curso y rubrica | No |

## Fasciculo 0: presentacion del caso

Perfil principal: direccion academica, lideres tecnicos, coordinadores de formacion.

Promesa: entender por que Spotybank es un caso educativo util para modernizacion de microservicios bancarios asistida por IA.

Material base:

- `03_PARTES_PRELIMINARES/PREFACIO.md`
- `00_GESTION_PROYECTO/FICHA_PROYECTO.md`
- `04_CUERPO_PRINCIPAL/CAP_01_Introduccion/CAP_01_BORRADOR.md`
- `04_CUERPO_PRINCIPAL/CAP_03_Metodologia/CAP_03_BORRADOR.md`

Practica guiada:

1. Identificar el publico objetivo.
2. Separar objetivos academicos, tecnicos y de producto.
3. Definir que partes del caso se usaran en una primera cohorte.
4. Registrar riesgos de adopcion: tiempo, herramientas, nivel previo y revision.

Entregable:

- Ficha de adopcion con alcance, perfiles, horas disponibles, prerequisitos y criterios de exito.

Criterios de evaluacion:

- El alcance es realista.
- El caso no promete acceso a sistemas reales.
- La ficha explicita que Spotybank es material educativo saneado.
- La adopcion incluye una forma de evaluar aprendizaje.

## Fasciculo 1: inventario del sistema

Perfil principal: backend, onboarding tecnico, mantenimiento.

Promesa: aprender a leer un sistema de microservicios desde sus fuentes antes de tocar codigo.

Material base:

- `01_INVESTIGACION/notas_campo/EVIDENCIA_FUENTES_MICROSERVICIOS_2026-05-11.md`
- `04_CUERPO_PRINCIPAL/CAP_02_Marco_Teorico/CAP_02_BORRADOR.md`
- `02_PLANIFICACION/MAPA_EVIDENCIAS_SPOTYBANK.md`

Practica guiada:

1. Contar POMs, Java, propiedades, Dockerfiles y YAML.
2. Clasificar artefactos en servicios, commons, adapters, pruebas y despliegue.
3. Detectar tecnologias por evidencia, no por memoria del equipo.
4. Crear una matriz minima: modulo, stack, entrada, salida, persistencia y despliegue.

Entregable:

- Inventario tecnico reproducible con criterios de clasificacion.

Criterios de evaluacion:

- Cada afirmacion tiene evidencia local.
- Las inferencias estan marcadas como inferencias.
- No se copian secretos ni endpoints sensibles.
- El inventario permite priorizar trabajo posterior.

## Fasciculo 2: arquitectura y dominios

Perfil principal: arquitectura, backend senior, analistas tecnicos.

Promesa: convertir servicios dispersos en un mapa de dominios entendible.

Material base:

- `04_CUERPO_PRINCIPAL/CAP_04_Desarrollo/CAP_04_BORRADOR.md`
- `04_CUERPO_PRINCIPAL/CAP_05_Resultados/CAP_05_BORRADOR.md`
- `02_PLANIFICACION/MAPA_MODERNIZACION_DESDE_FUENTES.md`

Practica guiada:

1. Agrupar servicios por capacidad: autenticacion, cuentas, ledger, MFA, notificaciones, integraciones y commons.
2. Dibujar fronteras de dominio y dependencias.
3. Identificar adapters externos y contratos.
4. Proponer una frontera para `spotybank-core-ledger` sin implementarla todavia.

Entregable:

- Mapa de dominios, tabla de relaciones y ADR breve sobre fronteras propuestas.

Criterios de evaluacion:

- Los dominios no se definen por nombre de carpeta solamente.
- Las dependencias criticas se distinguen de dependencias auxiliares.
- Las integraciones externas quedan encapsuladas como adapters.
- El ledger aparece como propuesta arquitectonica, no como modulo ya existente.

## Fasciculo 3: seguridad y DevSecOps

Perfil principal: seguridad, DevOps, arquitectura, responsables de publicacion.

Promesa: aprender a convertir un workspace historico en material publicable sin exponer identidad, secretos ni datos sensibles.

Material base:

- `04_CUERPO_PRINCIPAL/CAP_03_Metodologia/CAP_03_BORRADOR.md`
- `04_CUERPO_PRINCIPAL/CAP_07_Conclusiones/CAP_07_BORRADOR.md`
- `01_INVESTIGACION/referencias_bibliograficas/REFERENCIAS_MODERNIZACION_2026.md`

Practica guiada:

1. Definir patrones prohibidos de publicacion.
2. Revisar configuraciones y manifiestos sin copiar valores sensibles.
3. Clasificar secretos, endpoints, usuarios, dominios y nombres propios.
4. Proponer controles de pipeline: escaneo, bloqueo, revision y evidencia.

Entregable:

- Checklist DevSecOps para Spotybank y politica de publicacion segura.

Criterios de evaluacion:

- El checklist bloquea secretos reales.
- La politica distingue secretos de configuracion no sensible.
- La obra conserva valor educativo sin datos reales.
- La publicacion queda separada del workspace tecnico completo.

## Fasciculo 4: modernizacion Java/Spring/Maven

Perfil principal: backend senior, lideres tecnicos.

Promesa: disenar una ruta de upgrade incremental sin romper comportamiento observable.

Material base:

- `04_CUERPO_PRINCIPAL/CAP_06_Discusion/CAP_06_BORRADOR.md`
- `02_PLANIFICACION/MAPA_MODERNIZACION_DESDE_FUENTES.md`
- `01_INVESTIGACION/referencias_bibliograficas/REFERENCIAS_MODERNIZACION_2026.md`

Practica guiada:

1. Separar padres Maven Spring, Fuse y Commons.
2. Identificar dependencias legacy: Hystrix, Swagger/Springfox, JUnit 4, Camel/Fuse.
3. Proponer una matriz de compatibilidad Java, Spring, Camel, CXF y testing.
4. Elegir un servicio piloto de bajo riesgo para modernizacion.

Entregable:

- Plan de migracion por oleadas con piloto, red de pruebas, criterios de rollback y deuda conocida.

Criterios de evaluacion:

- No se mezclan upgrade de runtime, refactor funcional y despliegue en una sola oleada.
- La migracion incluye pruebas antes de cambios profundos.
- Se registra que Java 17/21 y Spring Boot 3/4 requieren decision tecnica final.
- La propuesta preserva contratos externos.

## Fasciculo 5: QA, contratos y datos de prueba

Perfil principal: QA, backend, arquitectura.

Promesa: construir una red de seguridad para modernizar sin depender de ambientes reales.

Material base:

- `05_APENDICES/APE_F_Ejercicios_Laboratorios/LABORATORIOS_POR_PERFIL.md`
- `05_APENDICES/APE_F_Ejercicios_Laboratorios/RUBRICAS_EVALUACION.md`
- `01_INVESTIGACION/notas_campo/EVIDENCIA_FUENTES_MICROSERVICIOS_2026-05-11.md`

Practica guiada:

1. Tomar un flujo REST o JMS representativo.
2. Definir contrato de entrada, salida y errores.
3. Crear fixtures saneados.
4. Proponer migracion de pruebas hacia JUnit 5 y Karate actual.
5. Separar pruebas unitarias, contractuales, integracion y performance.

Entregable:

- Suite modelo de regresion con contratos y datos sinteticos.

Criterios de evaluacion:

- Los datos de prueba no contienen informacion real.
- El contrato cubre flujo feliz y errores.
- Las pruebas pueden ejecutarse en un entorno educativo.
- El resultado protege una migracion tecnica.

## Fasciculo 6: nube y observabilidad

Perfil principal: DevOps/SRE, arquitectura.

Promesa: pasar de contenedores existentes a operacion cloud native medible.

Material base:

- `04_CUERPO_PRINCIPAL/CAP_08_Despliegue_Cloud_Native/CAP_08_BORRADOR.md`
- `02_PLANIFICACION/MAPA_MODERNIZACION_DESDE_FUENTES.md`
- `07_FIGURAS_Y_TABLAS/FIGURAS_MERMAID_INICIALES.md`

Practica guiada:

1. Tomar un manifiesto con `resources: {}` y proponer requests/limits iniciales.
2. Agregar probes conceptuales: startup, readiness y liveness.
3. Definir correlation id y convencion de logs.
4. Proponer instrumentacion OpenTelemetry para Java.
5. Dibujar un dashboard minimo por dominio.

Entregable:

- Manifiesto modelo cloud native y checklist de observabilidad.

Criterios de evaluacion:

- Las probes no son solo endpoints genericos sin semantica.
- Los resources tienen justificacion inicial.
- El HPA no se propone antes de tener metricas y requests.
- La observabilidad conecta REST, JMS, DB y adapters externos.

## Fasciculo 7: performance y resiliencia

Perfil principal: SRE, performance, backend senior.

Promesa: convertir sospechas de performance en hipotesis medibles.

Material base:

- `04_CUERPO_PRINCIPAL/CAP_09_Performance_Escalamiento_Resiliencia/CAP_09_BORRADOR.md`
- `02_PLANIFICACION/MAPA_MODERNIZACION_DESDE_FUENTES.md`
- `07_FIGURAS_Y_TABLAS/TABLAS_EJECUTIVAS_MODERNIZACION.md`

Practica guiada:

1. Elegir un flujo: autenticacion, MFA, notificaciones o ledger propuesto.
2. Definir SLI, SLO educativo y presupuesto de error.
3. Identificar colas, base de datos y adapter externo.
4. Proponer timeouts, retry, DLQ, circuit breaker e idempotencia.
5. Escribir un plan de prueba de carga.

Entregable:

- Plan de performance y resiliencia con hipotesis, metricas y criterios de exito.

Criterios de evaluacion:

- Cada mejora tiene una metrica asociada.
- No se prometen resultados sin medicion.
- Retry y circuit breaker no duplican operaciones sensibles.
- La DLQ tiene criterio de atencion y reproceso.

## Fasciculo 8: diseno curricular

Perfil principal: docentes, formadores, coordinadores academicos.

Promesa: convertir Spotybank en curso, taller o proyecto final.

Material base:

- `04_CUERPO_PRINCIPAL/CAP_11_Spotybank_Como_Curso/CAP_11_BORRADOR.md`
- `02_PLANIFICACION/PLANES_CLASE.md`
- `05_APENDICES/APE_F_Ejercicios_Laboratorios/EJERCICIOS_POR_CAPITULO.md`
- `05_APENDICES/APE_F_Ejercicios_Laboratorios/RUBRICAS_EVALUACION.md`

Practica guiada:

1. Elegir duracion: 12, 24, 40 u 80 horas.
2. Elegir perfiles foco.
3. Seleccionar fasciculos obligatorios y optativos.
4. Definir proyecto final y criterios de rubrica.
5. Preparar una dinamica de revision por pares.

Entregable:

- Programa de curso con objetivos, sesiones, practicas, entregables y rubrica.

Criterios de evaluacion:

- La carga horaria coincide con el alcance.
- El curso evita depender de credenciales o ambientes reales.
- Cada modulo produce una evidencia revisable.
- La rubrica evalua razonamiento tecnico, seguridad y comunicacion.

## Secuencia por duracion

| Formato | Fasciculos recomendados | Resultado |
|---|---|---|
| Taller 1 dia | 0, 1 y 3 | Entender el caso, inventariar y sanear. |
| Curso 12 h | 0, 1, 2 y 3 | Base de arquitectura y seguridad. |
| Curso 24 h | 0 a 6 | Caso completo con modernizacion y nube. |
| Curso 40 h | 0 a 8 | Curso integral con proyecto final. |
| Programa 80 h | 0 a 8 + proyecto extendido | Modernizacion guiada por equipos. |

## Backlog de publicacion por fasciculo

| Fasciculo | Estado editorial | Proximo paso local |
|---|---|---|
| 0 | Listo como borrador ejecutable | Derivar PDF/HTML piloto cuando se defina formato. |
| 1 | Listo como borrador ejecutable | Agregar capturas o tablas exportadas si se requiere maquetacion. |
| 2 | Listo como borrador ejecutable | Exportar diagrama de dominios desde Mermaid. |
| 3 | Listo como borrador ejecutable | Agregar ejemplo de pipeline de escaneo en version futura. |
| 4 | Listo como borrador ejecutable | Crear matriz tecnica por servicio piloto. |
| 5 | Listo como borrador ejecutable | Agregar plantilla de caso Karate/JUnit 5 en apendice futuro. |
| 6 | Listo como borrador ejecutable | Agregar YAML educativo completo en apendice futuro. |
| 7 | Listo como borrador ejecutable | Agregar plantilla de prueba de carga en apendice futuro. |
| 8 | Listo como borrador ejecutable | Preparar version para docentes con agenda imprimible. |

## Limites

Estos fasciculos no cierran decisiones externas:

- Version final de Java/Spring/Camel.
- Plataforma cloud definitiva.
- Licencia editorial final.
- Revision humana por perfiles.
- Release publico estable.

Lo que si permiten hacer es avanzar con material educativo coherente, revisable y seguro.

