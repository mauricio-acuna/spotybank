# Capitulo 07 - Seguridad y DevSecOps

## Objetivos del capitulo

Al finalizar este capitulo, el lector podra:

- Identificar riesgos de seguridad habituales en microservicios heredados.
- Diseñar una estrategia DevSecOps para Spotybank.
- Separar saneamiento educativo, seguridad de plataforma y seguridad de aplicacion.
- Proponer controles de secretos, dependencias, endpoints, APIs y despliegue.

## 07.1 Seguridad como condicion de aprendizaje

Spotybank existe como caso educativo porque fue anonimizado y saneado. Esa idea es central: no se puede enseñar con un sistema si el material expone secretos, dominios reales o configuraciones sensibles. La seguridad no aparece al final de la obra; aparece antes de que el caso pueda compartirse.

En un equipo profesional, seguridad tampoco deberia ser una auditoria tardia. Debe estar integrada en el ciclo de vida: repositorio, build, test, contenedor, despliegue, runtime y operacion.

## 07.2 Tres niveles de seguridad

Para ordenar el trabajo, Spotybank separa tres niveles:

| Nivel | Pregunta | Ejemplos |
|---|---|---|
| Saneamiento educativo | Se puede compartir este material? | Rebranding, placeholders, exclusion de zips, limpieza de scripts |
| Seguridad de aplicacion | El servicio maneja bien identidad, datos y errores? | Auth, validacion, errores, tokens, Actuator |
| Seguridad de plataforma | El runtime esta protegido? | Secrets, network policies, TLS, imagenes, RBAC |

Los tres niveles se complementan. Un repositorio limpio no garantiza un despliegue seguro, y una plataforma segura no compensa una aplicacion que expone datos o tokens.

## 07.3 Gestion de secretos

El inventario de configuracion sensible de Spotybank muestra una concentracion alta de referencias a credenciales, endpoints, tokens, certificados, mensajeria y base de datos. La documentacion no copia valores sensibles, pero el hallazgo es suficiente para definir una politica.

Reglas minimas:

- Ningun secreto en `application.properties`.
- Ningun secreto en README.
- Ningun secreto en scripts de ejemplo.
- Ningun token en conversaciones o documentos.
- Secrets gestionados por Vault, Secret Manager u OpenShift/Kubernetes Secrets.
- Rotacion obligatoria de cualquier valor que haya estado versionado o compartido.
- Escaneo de secretos en pre-commit y CI.

En educacion, los placeholders son utiles porque enseñan estructura sin exponer valor real.

## 07.4 Endpoints, Actuator y superficie expuesta

La documentacion de seguridad detecta propiedades relacionadas con Actuator y configuraciones que deben revisarse. En servicios Spring Boot, Actuator puede ser muy util para health, metrics y operacion, pero tambien puede revelar informacion sensible si se expone sin control.

Buenas practicas:

- Exponer health minimo para readiness/liveness.
- Restringir endpoints administrativos por red y autenticacion.
- Evitar detalles internos en respuestas publicas.
- Registrar intentos de acceso no autorizado.
- Separar endpoints publicos, internos y administrativos.

En Spotybank, esta discusion sirve para que el lector entienda que observabilidad y seguridad no son enemigos; deben diseñarse juntas.

## 07.5 Autenticacion y autorizacion

El dominio `spotybank-auth` permite discutir autenticacion moderna. Una evolucion esperable es moverse hacia OAuth2/OIDC, manejo robusto de tokens y separacion entre identidad humana y credenciales servicio a servicio.

Preguntas que el equipo debe responder:

- Que endpoints requieren usuario autenticado?
- Que endpoints son internos?
- Hay scopes o roles?
- Como se validan tokens?
- Como se revocan sesiones?
- Como se auditan intentos fallidos?
- Como se protegen claves publicas/privadas?

La seguridad no termina al emitir un token. Empieza ahi.

## 07.6 Seguridad en MFA

MFA es uno de los dominios mas sensibles de Spotybank. Maneja tokens, canales, proveedores, estados de enrolamiento y validacion. Su seguridad debe cubrir tanto el flujo feliz como los bordes: reintentos, expiracion, bloqueo, fraude, replay y auditoria.

Controles esperados:

- TTL claro por token.
- Idempotencia en generacion y envio.
- Limites de intentos.
- Trazabilidad por request.
- Auditoria de validacion.
- Separacion entre decision de riesgo y canal de entrega.
- Proteccion contra replay.

Un sistema MFA sin observabilidad suficiente es dificil de operar y de auditar.

## 07.7 Dependencias y SBOM

Java 8 y dependencias legacy elevan el riesgo de vulnerabilidades conocidas. Un programa DevSecOps debe incluir inventario de dependencias y SBOM.

Para Spotybank, cada modulo deberia poder responder:

- Que librerias usa?
- Que version?
- Que vulnerabilidades conocidas tiene?
- Hay excepciones aprobadas?
- Quien es owner de la remediacion?
- Que imagen base usa?
- Esta fijada por digest?

La seguridad de supply chain es especialmente importante cuando se convierte un caso en material reutilizable por muchas instituciones.

## 07.8 Seguridad de contenedores y despliegue

Spotybank contiene Dockerfiles y manifests OpenShift/Kubernetes. La plataforma debe proteger tanto build como runtime.

Controles recomendados:

- Imagenes base soportadas y escaneadas.
- Tags o digests controlados.
- Usuario no root cuando sea posible.
- Requests y limits definidos.
- Readiness/liveness probes.
- ConfigMaps para configuracion no sensible.
- Secrets para credenciales.
- RBAC minimo.
- Network policies por dominio.
- TLS en entradas y comunicaciones criticas.

Sin estas medidas, un servicio correcto a nivel de codigo puede fallar o exponerse a nivel de plataforma.

## 07.9 Mensajeria segura

Los flujos JMS/MQ requieren controles propios:

- Autenticacion al broker.
- Autorizacion por cola o topico.
- Cifrado en transito si aplica.
- DLQ definida.
- Redelivery controlado.
- Idempotency key.
- Replay seguro.
- Auditoria de productor y consumidor.

En Spotybank, notificaciones y MFA son buenos laboratorios para estudiar estos controles. El riesgo no es solo perder mensajes; tambien puede ser duplicar acciones sensibles.

## 07.10 DevSecOps en el pipeline

Una estrategia DevSecOps no depende de una herramienta unica. Es una cadena de controles.

Pipeline minimo recomendado:

1. Lint y formato.
2. Tests unitarios.
3. Escaneo de secretos.
4. Analisis de dependencias.
5. SBOM.
6. Tests de contrato.
7. Build de imagen.
8. Escaneo de imagen.
9. Firma o control de procedencia.
10. Deploy a ambiente no productivo.
11. Pruebas de smoke y seguridad.
12. Promocion controlada.

La clave es que el pipeline falle cuando aparece un riesgo critico, no que solo genere reportes que nadie lee.

## 07.11 Backlog de seguridad para Spotybank

El backlog inicial de Spotybank prioriza:

- Rotar secretos.
- Mover configuracion sensible a Vault/Secrets.
- Restringir Actuator.
- Escanear imagenes y dependencias.
- Documentar colas y DLQ.
- Definir idempotencia.
- Agregar network policies.
- Publicar contratos verificables.

Este backlog no debe quedarse como documento. Debe convertirse en tickets con owner, criticidad, evidencia de cierre y fecha objetivo.

## 07.12 Ejercicio practico

Elegir un servicio de MFA o autenticacion y construir una mini amenaza:

- Activo protegido.
- Actor posible.
- Vector de ataque.
- Control existente.
- Control faltante.
- Evidencia necesaria.
- Ticket propuesto.

Luego clasificar el ticket como P0, P1, P2 o P3 segun impacto y urgencia.

## Resumen del capitulo

- Seguridad es condicion de publicacion y de operacion.
- Spotybank separa saneamiento educativo, seguridad de aplicacion y seguridad de plataforma.
- Secretos, Actuator, MFA, dependencias, contenedores y mensajeria son frentes prioritarios.
- DevSecOps debe integrarse al pipeline con controles que bloqueen riesgos criticos.
- Todo hallazgo debe terminar en backlog accionable.

## Preguntas de revision

1. Que diferencia hay entre sanear un repositorio y asegurar un runtime?
2. Por que Actuator puede ser util y riesgoso al mismo tiempo?
3. Que controles requiere un flujo MFA seguro?
4. Que evidencia pedirias para cerrar un ticket de rotacion de secretos?

## Referencias del capitulo

- `Documentacion/arquitectura/seguridad-y-riesgos.md`
- `Documentacion/seguridad/inventario-config-sensible.md`
- `Documentacion/arquitectura/backlog-tecnico.md`
- `Documentacion/arquitectura/despliegue-nube.md`
- `Documentacion/arquitectura/catalogo-mensajeria.md`

