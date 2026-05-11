# Capitulo 04 - Documentacion Viva de Microservicios

## Objetivos del capitulo

Al finalizar este capitulo, el lector podra:

- Explicar por que la documentacion de microservicios debe tratarse como parte del sistema.
- Usar README por servicio, matrices y catalogos como herramientas de trabajo diario.
- Diferenciar documentacion generada, documentacion validada y documentacion operacional.
- Proponer un modelo de mantenimiento para que Spotybank no vuelva a quedar sin mapa tecnico.

## 04.1 Documentar no es decorar

En muchos proyectos, la documentacion se escribe tarde, cuando el sistema ya es dificil de entender. En Spotybank se adopta la decision contraria: documentar forma parte de la modernizacion. No se trata de crear textos bonitos, sino de construir instrumentos para reducir incertidumbre.

Una documentacion viva permite responder preguntas concretas:

- Que responsabilidad tiene este servicio?
- Que tecnologias usa?
- Que endpoints o rutas expone?
- Que colas, topicos o integraciones toca?
- Que riesgos tiene?
- Que queda pendiente de validar?

La documentacion viva no pretende estar terminada para siempre. Su valor esta en poder evolucionar junto con el codigo y dejar visible lo que se sabe, lo que se infiere y lo que falta confirmar.

## 04.2 README por microservicio

El primer nivel de documentacion de Spotybank es el README por microservicio. Cada README sirve como ficha de entrada al componente. En un entorno de onboarding, esto evita que una persona nueva tenga que abrir decenas de archivos antes de entender donde esta parada.

Un README util debe incluir:

- Nombre del servicio.
- Categoria funcional.
- Tecnologia principal.
- Responsabilidad inferida.
- Dependencias internas.
- Infraestructura detectada.
- Riesgos o debilidades.
- Pendientes de validacion.

El README no reemplaza al codigo. Funciona como indice interpretativo. El lector debe poder abrirlo, entender la intencion del componente y luego decidir que archivos revisar.

## 04.3 Documentacion por funcionalidad

Los microservicios rara vez se entienden bien de forma aislada. Un flujo de autenticacion, MFA o notificaciones atraviesa varios componentes. Por eso Spotybank incluye documentacion por funcionalidad.

Este nivel responde preguntas distintas:

- Que servicios participan en una funcionalidad?
- Cual parece ser el flujo principal?
- Donde hay adapters o consumidores asincronos?
- Que dependencias externas aparecen?
- Que puntos requieren pruebas de contrato?

La documentacion por funcionalidad es especialmente valiosa para docentes y equipos de producto. Permite estudiar el sistema desde casos de uso, no desde carpetas.

## 04.4 Matriz central de relaciones

La matriz de relaciones es una de las piezas mas importantes del caso Spotybank. Consolida informacion de POMs, properties y referencias de configuracion. Su objetivo no es demostrar una verdad absoluta, sino revelar acoplamientos.

En Spotybank aparecen relaciones de varios tipos:

- Dependencias Maven internas.
- Referencias por configuracion.
- Infraestructura asociada.
- Integraciones REST, SOAP, JMS o MQ.
- Uso de commons compartidos.

Esta matriz permite detectar rapidamente servicios muy conectados, librerias criticas y zonas donde un cambio puede tener impacto amplio.

## 04.5 Catalogo de endpoints y rutas

El catalogo de endpoints y rutas se genera desde anotaciones Java, properties y clases Camel. Este documento ayuda a entender la superficie de entrada y salida del sistema sin exponer endpoints sensibles.

El valor educativo del catalogo esta en mostrar que una API no es solo una URL. Cada endpoint implica:

- Contrato de entrada.
- Contrato de salida.
- Seguridad esperada.
- Versionado.
- Observabilidad.
- Pruebas.
- Consumidores.

Para Spotybank, este catalogo tambien permite discutir una deuda frecuente: endpoints heredados, rutas con convenciones antiguas y documentacion Swagger/OpenAPI que puede no estar actualizada.

## 04.6 Catalogo de mensajeria

La mensajeria merece documentacion propia. Una cola sin ownership claro se convierte rapidamente en riesgo operacional. Spotybank detecta propiedades y clases relacionadas con ActiveMQ/JMS e IBM MQ, ademas de consumidores y rutas Camel.

Un catalogo de mensajeria debe responder:

- Que servicio produce mensajes?
- Que servicio consume?
- Que cola o topico se usa?
- Hay DLQ?
- Hay redelivery?
- El procesamiento es idempotente?
- Como se hace replay seguro?

Sin esta informacion, cualquier incidente en notificaciones o MFA puede terminar en duplicados, perdida de mensajes o reprocesos manuales peligrosos.

## 04.7 Documentacion operacional

Una obra educativa no debe quedarse solo en arquitectura. Los sistemas se operan. Por eso Spotybank incluye runbooks, matriz de despliegue y documentos de seguridad.

La documentacion operacional debe cubrir:

- Como saber si un servicio esta saludable.
- Que hacer si cae un broker.
- Que revisar si MongoDB responde lento.
- Como actuar ante errores SOAP externos.
- Que logs o trazas mirar.
- Que escalar y que no escalar.

En una version madura, cada microservicio deberia tener un enlace claro hacia su runbook o hacia el runbook de su funcionalidad.

## 04.8 Gobernanza documental

La documentacion viva necesita reglas. Si nadie la mantiene, vuelve a quedarse vieja. Spotybank propone una gobernanza simple:

- Todo cambio funcional debe actualizar README o documento transversal.
- Todo endpoint nuevo debe aparecer en catalogo.
- Toda cola nueva debe aparecer en catalogo de mensajeria.
- Toda decision arquitectonica relevante debe registrarse.
- Todo riesgo nuevo debe entrar al backlog tecnico.

La definicion de done no termina cuando compila. Termina cuando el cambio se puede entender, probar, operar y enseñar.

## 04.9 Uso de IA para documentacion viva

La IA ayuda a producir un primer mapa cuando no existe documentacion previa. Puede leer patrones, agrupar servicios, detectar tecnologias y generar borradores. Pero el mantenimiento requiere responsabilidad humana.

Un flujo sano para usar IA seria:

1. Generar borrador desde evidencia local.
2. Marcar inferencias.
3. Validar con owners o pruebas.
4. Corregir la documentacion.
5. Registrar bloqueos externos.
6. Repetir en cada iteracion.

La IA es especialmente util para acelerar el paso 1. Los pasos 2 a 6 son los que convierten el texto en conocimiento confiable.

## 04.10 Ejercicio practico

Elegir una funcionalidad de Spotybank, por ejemplo MFA o notificaciones, y construir una ficha operacional:

- Servicios participantes.
- Endpoints principales.
- Colas o topicos.
- Dependencias externas.
- Riesgos conocidos.
- Preguntas pendientes para owners.
- Pruebas minimas antes de liberar cambios.

Luego comparar la ficha con los README y catalogos generados. Si falta informacion, registrar la brecha.

## Resumen del capitulo

- La documentacion viva es parte del sistema.
- README por servicio y documentos por funcionalidad cumplen roles distintos.
- Matrices y catalogos permiten ver relaciones que el codigo aislado oculta.
- La documentacion operacional es clave para soporte, seguridad y aprendizaje.
- La IA acelera la creacion de mapas, pero no reemplaza validacion y ownership.

## Preguntas de revision

1. Que diferencia hay entre documentacion generada y documentacion validada?
2. Por que una matriz de relaciones ayuda a planificar refactors?
3. Que informacion minima debe tener un catalogo de mensajeria?
4. Como se evita que la documentacion vuelva a quedar desactualizada?

## Referencias del capitulo

- `Documentacion/microservicios/README.md`
- `Documentacion/arquitectura/matriz-relaciones.md`
- `Documentacion/arquitectura/catalogo-endpoints-rutas.md`
- `Documentacion/arquitectura/catalogo-mensajeria.md`
- `Documentacion/runbooks/incidentes-comunes.md`
- `Documentacion/gobernanza/definicion-done-documentacion.md`

