# Capitulo 02 - Inventario Tecnico Inicial

## Objetivos del capitulo

Al finalizar este capitulo, el lector podra:

- Construir un inventario inicial de microservicios a partir de evidencia estatica.
- Separar servicios desplegables, librerias compartidas, adapters, mocks y artefactos de soporte.
- Reconocer tecnologias legacy y riesgos de modernizacion.
- Entender por que el inventario no es burocracia, sino el primer mecanismo de control tecnico.

## 02.1 Por que empezar por inventario

Antes de modernizar un sistema, hay que saber que existe. Esta frase parece obvia, pero en proyectos reales suele ser el primer punto debil. Los repositorios crecen, se duplican, cambian de owner, incorporan librerias internas y conservan configuraciones antiguas. El resultado es un paisaje donde el equipo puede conocer una parte del sistema, pero no necesariamente el sistema completo.

Spotybank parte de esa situacion: multiples artefactos Maven, microservicios Java, adapters, consumidores de mensajeria, commons, mocks y plantillas de despliegue. La primera tarea de la IA no es "arreglar" codigo, sino ayudar a ordenar el mapa.

Un inventario tecnico inicial responde cuatro preguntas:

- Que componentes existen.
- Que hace aproximadamente cada componente.
- De que otros componentes depende.
- Que riesgos o incertidumbres aparecen en la primera lectura.

## 02.2 Evidencia disponible en Spotybank

La documentacion local de Spotybank fue generada mediante inspeccion estatica del workspace. Eso significa que se leyeron archivos, nombres de artefactos, POMs, properties, rutas Camel, manifiestos y dependencias. No se usaron ambientes productivos, trazas reales ni credenciales.

La evidencia disponible permite afirmar con razonable confianza que el sistema incluye:

- Java 8 y Maven como base de construccion.
- Spring Boot y Spring MVC para servicios REST.
- Apache Camel/Fuse para rutas de integracion.
- MongoDB, H2 de prueba y SQL Server en puntos especificos.
- ActiveMQ/JMS e IBM MQ para mensajeria.
- SOAP/CXF/WSDL para integraciones legacy.
- Swagger/Springfox, Karate, JUnit y Mockito para documentacion y pruebas.
- Docker y OpenShift para empaquetado y despliegue.
- Jaeger/OpenTracing y Logback/Logstash para observabilidad.

Esta lista no debe leerse como certificacion definitiva. Es una fotografia estatica. En un proyecto real, el equipo debe contrastarla contra pipelines, repositorios canonicos y ambientes.

## 02.3 Categorias de componentes

Para estudiar Spotybank conviene agrupar componentes por responsabilidad. Una lista plana de servicios ayuda poco; una clasificacion funcional permite entender flujos, riesgos y decisiones.

## Autenticacion y tokens

Incluye servicios relacionados con login, tokens, autenticacion empresarial, autenticacion impersonal, autenticacion de oficiales y manejo de access token. En un sistema bancario, esta zona suele ser critica porque concentra identidad, autorizacion, sesion, riesgo y experiencia de usuario.

Riesgos tipicos:

- Manejo inconsistente de tokens.
- Dependencia fuerte de servicios externos de identidad.
- Exposicion accidental de endpoints de administracion.
- Dificultad para migrar hacia OAuth2/OIDC moderno sin romper consumidores.

## MFA y autenticadores

Incluye controladores, adapters y traductores asociados a segundo factor: SMS, mail token, soft token, scratch card, WhatsApp, estados, enroll, unlock y validacion. Es uno de los dominios mas ricos para el aprendizaje porque combina seguridad, experiencia de usuario, mensajeria, proveedores externos y manejo de errores.

Riesgos tipicos:

- Reintentos que duplican tokens o mensajes.
- Falta de idempotencia ante eventos repetidos.
- Dificultad para auditar decisiones de riesgo.
- Acoplamiento entre canal, proveedor y regla de negocio.

## Notificaciones

Incluye consumidores, receivers, persistencia y APIs asociadas a SMS, mail y WhatsApp. Esta zona muestra bien la diferencia entre procesamiento sincrono y asincrono. Tambien es una buena base para ejercicios sobre colas, DLQ, reintentos, trazabilidad y replay seguro.

Riesgos tipicos:

- Perdida o duplicacion de mensajes.
- Falta de correlacion entre request original y evento procesado.
- Dependencia de proveedores externos sin circuit breaker.
- Persistencia parcial que complica auditoria.

## Integraciones y adapters

Incluye componentes que traducen llamadas internas hacia SOAP/OSB, sistemas externos, validadores, proveedores de onboarding o servicios cross. En una modernizacion, los adapters son candidatos naturales para aplicar anti-corruption layer: una frontera que protege el dominio interno de contratos heredados.

Riesgos tipicos:

- Timeouts no definidos o demasiado altos.
- DTOs externos filtrados hacia el dominio interno.
- Reglas de negocio mezcladas con transformaciones tecnicas.
- Dificultad para probar sin ambientes externos.

## Commons, base y soporte

Incluye librerias compartidas, utilidades, integracion, token, encryption, tests, mocks y proyectos base. Son piezas utiles, pero tambien pueden convertirse en acoplamiento transversal si concentran demasiadas responsabilidades.

Riesgos tipicos:

- Cambios pequenos en commons que impactan muchos servicios.
- Versionado informal.
- Dependencias transitivas antiguas.
- Logica de negocio escondida en librerias tecnicas.

## 02.4 Lo que el inventario no puede garantizar

Un inventario local no confirma todo. Puede detectar nombres, dependencias y configuraciones, pero no siempre puede distinguir:

- Si un artefacto esta productivo o abandonado.
- Si una ruta configurada sigue siendo usada.
- Si un servicio tiene consumidores activos.
- Si un manifest local coincide con el despliegue real.
- Si una cola existe en ambiente o solo quedo en configuracion historica.

Por eso Spotybank conserva una regla metodologica: separar evidencia, inferencia y decision pendiente.

## 02.5 Inventario como herramienta de modernizacion

El inventario inicial sirve para priorizar. No todos los servicios deben modernizarse al mismo tiempo. El equipo puede ordenar el trabajo por criticidad, riesgo y dependencia.

Una estrategia razonable para Spotybank seria:

1. Proteger seguridad y secretos.
2. Confirmar servicios desplegables contra librerias.
3. Priorizar autenticacion, MFA y notificaciones.
4. Identificar integraciones externas con mayor riesgo.
5. Crear pruebas de contrato alrededor de adapters.
6. Modernizar por cortes funcionales, no por carpetas.

## 02.6 Uso de IA durante el inventario

La IA ayuda a acelerar tareas tediosas:

- Leer POMs y agrupar dependencias.
- Detectar tecnologias repetidas.
- Encontrar configuraciones sensibles.
- Generar README por componente.
- Proponer categorias funcionales.
- Crear preguntas para owners.

Pero la IA no debe cerrar decisiones sin evidencia. Si un nombre sugiere que un servicio maneja MFA, esa es una inferencia razonable; si no hay trazas ni owner, no es una certeza operacional.

## 02.7 Ejercicio practico

Elegir tres servicios de categorias distintas:

1. Uno de autenticacion.
2. Uno de MFA.
3. Uno de notificaciones.

Para cada servicio, responder:

- Que responsabilidad parece tener.
- Que dependencias Maven internas usa.
- Que infraestructura aparece asociada.
- Que riesgo seria prioritario revisar.
- Que pregunta se haria al owner.

## Resumen del capitulo

- Modernizar empieza por inventariar.
- Spotybank contiene servicios, adapters, commons, mocks y artefactos de soporte.
- La evidencia estatica permite construir una base util, pero no reemplaza la validacion externa.
- La IA acelera lectura y organizacion, siempre que se distinga evidencia de inferencia.

## Preguntas de revision

1. Por que una lista plana de repositorios no alcanza como inventario?
2. Que diferencia hay entre dependencia Maven y dependencia runtime?
3. Por que los commons pueden ser al mismo tiempo ayuda y riesgo?
4. Que informacion no puede confirmarse sin owners o ambientes?

## Referencias del capitulo

- `Documentacion/arquitectura/vision-general.md`
- `Documentacion/arquitectura/matriz-relaciones.md`
- `Documentacion/microservicios/README.md`
- `Documentacion/validacion/registro-bloqueos-externos.md`

