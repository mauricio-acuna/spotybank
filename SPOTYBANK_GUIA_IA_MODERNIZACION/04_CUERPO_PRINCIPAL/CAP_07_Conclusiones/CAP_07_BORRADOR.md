# Capitulo 07 - Seguridad y DevSecOps

Estado de cierre tecnico-editorial: `CERRADO_TECNICO`.

Dictamen del capitulo: apto como guia de seguridad y DevSecOps para el caso Spotybank. El capitulo conecta saneamiento editorial, seguridad de aplicacion, plataforma, supply chain, mensajeria, pipeline y backlog, con criterios de severidad y evidencia de cierre.

La seguridad de Spotybank empieza antes de ejecutar un servicio. Empieza cuando se decide que un material tecnico puede convertirse en caso educativo sin exponer identidad, secretos, datos reales ni infraestructura sensible. Esa decision atraviesa todo el libro: no hay aprendizaje responsable si el material de aprendizaje publica aquello que deberia proteger.

Pero el saneamiento editorial es solo una capa. Un sistema de microservicios tambien necesita seguridad de aplicacion, seguridad de plataforma, controles de supply chain, gobierno de secretos, observabilidad segura y una forma de convertir hallazgos en trabajo real.

DevSecOps, en este contexto, no significa agregar una herramienta mas al pipeline. Significa que cada cambio pueda ser construido, probado, escaneado, desplegado y operado con controles que reduzcan riesgo sin bloquear el aprendizaje.

## Objetivos del capitulo

Al finalizar este capitulo, el lector podra:

- Identificar riesgos de seguridad habituales en microservicios heredados.
- Separar saneamiento educativo, seguridad de aplicacion y seguridad de plataforma.
- Disenar una estrategia DevSecOps para Spotybank.
- Proponer controles de secretos, dependencias, endpoints, APIs, contenedores y mensajeria.
- Convertir hallazgos de seguridad en backlog accionable con evidencia de cierre.
- Usar IA en seguridad sin exponer informacion sensible ni reemplazar revision humana.
- Definir severidad, compuertas de pipeline y criterios de cierre para tickets de seguridad.

## 07.1 Seguridad como condicion de aprendizaje

Spotybank existe como caso educativo porque fue anonimizado y saneado. Esa idea es central: no se puede ensenar con un sistema si el material expone secretos, dominios reales, nombres internos o configuraciones sensibles. La seguridad no aparece al final de la obra; aparece antes de que el caso pueda compartirse.

En un equipo profesional, seguridad tampoco deberia ser auditoria tardia. Debe estar integrada en el ciclo de vida:

- Repositorio.
- Build.
- Tests.
- Analisis de dependencias.
- Imagen de contenedor.
- Manifiestos.
- Despliegue.
- Runtime.
- Operacion.
- Publicacion de documentacion.

La pregunta no es "quien revisa seguridad al final?". La pregunta es "que controles evitan que el riesgo avance sin ser visto?".

## 07.2 Tres niveles de seguridad

Para ordenar el trabajo, Spotybank separa tres niveles:

| Nivel | Pregunta | Ejemplos |
|---|---|---|
| Saneamiento educativo | Se puede compartir este material? | Rebranding, placeholders, exclusion de zips, limpieza de scripts |
| Seguridad de aplicacion | El servicio maneja bien identidad, datos y errores? | Auth, validacion, errores, tokens, Actuator |
| Seguridad de plataforma | El runtime esta protegido? | Secrets, network policies, TLS, imagenes, RBAC |

Los tres niveles se complementan. Un repositorio limpio no garantiza un despliegue seguro. Una plataforma segura no compensa una aplicacion que expone datos. Una aplicacion bien escrita no elimina el riesgo de una imagen vulnerable o de una clave versionada.

Esta separacion ayuda a planificar. Un equipo puede trabajar primero el saneamiento para publicar el caso, despues controles de aplicacion para laboratorios y luego plataforma para despliegues cloud native.

## 07.3 Modelo de amenazas minimo

Antes de listar herramientas, conviene construir un modelo de amenazas minimo. Para Spotybank, las preguntas base son:

| Pregunta | Ejemplo |
|---|---|
| Que activo se protege? | Credenciales, tokens MFA, datos de cliente, contratos, colas |
| Quien podria abusarlo? | Usuario no autorizado, consumidor interno, atacante externo, error operativo |
| Por donde entra el riesgo? | API, broker, repositorio, imagen, dependencia, configuracion |
| Que control existe? | Autenticacion, validacion, secretos, RBAC, escaneo, auditoria |
| Que evidencia falta? | Logs, trazas, owner, pruebas, configuracion real |
| Que ticket queda? | Rotar secreto, cerrar endpoint, agregar test, documentar DLQ |

Un modelo de amenazas no necesita ser enorme para ser util. Debe obligar a pensar en activos, actores, vectores y controles.

Para que sea accionable, cada amenaza debe terminar con severidad y evidencia esperada:

| Severidad | Criterio | Ejemplo de cierre |
|---|---|---|
| Critica | Exposicion de secreto, token, dato real o acceso no autorizado directo | Secreto rotado, valor removido, escaneo limpio y control preventivo activo |
| Alta | Riesgo explotable con impacto en identidad, MFA, datos o plataforma | Control agregado, prueba o configuracion verificada |
| Media | Deuda que aumenta probabilidad o impacto ante fallo | Ticket priorizado con owner, fecha y mitigacion |
| Baja | Mejora de higiene o claridad documental | Registro, documentacion o backlog no bloqueante |

Sin severidad, el backlog de seguridad se vuelve una lista plana. Con severidad, el equipo puede bloquear lo critico y planificar lo demas.

## 07.4 Gestion de secretos

La configuracion sensible de microservicios suele concentrar referencias a credenciales, endpoints, tokens, certificados, mensajeria y bases de datos. La documentacion no debe copiar valores sensibles, pero la presencia de esos patrones basta para definir una politica.

Reglas minimas:

- Ningun secreto en `application.properties`.
- Ningun secreto en README.
- Ningun secreto en scripts de ejemplo.
- Ningun token en conversaciones o documentos.
- Secrets gestionados por Vault, Secret Manager u OpenShift/Kubernetes Secrets.
- Rotacion obligatoria de cualquier valor que haya estado versionado o compartido.
- Escaneo de secretos en pre-commit y CI.
- Bloqueo de push o merge ante hallazgos criticos.

En educacion, los placeholders son utiles porque ensenan estructura sin exponer valor real. Pero un placeholder debe ser claramente invalido. Si parece una clave real, confunde.

Un ticket de secretos queda cerrado solo si cumple:

| Control | Evidencia |
|---|---|
| Remocion | El valor sensible ya no aparece en codigo, README, scripts ni ejemplos |
| Rotacion | Si el valor existio fuera de ejemplo, se considera comprometido y se rota |
| Externalizacion | La configuracion apunta a Secrets, Vault o mecanismo equivalente |
| Prevencion | Hay escaneo en pre-commit, CI o script de publicacion |
| Documentacion | El patron queda explicado con placeholder ficticio |

## 07.5 Endpoints, Actuator y superficie expuesta

En servicios Spring Boot, Actuator puede ser muy util para health, metrics y operacion. Tambien puede revelar informacion sensible si se expone sin control.

Buenas practicas:

- Exponer health minimo para readiness/liveness.
- Restringir endpoints administrativos por red y autenticacion.
- Evitar detalles internos en respuestas publicas.
- Registrar intentos de acceso no autorizado.
- Separar endpoints publicos, internos y administrativos.
- Revisar CORS, headers y errores.
- Evitar stack traces o configuracion en respuestas.

En Spotybank, esta discusion muestra que observabilidad y seguridad no son enemigos. Deben disenar juntas una superficie operable pero controlada.

El criterio de cierre para Actuator es claro: health puede ayudar a operar; detalles internos, env, beans, mappings o configuracion no deben quedar expuestos fuera de una red y autenticacion controladas.

## 07.6 Autenticacion y autorizacion

El dominio `spotybank-auth` permite discutir autenticacion moderna. Una evolucion esperable es moverse hacia OAuth2/OIDC, manejo robusto de tokens y separacion entre identidad humana y credenciales servicio a servicio.

Preguntas que el equipo debe responder:

- Que endpoints requieren usuario autenticado?
- Que endpoints son internos?
- Hay scopes o roles?
- Como se validan tokens?
- Como se revocan sesiones?
- Como se auditan intentos fallidos?
- Como se protegen claves publicas y privadas?
- Como se limita el acceso servicio a servicio?

La seguridad no termina al emitir un token. Empieza ahi. Un token requiere expiracion, validacion, audiencia, emisor, scopes, rotacion de claves y trazabilidad.

## 07.7 Seguridad en MFA

MFA es uno de los dominios mas sensibles de Spotybank. Maneja tokens, canales, proveedores, estados de enrolamiento y validacion. Su seguridad debe cubrir tanto el flujo feliz como los bordes: reintentos, expiracion, bloqueo, fraude, replay y auditoria.

Controles esperados:

- TTL claro por token.
- Idempotencia en generacion y envio.
- Limites de intentos.
- Trazabilidad por request.
- Auditoria de validacion.
- Separacion entre decision de riesgo y canal de entrega.
- Proteccion contra replay.
- Alertas por comportamiento anomalo.

Un sistema MFA sin observabilidad suficiente es dificil de operar y auditar. Tambien es dificil de defender: no basta con decir que hay segundo factor; hay que demostrar como se controla.

La evidencia minima para cerrar un control MFA incluye:

| Control | Evidencia esperada |
|---|---|
| TTL | Prueba o configuracion que limite vida del token |
| Intentos | Limite documentado y verificable |
| Replay | Validacion de token usado, expirado o duplicado |
| Auditoria | Evento o log saneado con correlation id |
| Canal | Separacion entre decision de riesgo y entrega |
| Fallo | Comportamiento definido ante proveedor caido o timeout |

## 07.8 Datos, logs y privacidad

Los logs son necesarios para operar, pero pueden convertirse en fuga de datos. En un caso bancario, payloads, documentos, telefonos, correos, tokens, headers y respuestas externas deben tratarse con cuidado.

Reglas practicas:

- No loguear secretos, tokens ni OTP.
- Enmascarar datos personales.
- Evitar payloads completos salvo en ambientes controlados.
- Usar correlation id sin exponer identidad sensible.
- Definir retencion y acceso a logs.
- Revisar errores para no exponer detalles internos.

La observabilidad segura no consiste en ver todo. Consiste en ver lo necesario sin publicar lo que debe permanecer protegido.

## 07.9 Dependencias, SBOM y supply chain

Dependencias legacy elevan el riesgo de vulnerabilidades conocidas. Un programa DevSecOps debe incluir inventario de dependencias y SBOM.

Cada modulo deberia poder responder:

- Que librerias usa?
- Que version?
- Que vulnerabilidades conocidas tiene?
- Hay excepciones aprobadas?
- Quien es owner de la remediacion?
- Que imagen base usa?
- Esta fijada por digest?
- Hay procedencia verificable del artefacto?

La seguridad de supply chain es especialmente importante cuando un caso educativo puede ser reutilizado por muchas instituciones. Publicar material no productivo no elimina la responsabilidad de evitar dependencias peligrosas o instrucciones inseguras.

Un entregable educativo seguro debe incluir al menos una decision sobre dependencias: actualizar, aislar, aceptar temporalmente con justificacion o retirar. Ignorar una vulnerabilidad conocida no es una decision tecnica; es ausencia de gobierno.

## 07.10 Seguridad de contenedores y despliegue

Spotybank contiene Dockerfiles y manifiestos OpenShift/Kubernetes. La plataforma debe proteger tanto build como runtime.

Controles recomendados:

- Imagenes base soportadas y escaneadas.
- Tags o digests controlados.
- Usuario no root cuando sea posible.
- Filesystem read-only si aplica.
- Requests y limits definidos.
- Readiness/liveness probes.
- ConfigMaps para configuracion no sensible.
- Secrets para credenciales.
- RBAC minimo.
- Network policies por dominio.
- TLS en entradas y comunicaciones criticas.

Sin estas medidas, un servicio correcto a nivel de codigo puede fallar o exponerse a nivel de plataforma.

## 07.11 Mensajeria segura

Los flujos JMS/MQ requieren controles propios:

- Autenticacion al broker.
- Autorizacion por cola o topico.
- Cifrado en transito si aplica.
- DLQ definida.
- Redelivery controlado.
- Idempotency key.
- Replay seguro.
- Auditoria de productor y consumidor.
- Alertas por acumulacion o errores repetidos.

En Spotybank, notificaciones y MFA son buenos laboratorios para estudiar estos controles. El riesgo no es solo perder mensajes; tambien puede ser duplicar acciones sensibles o reprocesar eventos fuera de contexto.

## 07.12 DevSecOps en el pipeline

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

La clave es que el pipeline falle cuando aparece un riesgo critico. Un reporte que nadie lee no es control; es ruido.

La compuerta minima del pipeline debe bloquear:

- Secretos o tokens reales.
- Dependencias con vulnerabilidad critica sin excepcion aprobada.
- Imagen base sin soporte o sin escaneo.
- Tests de contrato rotos.
- Manifiestos con exposicion administrativa no justificada.
- Artefactos no revisados en una publicacion educativa.

Otros hallazgos pueden ir a backlog, pero deben conservar severidad, owner y criterio de cierre.

## 07.13 Publicacion segura del caso educativo

Spotybank agrega una capa particular: publicacion del material educativo. El repo editorial debe mantenerse separado del workspace tecnico completo, y cada publicacion debe pasar controles de contenido.

Controles de publicacion:

- Escaneo de patrones no publicables.
- Exclusion de logs, zips y binarios no revisados.
- Revision de referencias a entidades externas.
- Uso de placeholders ficticios.
- Separacion entre evidencia local y datos productivos.
- Commit y tag solo despues de escaneo.

Este control editorial es parte de DevSecOps porque protege el ciclo de distribucion del conocimiento.

## 07.14 Uso de IA en seguridad

La IA puede ayudar a revisar patrones, proponer checklists, convertir hallazgos en tickets y detectar inconsistencias en documentos. Pero no debe recibir secretos reales ni reemplazar una validacion tecnica.

Reglas minimas:

- No pegar tokens, passwords ni certificados en prompts.
- Usar ejemplos saneados.
- Pedir clasificacion por evidencia, inferencia y decision pendiente.
- Verificar localmente cualquier hallazgo.
- No aceptar recomendaciones genericas sin contexto.
- Convertir salidas utiles en backlog revisable.

En seguridad, una respuesta convincente no equivale a un control implementado.

Una salida de IA en seguridad solo es util si produce artefactos verificables: checklist, ticket, pregunta de owner, matriz de amenaza o prueba sugerida. Si solo produce recomendaciones genericas, no debe cerrar ningun hallazgo.

## 07.15 Backlog de seguridad para Spotybank

El backlog inicial de Spotybank prioriza:

- Rotar secretos.
- Mover configuracion sensible a Vault/Secrets.
- Restringir Actuator.
- Escanear imagenes y dependencias.
- Generar SBOM.
- Documentar colas y DLQ.
- Definir idempotencia.
- Agregar network policies.
- Publicar contratos verificables.
- Crear checklist ASVS/API Top 10 para APIs.

Este backlog no debe quedarse como documento. Debe convertirse en tickets con owner, criticidad, evidencia de cierre y fecha objetivo.

La plantilla minima de ticket de seguridad es:

| Campo | Contenido |
|---|---|
| Activo | Que se protege |
| Riesgo | Que puede ocurrir |
| Severidad | Critica, alta, media o baja |
| Evidencia | Archivo, configuracion, prueba, escaneo o traza saneada |
| Control | Medida propuesta |
| Cierre | Como se verificara que el riesgo quedo reducido |
| Owner | Perfil responsable, aunque sea educativo |

## Ejercicio practico

Elegir un servicio de MFA o autenticacion y construir una mini amenaza.

### Entregables

1. Activo protegido.
2. Actor posible.
3. Vector de ataque.
4. Control existente.
5. Control faltante.
6. Evidencia necesaria.
7. Ticket propuesto.
8. Criterio de cierre.

Luego clasificar el ticket como P0, P1, P2 o P3 segun impacto y urgencia.

### Criterios de exito

| Criterio | Esperado |
|---|---|
| Activo | Identifica que se protege |
| Amenaza | Describe actor y vector sin exagerar |
| Control | Diferencia control existente y faltante |
| Evidencia | No cierra hallazgos sin prueba |
| Backlog | Propone ticket accionable |
| Seguridad editorial | No incluye secretos ni datos reales |

El ejercicio queda cerrado si el ticket resultante puede ejecutarse sin volver a explicar oralmente el hallazgo: activo, riesgo, severidad, evidencia, control y cierre deben estar escritos.

## Resumen del capitulo

- Seguridad es condicion de publicacion y de operacion.
- Spotybank separa saneamiento educativo, seguridad de aplicacion y seguridad de plataforma.
- Secretos, Actuator, MFA, logs, dependencias, contenedores y mensajeria son frentes prioritarios.
- DevSecOps debe integrarse al pipeline con controles que bloqueen riesgos criticos.
- La publicacion segura del caso educativo tambien forma parte de la cadena de seguridad.
- Todo hallazgo debe terminar en backlog accionable, con evidencia de cierre.

## Cierre tecnico-editorial del capitulo

| Control | Dictamen |
|---|---|
| Niveles de seguridad | Cerrado: saneamiento educativo, aplicacion y plataforma quedan diferenciados |
| Modelo de amenazas | Cerrado: activo, actor, vector, control, evidencia y ticket quedan definidos |
| Severidad | Cerrado: critica, alta, media y baja tienen criterio de tratamiento |
| Secretos | Cerrado: remocion, rotacion, externalizacion, prevencion y documentacion |
| MFA y Auth | Cerrado: TTL, intentos, replay, auditoria, canal y fallo quedan como controles minimos |
| Supply chain | Cerrado: dependencias, SBOM, imagen, digest y procedencia se incorporan al gobierno |
| Pipeline DevSecOps | Cerrado: compuertas bloqueantes y backlog no bloqueante quedan diferenciados |
| IA en seguridad | Cerrado: IA ayuda a producir artefactos verificables, no cierra hallazgos por si sola |
| Backlog | Cerrado: cada ticket requiere activo, riesgo, severidad, evidencia, control, cierre y owner |

Pendientes editoriales internos del capitulo: ninguno.

## Preguntas de revision

1. Que diferencia hay entre sanear un repositorio y asegurar un runtime?
2. Por que Actuator puede ser util y riesgoso al mismo tiempo?
3. Que controles requiere un flujo MFA seguro?
4. Que evidencia pedirias para cerrar un ticket de rotacion de secretos?
5. Por que un SBOM ayuda a gobernar supply chain?
6. Que hallazgos deberian bloquear un pipeline DevSecOps?

## Referencias del capitulo

- `Documentacion/arquitectura/seguridad-y-riesgos.md`
- `Documentacion/seguridad/inventario-config-sensible.md`
- `Documentacion/arquitectura/backlog-tecnico.md`
- `Documentacion/arquitectura/despliegue-nube.md`
- `Documentacion/arquitectura/catalogo-mensajeria.md`
- `SPOTYBANK_GUIA_IA_MODERNIZACION/02_PLANIFICACION/MAPA_MODERNIZACION_DESDE_FUENTES.md`
- `SPOTYBANK_GUIA_IA_MODERNIZACION/04_CUERPO_PRINCIPAL/CAP_03_Metodologia/CAP_03_BORRADOR.md`
- `Publicar_ObraLiteraria_Spotybank.ps1`
