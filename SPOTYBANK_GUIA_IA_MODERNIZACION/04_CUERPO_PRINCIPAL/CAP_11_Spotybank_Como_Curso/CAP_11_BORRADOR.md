# Capitulo 11 - Spotybank como Curso

Un repositorio no es automaticamente un curso. Tampoco lo es un libro tecnico. Para convertirse en experiencia formativa, Spotybank necesita recorrido, objetivos, consignas, criterios de evaluacion, evidencias y momentos de discusion.

La fuerza del caso esta en que todos trabajan sobre el mismo sistema, pero no todos miran lo mismo. Un perfil backend se concentra en codigo, pruebas y refactor. Un perfil de arquitectura mira dominios, contratos y dependencias. Un perfil DevOps/SRE mira despliegue, observabilidad y continuidad. Un perfil de seguridad mira secretos, amenazas y controles. Un perfil QA convierte riesgos en escenarios de prueba. Un docente convierte todo eso en secuencias de aprendizaje.

El valor pedagogico aparece cuando esos perfiles se encuentran y deben justificar decisiones con evidencia.

## Objetivos del capitulo

Al finalizar este capitulo, el lector podra:

- Convertir Spotybank en una experiencia formativa por perfiles.
- Disenar laboratorios progresivos para desarrollo, arquitectura, seguridad, DevOps, QA y docencia.
- Construir rubricas de evaluacion basadas en evidencia.
- Proponer un proyecto final por equipos.
- Adaptar el caso a universidades, institutos, empresas y centros de formacion profesional.
- Definir rutas de 12, 24, 40 y 80 horas con entregables revisables.

## 11.1 De repositorio a producto educativo

Un producto educativo necesita mas que contenido. Necesita una promesa clara: que habilidad desarrolla, con que practica, en cuanto tiempo y como se evalua.

Spotybank puede funcionar como:

- Libro tecnico.
- Curso por fasciculos.
- Taller intensivo.
- Proyecto final.
- Caso de onboarding.
- Simulacion de comite tecnico.
- Laboratorio de modernizacion asistida por IA.

La clave es elegir alcance. Si se intenta cubrir todo en pocas horas, el caso abruma. Si se selecciona una ruta por perfil, el sistema se vuelve manejable.

## 11.2 Principio de aprendizaje situado

Spotybank ensena mejor cuando el estudiante trabaja sobre problemas realistas:

- Hay deuda tecnica.
- Hay incertidumbre.
- Hay documentacion incompleta.
- Hay riesgos de seguridad.
- Hay decisiones pendientes.
- Hay tradeoffs.
- Hay limitaciones de plataforma.
- Hay que comunicar a otros perfiles.

Esto es distinto de un tutorial perfecto. En un tutorial, cada paso esta despejado. En Spotybank, parte del aprendizaje consiste en ordenar el terreno.

## 11.3 Resultados de aprendizaje

Una ruta formativa deberia producir resultados observables:

| Resultado | Evidencia esperada |
|---|---|
| Leer un sistema heredado | Inventario con evidencia local |
| Separar hechos e inferencias | Matriz evidencia/inferencia/pendiente |
| Proponer modernizacion | Roadmap incremental con rollback |
| Documentar microservicios | README y catalogos revisables |
| Pensar seguridad | Threat model y backlog DevSecOps |
| Operar cloud native | Ficha runtime y manifiesto modelo |
| Medir performance | Plan de carga con SLI/SLO educativo |
| Usar IA responsablemente | Prompt, salida clasificada y validacion |

La evaluacion no deberia premiar cantidad de texto. Deberia premiar trazabilidad, criterio y claridad.

## 11.4 Rutas por perfil

| Perfil | Ruta sugerida | Producto de aprendizaje |
|---|---|---|
| Backend inicial | Capitulos 1, 2, 4 y 6 | README de servicio, prueba y mejora pequena |
| Backend senior | Capitulos 5, 6, 9 y 12 | Plan de modernizacion incremental |
| Arquitectura | Capitulos 2, 4, 5, 8 y 12 | Mapa de dominios y decisiones ADR |
| Seguridad | Capitulos 3, 7 y 10 | Threat model y backlog DevSecOps |
| DevOps/SRE | Capitulos 8 y 9 | Ficha de despliegue, SLOs y runbook |
| QA | Capitulos 4, 6, 9 y 10 | Estrategia de pruebas y datos sinteticos |
| Docencia | Capitulos 1, 10 y 11 | Plan de curso y rubricas |
| Gestion tecnica | Capitulos 1, 5, 8 y 12 | Roadmap priorizado y mapa de riesgos |

Estas rutas no son compartimentos cerrados. Funcionan como puertas de entrada.

## 11.5 Formato por fasciculos

La estrategia por fasciculos permite publicar, ensenar y reutilizar el material por modulos. Cada fasciculo debe tener:

- Objetivos.
- Lectura base.
- Laboratorio.
- Checklist de entrega.
- Rubrica.
- Preguntas de discusion.
- Evidencia esperada.

| Fasciculo | Laboratorio central | Perfil |
|---|---|---|
| 0 - Presentacion | Analizar valor educativo del caso | Lideres y docentes |
| 1 - Inventario | Documentar un microservicio | Backend |
| 2 - Arquitectura | Crear mapa de relaciones | Arquitectura |
| 3 - Seguridad | Sanear configuracion sensible | Seguridad |
| 4 - Modernizacion | Proponer upgrade incremental | Backend senior |
| 5 - QA | Crear estrategia de pruebas | QA |
| 6 - Nube | Disenar despliegue lab | DevOps |
| 7 - Performance | Definir SLO y prueba de carga | SRE/performance |
| 8 - Diseno curricular | Crear programa de curso | Docencia |

## 11.6 Rutas por duracion

| Formato | Fasciculos recomendados | Resultado |
|---|---|---|
| Taller 1 dia | 0, 1 y 3 | Entender el caso, inventariar y sanear |
| Curso 12 h | 0, 1, 2 y 3 | Base de arquitectura y seguridad |
| Curso 24 h | 0 a 6 | Caso completo con modernizacion y nube |
| Curso 40 h | 0 a 8 | Curso integral con proyecto final |
| Programa 80 h | 0 a 8 + proyecto extendido | Modernizacion guiada por equipos |

El error habitual es comprimir un programa de 40 horas en un taller de un dia. Spotybank permite modularizar: primero metodo y seguridad, despues arquitectura, luego modernizacion, nube, QA y performance.

## 11.7 Laboratorios por dificultad

La obra puede organizar practicas en tres niveles.

| Nivel | Enfoque | Ejemplo |
|---|---|---|
| Inicial | Leer, describir y clasificar | Crear README de un servicio |
| Intermedio | Proponer mejora con evidencia | Definir contrato de despliegue |
| Avanzado | Implementar, medir y defender | Crear prueba de carga y plan de mitigacion |

Esta progresion evita que un estudiante nuevo quede bloqueado por complejidad excesiva, y permite que perfiles avanzados encuentren retos reales.

## 11.8 Laboratorio 1: inventario de microservicio

Objetivo: aprender a leer un servicio sin asumir de mas.

Entrega:

- Nombre del servicio.
- Proposito inferido.
- Dependencias.
- Endpoints.
- Configuracion.
- Riesgos visibles.
- Preguntas para owner.
- Mejoras propuestas.

Criterio de evaluacion:

- Distingue evidencia de inferencia.
- No copia secretos.
- No inventa funcionalidad.
- Propone preguntas utiles.

## 11.9 Laboratorio 2: frontera de dominio

Objetivo: reconocer responsabilidades y limites.

Entrega:

- Mapa de dominio.
- Servicios involucrados.
- Contratos conocidos.
- Dependencias externas.
- Riesgos de acoplamiento.
- Propuesta de frontera canonica.

Discusion:

- Que pertenece a `spotybank-auth`?
- Que pertenece a `spotybank-accounts`?
- Que deberia pertenecer a `spotybank-core-ledger`?
- Que cosas son adapters?

## 11.10 Laboratorio 3: saneamiento y publicacion segura

Objetivo: preparar material tecnico para uso educativo.

Entrega:

- Lista de elementos sensibles.
- Sustituciones realizadas.
- Evidencia de escaneo.
- README de reglas de publicacion.
- Checklist de aprobacion.

Regla central: ningun material se publica si contiene identidad real, secretos o dominios privados.

## 11.11 Laboratorio 4: despliegue educativo

Objetivo: disenar un despliegue reproducible.

Entrega:

- Ficha de servicio.
- ConfigMap propuesto.
- Secrets ficticios.
- Probes.
- Requests/limits.
- Estrategia de rollout.
- Smoke test.

La evaluacion no exige una nube productiva. Exige claridad operativa.

## 11.12 Laboratorio 5: performance y resiliencia

Objetivo: medir y razonar.

Entrega:

- Hipotesis de carga.
- SLI.
- SLO educativo.
- Datos sinteticos.
- Resultado de prueba o plan de ejecucion.
- Riesgos encontrados.
- Dos mejoras priorizadas.

La clave es que el estudiante aprenda a defender una mejora con datos.

## 11.13 Revision por pares

Spotybank funciona especialmente bien con revision cruzada. Un equipo backend revisa si la propuesta de arquitectura es implementable. Un perfil de seguridad revisa si el laboratorio publica datos sensibles. Un perfil DevOps revisa si el despliegue es operable. QA revisa si el plan se puede comprobar.

Preguntas de revision:

- Que afirmacion necesita evidencia?
- Que riesgo no esta cubierto?
- Que decision depende de owner externo?
- Que prueba falta?
- Que parte del entregable podria usar otro equipo?

La revision por pares ensena comunicacion tecnica. No se trata de ganar la discusion; se trata de mejorar la decision.

## 11.14 Rubrica general

| Criterio | Excelente | A mejorar |
|---|---|---|
| Evidencia | Cada afirmacion apunta a fuente o prueba | Mezcla suposiciones con hechos |
| Seguridad | No expone material sensible | Copia valores o nombres no publicables |
| Claridad | Otro equipo puede continuar el trabajo | El resultado depende de explicacion oral |
| Priorizacion | Ordena por riesgo e impacto | Lista mejoras sin criterio |
| Validacion | Define como comprobar cierre | Propone cambios sin criterio de exito |
| Comunicacion | Adapta mensaje al perfil lector | Usa jerga sin contexto |

La rubrica debe valorar pensamiento tecnico, no solo cantidad de archivos.

## 11.15 Proyecto final por equipos

Propuesta de proyecto final:

```text
Cada equipo elige un dominio Spotybank y entrega un plan de modernizacion integral.
Debe incluir documentacion, arquitectura, seguridad, despliegue, pruebas,
performance y roadmap incremental.
```

Entregables:

- Diagnostico.
- Mapa de relaciones.
- Riesgos.
- Backlog priorizado.
- Propuesta de arquitectura.
- Estrategia de pruebas.
- Estrategia de despliegue.
- SLOs educativos.
- Plan de fases.
- Presentacion ejecutiva.

La defensa oral debe explicar tradeoffs. No alcanza con decir que algo es mejor; hay que justificar por que, cuando y con que riesgo.

## 11.16 Uso en universidad

En universidad, Spotybank puede usarse como:

- Proyecto final de ingenieria de software.
- Laboratorio de arquitectura de software.
- Caso de seguridad aplicada.
- Trabajo practico de DevOps.
- Seminario de modernizacion.
- Taller de escritura tecnica.

La ventaja es que un mismo caso soporta varias materias. La dificultad es que requiere guias claras para no abrumar.

## 11.17 Uso en empresas

En empresas, Spotybank puede usarse para:

- Onboarding de equipos.
- Entrenamiento de modernizacion.
- Taller de arquitectura.
- Practica de incident response.
- Simulacion de comite tecnico.
- Formacion DevSecOps.

El valor empresarial esta en practicar decisiones sin poner en riesgo sistemas reales.

## 11.18 Uso en institutos y centros profesionales

En instituciones de formacion profesional, conviene modularizar:

- Lecturas cortas.
- Laboratorios guiados.
- Entregas concretas.
- Evaluacion por checklist.
- Menos dependencia de ambientes complejos.
- Mas foco en habilidades aplicables.

Spotybank puede adaptarse a cursos de 12, 24, 40 u 80 horas.

## Ejercicio practico

Disenar una unidad didactica de 2 horas usando un capitulo de la obra.

### Entregables

1. Perfil del estudiante.
2. Objetivo.
3. Lectura previa.
4. Actividad central.
5. Entregable.
6. Rubrica.
7. Tiempo estimado.
8. Riesgos de ejecucion.

Luego explicar que se simplificaria para un grupo inicial y que se agregaria para un grupo avanzado.

### Criterios de exito

| Criterio | Esperado |
|---|---|
| Alcance | La unidad cabe en 2 horas |
| Evidencia | El entregable puede revisarse |
| Seguridad | No requiere datos reales ni secretos |
| Perfil | La actividad coincide con nivel y rol |
| Evaluacion | La rubrica no depende de opinion vaga |

## Resumen del capitulo

- Spotybank se convierte en curso cuando agrega objetivos, laboratorios, rubricas y evidencias.
- El caso sirve para multiples perfiles porque combina codigo, arquitectura, seguridad, nube, performance y gestion.
- La estrategia por fasciculos facilita adopcion progresiva.
- Los laboratorios deben progresar desde lectura hasta implementacion y defensa.
- La revision por pares convierte diferencias de perfil en aprendizaje.
- La evaluacion debe priorizar evidencia, seguridad, claridad y criterio.

## Preguntas de revision

1. Por que un repositorio no alcanza para ser un curso?
2. Que cambia entre ensenar Spotybank a backend y a DevOps?
3. Como evaluarias que un estudiante distingue evidencia de inferencia?
4. Que entregables pedirias en un proyecto final?
5. Como adaptarias Spotybank a un taller empresarial de un dia?

## Referencias del capitulo

- `Documentacion/ObraLiteraria/SPOTYBANK_GUIA_IA_MODERNIZACION/02_PLANIFICACION/PLAN_FASCICULOS_PERFILES.md`
- `Documentacion/ObraLiteraria/SPOTYBANK_GUIA_IA_MODERNIZACION/02_PLANIFICACION/INDICE_PROVISIONAL.md`
- `SPOTYBANK_GUIA_IA_MODERNIZACION/02_PLANIFICACION/FASCICULOS_EJECUTABLES_POR_PERFIL.md`
- `SPOTYBANK_GUIA_IA_MODERNIZACION/02_PLANIFICACION/PLANES_CLASE.md`
- `SPOTYBANK_GUIA_IA_MODERNIZACION/05_APENDICES/APE_F_Ejercicios_Laboratorios/RUBRICAS_EVALUACION.md`
- `Documentacion/arquitectura/backlog-tecnico.md`
- `Documentacion/onboarding/guia-primeros-7-dias.md`
- `Documentacion/gobernanza/definicion-done-documentacion.md`
