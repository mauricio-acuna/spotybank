# Capitulo 12 - Roadmap de Evolucion

## Objetivos del capitulo

Al finalizar este capitulo, el lector podra:

- Construir un roadmap de evolucion para Spotybank.
- Separar MVP educativo, version docente y version empresarial.
- Priorizar mejoras por valor, riesgo, esfuerzo y dependencia.
- Definir la evolucion de `spotybank-core-ledger`.
- Cerrar la obra con una vision incremental y verificable.

## 12.1 Roadmap como narrativa tecnica

Un roadmap no es una lista de deseos. Es una narrativa de evolucion: explica donde estamos, que problema resolvemos primero, que capacidad habilita la siguiente y como sabremos que avanzamos.

En Spotybank, el roadmap debe respetar tres realidades:

- El material nacio desde un sistema heredado.
- El objetivo publico es educativo.
- La arquitectura deseada debe crecer por etapas.

La tentacion seria proponer una plataforma perfecta de inmediato. La obra propone algo mas profesional: avanzar por capacidades.

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

Una mejora que reduce riesgo y ademas sirve para varios laboratorios tiene prioridad alta.

## 12.3 Fase 0: saneamiento y base editorial

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

Esta fase ya esta muy avanzada. Es la base que permite que el resto exista.

## 12.4 Fase 1: MVP educativo

Objetivo: tener un caso usable en clase o taller.

Alcance:

- Capitulos principales en borrador completo.
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

## 12.5 Fase 2: version docente

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

## 12.6 Fase 3: version tecnica ejecutable

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

## 12.7 Fase 4: plataforma cloud native

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

## 12.8 Fase 5: seguridad y DevSecOps

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

## 12.9 Fase 6: performance y resiliencia

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

## 12.10 `spotybank-core-ledger`

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

## 12.11 Eventos y arquitectura evolutiva

Una evolucion natural de Spotybank es incorporar eventos:

- Cuenta creada.
- Movimiento registrado.
- Token MFA emitido.
- Notificacion solicitada.
- Transaccion compensada.

Los eventos permiten ensenar desacoplamiento, observabilidad y consistencia eventual. Pero tambien introducen complejidad: versionado de schema, orden, duplicados, reproceso y trazabilidad.

Por eso los eventos deben entrar despues de que los dominios y contratos esten claros.

## 12.12 Version empresarial

Una version empresarial de Spotybank podria incluir:

- Talleres por rol.
- Simulaciones de incidentes.
- Evaluacion de madurez.
- Backlog de modernizacion comparable con sistemas reales.
- Practicas de arquitectura.
- Plantillas de decision.
- Material para lideres tecnicos.

El valor empresarial no esta en copiar Spotybank, sino en usarlo como espejo seguro para discutir problemas reales.

## 12.13 Version academica

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

## 12.14 Metricas de avance

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

## 12.15 Riesgos del roadmap

Riesgos principales:

- Querer abarcar demasiado.
- Confundir obra educativa con sistema productivo.
- Publicar material sin revision.
- No definir licencia.
- No crear ejercicios.
- No validar con lectores reales.
- Depender de una sola persona.
- No separar repositorios y responsabilidades.

Mitigacion:

- Publicar por fasciculos.
- Revisar por perfiles.
- Mantener status vivo.
- Versionar cambios.
- Crear entregables pequenos.
- Priorizar ejercicios reutilizables.

## 12.16 Cierre de la obra

Spotybank demuestra que un sistema heredado puede convertirse en material de aprendizaje si se lo trata con cuidado. La modernizacion no empieza con una herramienta nueva, sino con una mirada ordenada:

- Que tenemos?
- Que riesgos hay?
- Que podemos compartir?
- Que debe validarse?
- Que aprendemos de esto?
- Que paso damos despues?

La IA acelera la lectura y la produccion de material, pero la obra mantiene una tesis clara: modernizar es decidir con evidencia.

## 12.17 Ejercicio practico

Construir un roadmap de 90 dias para Spotybank.

La entrega debe incluir:

- Objetivo principal.
- Tres fases.
- Entregables por fase.
- Riesgos.
- Dependencias.
- Evidencia de cierre.
- Perfil responsable.
- Que queda fuera del alcance.

Luego defender por que ese orden es mejor que intentar una modernizacion completa de una sola vez.

## Resumen del capitulo

- El roadmap organiza la evolucion por capacidades.
- Spotybank debe avanzar desde MVP educativo hacia version docente, tecnica ejecutable, cloud native, seguridad y performance.
- `spotybank-core-ledger` es una pieza clave y debe construirse con cuidado.
- Eventos, observabilidad y resiliencia son evoluciones naturales, no primeros pasos obligatorios.
- La obra debe cerrarse con ejercicios, revision, licencia y empaquetado publicable.

## Preguntas de revision

1. Por que un roadmap no debe ser solo una lista de mejoras?
2. Que diferencia hay entre MVP educativo y version tecnica ejecutable?
3. Por que `spotybank-core-ledger` requiere especial cuidado?
4. Que riesgos aparecen si se agregan eventos demasiado pronto?
5. Que indicadores usarias para saber si la obra esta lista para publicarse?

## Referencias del capitulo

- `Documentacion/arquitectura/roadmap-mejoras.md`
- `Documentacion/arquitectura/backlog-tecnico.md`
- `Documentacion/spotybank/servicios-canonicos.md`
- `Documentacion/validacion/registro-bloqueos-externos.md`
- `Documentacion/ObraLiteraria/SPOTYBANK_GUIA_IA_MODERNIZACION/00_GESTION_PROYECTO/statusObraLiteraria.md`
