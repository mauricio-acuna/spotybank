# Capitulo 11 - Spotybank como Curso

## Objetivos del capitulo

Al finalizar este capitulo, el lector podra:

- Convertir Spotybank en una experiencia formativa por perfiles.
- Disenar laboratorios progresivos para desarrollo, arquitectura, seguridad, DevOps, QA y docencia.
- Construir rubricas de evaluacion basadas en evidencia.
- Proponer un proyecto final por equipos.
- Adaptar el caso a universidades, institutos, empresas y centros de formacion profesional.

## 11.1 De repositorio a producto educativo

Un repositorio no es automaticamente un curso. Para que Spotybank funcione como producto educativo necesita recorrido, objetivos, consignas, criterios de evaluacion, evidencias y materiales de apoyo.

La obra propone usar el sistema como un laboratorio transversal. Todos los perfiles trabajan sobre el mismo caso, pero no todos miran lo mismo. Un perfil backend se concentra en codigo, pruebas y refactor. Un perfil de arquitectura mira dominios, contratos y dependencias. Un perfil DevOps mira despliegue, observabilidad y continuidad. Un perfil de seguridad mira secretos, amenazas y controles.

El valor pedagogico aparece cuando esos perfiles se encuentran y deben negociar decisiones.

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

## 11.3 Rutas por perfil

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

## 11.4 Formato por fasciculos

La estrategia por fasciculos permite publicar, ensenar y vender el material en modulos. Cada fasciculo puede tener:

- Objetivos.
- Lectura base.
- Laboratorio.
- Checklist de entrega.
- Rubrica.
- Preguntas de discusion.
- Evidencia esperada.

Ejemplo:

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

## 11.5 Laboratorios por dificultad

La obra puede organizar practicas en tres niveles.

| Nivel | Enfoque | Ejemplo |
|---|---|---|
| Inicial | Leer, describir y clasificar | Crear README de un servicio |
| Intermedio | Proponer mejora con evidencia | Definir contrato de despliegue |
| Avanzado | Implementar, medir y defender | Crear prueba de carga y plan de mitigacion |

Esta progresion evita que un estudiante nuevo quede bloqueado por complejidad excesiva, y permite que perfiles avanzados encuentren retos reales.

## 11.6 Laboratorio 1: inventario de microservicio

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

## 11.7 Laboratorio 2: frontera de dominio

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

## 11.8 Laboratorio 3: saneamiento y publicacion segura

Objetivo: preparar material tecnico para uso educativo.

Entrega:

- Lista de elementos sensibles.
- Sustituciones realizadas.
- Evidencia de escaneo.
- README de reglas de publicacion.
- Checklist de aprobacion.

Regla central: ningun material se publica si contiene identidad real, secretos o dominios privados.

## 11.9 Laboratorio 4: despliegue educativo

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

## 11.10 Laboratorio 5: performance y resiliencia

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

## 11.11 Rubrica general

| Criterio | Excelente | A mejorar |
|---|---|---|
| Evidencia | Cada afirmacion apunta a fuente o prueba | Mezcla suposiciones con hechos |
| Seguridad | No expone material sensible | Copia valores o nombres no publicables |
| Claridad | Otro equipo puede continuar el trabajo | El resultado depende de explicacion oral |
| Priorizacion | Ordena por riesgo e impacto | Lista mejoras sin criterio |
| Validacion | Define como comprobar cierre | Propone cambios sin criterio de exito |
| Comunicacion | Adapta mensaje al perfil lector | Usa jerga sin contexto |

La rubrica debe valorar pensamiento tecnico, no solo cantidad de archivos.

## 11.12 Proyecto final por equipos

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

La defensa oral debe explicar tradeoffs. No alcanza con decir que algo es "mejor"; hay que justificar por que, cuando y con que riesgo.

## 11.13 Uso en universidad

En universidad, Spotybank puede usarse como:

- Proyecto final de ingenieria de software.
- Laboratorio de arquitectura de software.
- Caso de seguridad aplicada.
- Trabajo practico de DevOps.
- Seminario de modernizacion.
- Taller de escritura tecnica.

La ventaja es que un mismo caso soporta varias materias. La dificultad es que requiere guias claras para no abrumar.

## 11.14 Uso en empresas

En empresas, Spotybank puede usarse para:

- Onboarding de equipos.
- Entrenamiento de modernizacion.
- Taller de arquitectura.
- Practica de incident response.
- Simulacion de comite tecnico.
- Formacion DevSecOps.

El valor empresarial esta en practicar decisiones sin poner en riesgo sistemas reales.

## 11.15 Uso en institutos y centros profesionales

En instituciones de formacion profesional, conviene modularizar:

- Lecturas cortas.
- Laboratorios guiados.
- Entregas concretas.
- Evaluacion por checklist.
- Menos dependencia de ambientes complejos.
- Mas foco en habilidades aplicables.

Spotybank puede adaptarse a cursos de 12, 24, 40 u 80 horas.

## 11.16 Ejercicio practico

Disenar una unidad didactica de 2 horas usando un capitulo de la obra.

La entrega debe incluir:

- Perfil del estudiante.
- Objetivo.
- Lectura previa.
- Actividad central.
- Entregable.
- Rubrica.
- Tiempo estimado.
- Riesgos de ejecucion.

Luego explicar que se simplificaria para un grupo inicial y que se agregaria para un grupo avanzado.

## Resumen del capitulo

- Spotybank se convierte en curso cuando agrega objetivos, laboratorios, rubricas y evidencias.
- El caso sirve para multiples perfiles porque combina codigo, arquitectura, seguridad, nube, performance y gestion.
- La estrategia por fasciculos facilita adopcion progresiva.
- Los laboratorios deben progresar desde lectura hasta implementacion y defensa.
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
- `Documentacion/arquitectura/backlog-tecnico.md`
- `Documentacion/onboarding/guia-primeros-7-dias.md`
- `Documentacion/gobernanza/definicion-done-documentacion.md`
