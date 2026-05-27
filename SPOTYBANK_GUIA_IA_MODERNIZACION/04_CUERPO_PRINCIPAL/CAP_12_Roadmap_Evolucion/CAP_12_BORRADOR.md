# Capitulo 12 - Roadmap de Evolucion

Un roadmap no es una lista de deseos. Es una narrativa tecnica: explica donde estamos, que problema resolvemos primero, que capacidad habilita la siguiente y como sabremos que avanzamos. Sin esa narrativa, la modernizacion se convierte en acumulacion de iniciativas: un poco de nube, un poco de IA, un poco de seguridad, un poco de refactor, sin una secuencia defendible.

Spotybank necesita un roadmap porque combina dos evoluciones al mismo tiempo. La primera es editorial: convertir la obra en material publicable, docente y revisable. La segunda es tecnica: convertir el caso en un laboratorio cada vez mas ejecutable, observable y seguro.

La tesis final de la obra es esta: modernizar es decidir con evidencia, avanzar por capacidades y dejar cada paso mejor documentado que el anterior.

## Objetivos del capitulo

Al finalizar este capitulo, el lector podra:

- Construir un roadmap de evolucion para Spotybank.
- Separar MVP educativo, version docente, version ejecutable y version empresarial.
- Priorizar mejoras por valor, riesgo, esfuerzo y dependencia.
- Definir la evolucion de `spotybank-core-ledger`.
- Identificar decisiones que no deben cerrarse sin validacion externa.
- Cerrar la obra con una vision incremental, verificable y publicable.

## 12.1 Roadmap como narrativa tecnica

En Spotybank, el roadmap debe respetar tres realidades:

- El material nacio desde un sistema heredado.
- El objetivo publico es educativo.
- La arquitectura deseada debe crecer por etapas.

La tentacion seria proponer una plataforma perfecta de inmediato. La obra propone algo mas profesional: avanzar por capacidades.

Un buen roadmap explica:

- Que se entrega ahora.
- Que se posterga y por que.
- Que riesgo se reduce en cada fase.
- Que evidencia permite cerrar una fase.
- Que decisiones requieren owner, ambiente o validacion externa.

## 12.2 Principios de priorizacion

La priorizacion debe considerar:

| Criterio | Pregunta |
|---|---|
| Riesgo | Que pasa si no se hace? |
| Valor educativo | Que aprende el equipo? |
| Dependencia | Que desbloquea? |
| Esfuerzo | Cuanto cuesta? |
| Evidencia | Como se valida? |
| Reutilizacion | Sirve para varios perfiles? |

Una mejora que reduce riesgo y ademas sirve para varios laboratorios tiene prioridad alta. Una mejora vistosa pero sin evidencia puede esperar.

## 12.3 Versiones de evolucion

| Version | Objetivo | Estado |
|---|---|---|
| `v0.1-publicable` | Cierre preliminar educativo en Markdown | Publicado como tag |
| `main` post-tag | Desarrollo editorial ampliado de capitulos | En evolucion hacia `v0.2` |
| `v0.2-editorial` | Revision externa, PDF/HTML, portada final y mejoras docentes | Pendiente |
| `v0.3-lab` | Laboratorios ejecutables con servicios canonicos minimos | Futuro |
| `v1.0-docente` | Curso completo validado por perfiles | Futuro |

Esta tabla evita confundir tag estable con trabajo posterior. `v0.1-publicable` es una base. `main` puede seguir creciendo sin reescribir la historia del tag.

## 12.4 Fase 0: saneamiento y base editorial

Objetivo: poder compartir Spotybank con seguridad.

Capacidades:

- Identidad educativa.
- Eliminacion de referencias reales.
- Placeholders de configuracion.
- Repo separado para la obra literaria.
- Status de avance.
- Instructivo para aportes desde otro ordenador.

Evidencia de cierre:

- Escaneo sin referencias sensibles.
- Repo publicado solo con obra literaria.
- Documentacion de contribucion.
- Tag `v0.1-publicable`.

Esta fase es la base que permite que el resto exista.

## 12.5 Fase 1: MVP educativo

Objetivo: tener un caso usable en clase o taller.

Alcance:

- Capitulos principales.
- README por servicio.
- Documentos por funcionalidad.
- Mapa de relaciones.
- Backlog tecnico.
- Primer set de ejercicios.
- Rubrica general.

Entregable:

```text
Spotybank MVP Educativo v0.1
```

Criterio de exito:

- Un docente puede asignar una actividad.
- Un estudiante puede navegar el caso.
- Un equipo puede entregar evidencia.

## 12.6 Fase 2: version docente

Objetivo: empaquetar Spotybank para instituciones educativas.

Capacidades:

- Guia del docente.
- Plan de clases.
- Laboratorios por dificultad.
- Rubricas por perfil.
- Presentaciones.
- Datos sinteticos.
- Ejercicios resueltos de referencia.
- Version PDF/HTML navegable.

Esta fase transforma la obra en un producto adoptable. Sin guia docente, el material puede ser bueno pero dificil de usar.

## 12.7 Fase 3: version tecnica ejecutable

Objetivo: permitir laboratorios con ejecucion controlada.

Capacidades:

- Servicios canonicos minimos.
- `spotybank-auth` ejecutable.
- `spotybank-accounts` ejecutable.
- `spotybank-core-ledger` como modulo educativo.
- Mocks de integraciones externas.
- Datos sinteticos.
- Docker Compose o entorno local.
- Pruebas base.

El objetivo no es reconstruir todo el sistema historico. El objetivo es crear una superficie ejecutable suficiente para aprender.

## 12.8 Fase 4: plataforma cloud native

Objetivo: entrenar despliegue, observabilidad y operacion.

Capacidades:

- Manifiestos Kubernetes/OpenShift.
- ConfigMaps y Secrets ficticios.
- Probes.
- Requests/limits.
- Ingress/routing.
- Logs estructurados.
- Trazas.
- Metricas.
- Runbooks.
- GitOps opcional.

Esta fase habilita cursos DevOps/SRE y practicas de arquitectura operacional.

## 12.9 Fase 5: seguridad y DevSecOps

Objetivo: convertir seguridad en practica continua.

Capacidades:

- Escaneo de secretos.
- Escaneo de dependencias.
- SBOM.
- Threat modeling.
- Hardening de Actuator.
- Politicas de red.
- Gestion de secretos ficticia y realista.
- Checklist de publicacion segura.

Esta fase se puede trabajar incluso antes de tener todo ejecutable, porque muchos controles nacen desde repositorio y documentacion.

## 12.10 Fase 6: performance y resiliencia

Objetivo: entrenar medicion, escalamiento y respuesta ante fallos.

Capacidades:

- SLIs y SLOs educativos.
- Pruebas de carga.
- Escenarios de degradacion.
- DLQ y reproceso.
- Timeouts, retries y circuit breakers.
- Dashboards.
- Runbooks de incidentes.

Aqui Spotybank deja de ser solo codigo y se vuelve sistema operable.

## 12.11 `spotybank-core-ledger`

El ledger es la pieza mas delicada del roadmap. En un banco, el ledger no es una tabla mas: es el registro confiable de movimientos y saldos. En Spotybank, `spotybank-core-ledger` debe construirse con intencion educativa.

Responsabilidades esperadas:

- Registrar movimientos.
- Mantener atomicidad logica.
- Evitar duplicidad.
- Exponer trazabilidad.
- Definir idempotencia.
- Separar comandos de consultas si aplica.
- Publicar eventos educativos.

Decisiones pendientes:

- Implementarlo como servicio nuevo.
- Simularlo con un modulo minimo.
- Usarlo solo como ejercicio de arquitectura.
- Conectarlo a `spotybank-accounts`.
- Definir modelo de datos.

Recomendacion: empezar con un ledger educativo pequeno, bien probado y con datos sinteticos. Mejor poco y correcto que grande y confuso.

## 12.12 Eventos y arquitectura evolutiva

Una evolucion natural de Spotybank es incorporar eventos:

- Cuenta creada.
- Movimiento registrado.
- Token MFA emitido.
- Notificacion solicitada.
- Transaccion compensada.

Los eventos permiten ensenar desacoplamiento, observabilidad y consistencia eventual. Pero tambien introducen complejidad: versionado de schema, orden, duplicados, reproceso y trazabilidad.

Por eso los eventos deben entrar despues de que los dominios y contratos esten claros.

## 12.13 Roadmap de 90 dias

| Periodo | Foco | Entregable |
|---|---|---|
| Dias 1-30 | Cierre editorial post-tag | Capitulos desarrollados, status actualizado, pendientes claros |
| Dias 31-60 | Producto docente | PDF/HTML piloto, guia docente, ejercicios resueltos iniciales |
| Dias 61-90 | Laboratorio ejecutable | Servicio piloto, datos sinteticos, pruebas y ficha de despliegue |

Este roadmap es intencionalmente acotado. No intenta crear una plataforma bancaria. Intenta convertir la obra en un material mas usable, revisable y demostrable.

## 12.14 Version empresarial

Una version empresarial de Spotybank podria incluir:

- Talleres por rol.
- Simulaciones de incidentes.
- Evaluacion de madurez.
- Backlog de modernizacion comparable con sistemas reales.
- Practicas de arquitectura.
- Plantillas de decision.
- Material para lideres tecnicos.

El valor empresarial no esta en copiar Spotybank, sino en usarlo como espejo seguro para discutir problemas reales.

## 12.15 Version academica

Una version academica podria incluir:

- Libro completo.
- Fasciculos.
- Guia docente.
- Ejercicios.
- Rubricas.
- Casos de examen.
- Proyecto final.
- Repositorio de practicas.

El objetivo academico es formar criterio. El estudiante debe salir sabiendo leer sistemas, formular preguntas, priorizar riesgos y comunicar decisiones.

## 12.16 Metricas de avance

El roadmap necesita indicadores.

| Area | Indicador |
|---|---|
| Obra | Capitulos redactados y revisados |
| Laboratorios | Ejercicios ejecutables |
| Seguridad | Escaneo limpio y checklist |
| Docencia | Rubricas y planes de clase |
| Plataforma | Servicios desplegables |
| Calidad | Tests y validaciones |
| Publicacion | Versiones etiquetadas |

Medir evita que el proyecto se vuelva una coleccion de buenas intenciones.

## 12.17 Riesgos del roadmap

Riesgos principales:

- Querer abarcar demasiado.
- Confundir obra educativa con sistema productivo.
- Publicar material sin revision.
- No crear ejercicios resueltos.
- No validar con lectores reales.
- Depender de una sola persona.
- No separar repositorios y responsabilidades.
- Mover `spotybank-core-ledger` demasiado pronto.

Mitigacion:

- Publicar por fasciculos.
- Revisar por perfiles.
- Mantener status vivo.
- Versionar cambios.
- Crear entregables pequenos.
- Priorizar ejercicios reutilizables.
- Mantener decisiones pendientes visibles.

## 12.18 Criterios de salida para `v0.2`

Una `v0.2` razonable deberia tener:

- Capitulos 1 a 12 desarrollados editorialmente.
- Revision externa minima por al menos dos perfiles.
- PDF/HTML piloto o decision explicita de mantener solo Markdown.
- Portada grafica final o decision de diferir arte final.
- Ejercicios resueltos de referencia.
- Checklist de publicacion actualizado.
- Release formal si se distribuyen artefactos.

No todo tiene que entrar. Lo importante es que lo incluido tenga evidencia de cierre.

## 12.19 Cierre de la obra

Spotybank demuestra que un sistema heredado puede convertirse en material de aprendizaje si se lo trata con cuidado. La modernizacion no empieza con una herramienta nueva, sino con una mirada ordenada:

- Que tenemos?
- Que riesgos hay?
- Que podemos compartir?
- Que debe validarse?
- Que aprendemos de esto?
- Que paso damos despues?

La IA acelera la lectura y la produccion de material, pero la obra mantiene una tesis clara: modernizar es decidir con evidencia.

## Ejercicio practico

Construir un roadmap de 90 dias para Spotybank.

### Entregables

1. Objetivo principal.
2. Tres fases.
3. Entregables por fase.
4. Riesgos.
5. Dependencias.
6. Evidencia de cierre.
7. Perfil responsable.
8. Que queda fuera del alcance.

Luego defender por que ese orden es mejor que intentar una modernizacion completa de una sola vez.

### Criterios de exito

| Criterio | Esperado |
|---|---|
| Secuencia | Cada fase habilita la siguiente |
| Realismo | El alcance cabe en 90 dias |
| Evidencia | Cada cierre tiene prueba o documento |
| Prudencia | No confunde educativo con productivo |
| Riesgo | Identifica dependencias y decisiones pendientes |

## Resumen del capitulo

- El roadmap organiza la evolucion por capacidades.
- Spotybank debe avanzar desde MVP educativo hacia version docente, tecnica ejecutable, cloud native, seguridad y performance.
- `spotybank-core-ledger` es una pieza clave y debe construirse con cuidado.
- Eventos, observabilidad y resiliencia son evoluciones naturales, no primeros pasos obligatorios.
- `v0.1-publicable` es una base estable; `main` puede seguir evolucionando hacia `v0.2`.
- La obra debe cerrarse con ejercicios, revision, empaquetado y criterios claros de salida.

## Preguntas de revision

1. Por que un roadmap no debe ser solo una lista de mejoras?
2. Que diferencia hay entre MVP educativo y version tecnica ejecutable?
3. Por que `spotybank-core-ledger` requiere especial cuidado?
4. Que riesgos aparecen si se agregan eventos demasiado pronto?
5. Que indicadores usarias para saber si la obra esta lista para `v0.2`?

## Referencias del capitulo

- `Documentacion/arquitectura/roadmap-mejoras.md`
- `Documentacion/arquitectura/backlog-tecnico.md`
- `Documentacion/spotybank/servicios-canonicos.md`
- `Documentacion/validacion/registro-bloqueos-externos.md`
- `Documentacion/ObraLiteraria/SPOTYBANK_GUIA_IA_MODERNIZACION/00_GESTION_PROYECTO/statusObraLiteraria.md`
- `SPOTYBANK_GUIA_IA_MODERNIZACION/10_PUBLICACION/PLAN_VERSION_PUBLICABLE.md`
- `SPOTYBANK_GUIA_IA_MODERNIZACION/10_PUBLICACION/CHECKLIST_TAG_RELEASE.md`
