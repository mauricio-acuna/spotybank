# Capitulo 05 - Dominios Bancarios y Fronteras de Servicio

Estado de cierre tecnico-editorial: `CERRADO_TECNICO`.

Dictamen del capitulo: apto como guia de lectura de dominios y fronteras para Spotybank. El capitulo separa servicio desplegable, dominio, adapter, worker y commons; define responsabilidades canonicas; trata `spotybank-core-ledger` como pieza de diseno educativo, no como modulo productivo cerrado; y establece criterios verificables para mover fronteras.

Una arquitectura de microservicios no se entiende contando repositorios. Tampoco se entiende dibujando cajas con nombres atractivos. Se entiende preguntando que responsabilidad tiene cada pieza, que conocimiento protege, que contratos expone y que decisiones no deberia tomar.

En un sistema bancario, esas preguntas importan mucho. Autenticacion, cuentas, MFA, notificaciones, adapters, commons y ledger no son simples carpetas. Representan capacidades con riesgos, datos, contratos y ritmos de cambio distintos. Si las fronteras son confusas, el sistema empieza a duplicar reglas, mezclar responsabilidades, depender de librerias compartidas demasiado grandes y esconder logica de negocio en adapters o utilidades.

Spotybank permite estudiar ese problema con una ventaja: conserva complejidad suficiente para discutir arquitectura realista, pero mantiene el caso en una frontera educativa saneada.

## Objetivos del capitulo

Al finalizar este capitulo, el lector podra:

- Identificar dominios funcionales dentro de Spotybank.
- Diferenciar servicio desplegable, servicio de dominio, adapter, worker y libreria compartida.
- Reconocer senales de fronteras sanas y fronteras mezcladas.
- Explicar por que `spotybank-core-ledger` es una pieza pedagogica necesaria.
- Proponer fronteras canonicas para una modernizacion incremental.
- Separar evidencia local, inferencia arquitectonica y decisiones que requieren validacion externa.
- Evaluar una propuesta de frontera con criterios de cohesion, acoplamiento, datos, operacion, seguridad, pruebas y trazabilidad.

## 05.1 Por que hablar de dominios

Un microservicio no es simplemente una aplicacion pequena con un endpoint. Un microservicio sano representa una capacidad acotada: sabe hacer algo, protege un conjunto de reglas, expone contratos y cambia por razones relativamente coherentes.

Cuando esa frontera se diluye, aparecen sintomas conocidos:

- Reglas de negocio duplicadas.
- Dependencias cruzadas dificiles de justificar.
- Commons que crecen hasta contener logica funcional.
- Adapters que empiezan a decidir en lugar de traducir.
- Servicios que conocen detalles internos de otros servicios.
- Cambios pequenos que requieren revisar demasiadas piezas.

Hablar de dominios no es un lujo teorico. Es una forma de reducir riesgo. Si se sabe que responsabilidad pertenece a cada zona, modernizar deja de ser una apuesta global y pasa a ser una secuencia de cambios con criterio.

## 05.2 Evidencia, inferencia y frontera

En Spotybank, los dominios se leen desde evidencia estatica: nombres de repositorios, artefactos Maven, paquetes, controladores, properties, manifiestos, rutas, dependencias y documentacion generada. Esa evidencia permite construir una primera hipotesis de frontera.

Pero una hipotesis no es una confirmacion de negocio.

| Tipo de lectura | Ejemplo | Nivel de confianza |
|---|---|---|
| Evidencia | Existe un conjunto de componentes asociados a MFA | Alta sobre presencia tecnica |
| Inferencia | MFA funciona como subdominio critico de seguridad transaccional | Media, requiere validacion |
| Validacion externa | Confirmar ownership real, SLA, flujos productivos y criticidad | Depende de contexto externo |
| Recomendacion | Separar decision de riesgo, canal y validacion de token | Accionable como propuesta |

Esta distincion evita sobreafirmar. La arquitectura propuesta en este capitulo no pretende declarar como opera una entidad real. Propone un mapa educativo para estudiar modernizacion.

## 05.3 Zonas visibles en Spotybank

Desde la documentacion generada y el inventario inicial, se observan al menos seis zonas:

| Zona | Lectura inicial | Riesgo principal |
|---|---|---|
| Autenticacion y tokens | Login, identidad, tokens, autorizacion tecnica | Mezclar identidad con reglas de cliente o riesgo |
| Cuentas y cliente | Datos maestros, relacion bancaria, informacion de cuenta | Duplicar datos sensibles o contratos |
| MFA y autenticadores | Segundo factor, canales, enrolamiento, validacion | Acoplar reglas de riesgo con proveedores |
| Notificaciones | SMS, mail, WhatsApp, persistencia, consumers | Confundir entrega de mensajes con decision de negocio |
| Integraciones y adapters | SOAP, REST externos, proveedores, sistemas heredados | Contaminar dominio interno con contratos externos |
| Commons y soporte | Utilidades, base tecnica, test, clientes compartidos | Crear acoplamiento invisible |

Estas zonas no son bounded contexts definitivos. Son una primera organizacion para conversar, priorizar y disenar laboratorios.

Para evitar falsas certezas, una zona solo puede elevarse a frontera canonica cuando responde cuatro preguntas:

| Pregunta | Criterio |
|---|---|
| Que conocimiento protege? | Datos, reglas o decisiones propias |
| Que contratos expone? | API, evento, cola, adapter o libreria versionada |
| Que cambia junto? | Motivos de cambio coherentes y no mezclados |
| Como se valida? | Pruebas, owner educativo, trazas o evidencia documental |

Si una zona no responde esas preguntas, todavia puede servir como agrupacion de estudio, pero no como frontera cerrada.

## 05.4 Servicio desplegable no es dominio

Uno de los errores mas comunes en microservicios es asumir que cada artefacto desplegable equivale a un dominio. No siempre. Un worker puede ser parte de un dominio. Un adapter puede existir solo para aislar una integracion. Una libreria puede ser soporte tecnico. Un mock puede ser infraestructura de pruebas.

Una clasificacion util:

| Tipo | Senales | Pregunta clave |
|---|---|---|
| Servicio de dominio | Reglas propias, contratos estables, datos o decisiones relevantes | Que capacidad de negocio protege? |
| Worker o consumer | Procesamiento asincronico, colas, reintentos | Que evento procesa y con que semantica? |
| Adapter | Traduccion, protocolo externo, cliente de proveedor | Que contaminacion evita? |
| Commons | Codigo compartido, utilidades, base tecnica | Es tecnico o contiene negocio? |
| Mock o soporte | Simulacion, pruebas, ambientes locales | Que dependencia permite aislar? |

Esta distincion cambia la estrategia de modernizacion. Un servicio de dominio exige pruebas funcionales y contratos. Un adapter exige pruebas de integracion y resiliencia. Un commons exige compatibilidad hacia consumidores. Un mock exige fidelidad suficiente para laboratorio.

La decision de frontera debe registrar tambien lo que queda fuera. Decir "este servicio hace autenticacion" es incompleto si no se aclara que no decide saldos, notificaciones o reglas contables. Las fronteras se entienden tanto por inclusion como por exclusion.

## 05.5 `spotybank-auth`

`spotybank-auth` representa el dominio educativo de autenticacion. Su responsabilidad esperada incluye identidad, login, tokens, autorizacion tecnica y relacion con mecanismos de segundo factor.

Como caso de estudio, permite trabajar:

- Migracion hacia OAuth2/OIDC.
- Manejo seguro de tokens.
- Exposicion controlada de endpoints.
- Pruebas de seguridad.
- Observabilidad de intentos de login.
- Separacion entre autenticacion humana y autenticacion servicio a servicio.

La frontera sana para autenticacion deberia evitar que reglas de cuentas, ledger o notificaciones queden mezcladas dentro de este dominio. Auth responde quien es el sujeto, como se prueba identidad y que credenciales o tokens se emiten. No deberia decidir saldos, movimientos ni contenido de mensajes.

Una pregunta de diseno util: si manana cambia el proveedor de MFA o el canal de notificacion, cuanto deberia cambiar `spotybank-auth`?

## 05.6 `spotybank-accounts`

`spotybank-accounts` representa informacion de cliente, relacion bancaria, cuentas y datos maestros. Es un dominio sensible porque sus datos alimentan autenticacion, MFA, notificaciones, riesgo y operaciones.

Como caso educativo, permite discutir:

- Ownership de datos.
- Versionado de contratos.
- DTOs publicos contra modelos internos.
- Cache y consistencia.
- Privacidad y minimizacion de datos.
- Pruebas de compatibilidad con consumidores.

La frontera sana exige que otros servicios no repliquen logica de cliente sin control. Si muchos componentes necesitan la misma validacion de cliente, puede haber una capacidad mal ubicada, un contrato insuficiente o una dependencia transversal excesiva.

Tambien hay que cuidar el lenguaje. "Cuenta" puede significar cuenta bancaria, cuenta de usuario, relacion cliente-producto o identidad digital. La documentacion debe precisar el sentido en cada contexto.

## 05.7 MFA como subdominio critico

MFA aparece en Spotybank como un conjunto amplio de controladores, adapters y tokens por canal. No es una funcion secundaria. En banca digital, el segundo factor protege operaciones, reduce fraude, afecta experiencia de usuario y condiciona autorizaciones sensibles.

El desafio de frontera en MFA es separar:

- Decision de riesgo.
- Canal de entrega.
- Generacion de token.
- Validacion de token.
- Estado de enrolamiento.
- Auditoria.
- Integracion con proveedores externos.

Si estas responsabilidades se mezclan, el sistema queda fragil. Cambiar un proveedor de SMS no deberia obligar a reescribir reglas de riesgo. Ajustar una politica de validacion no deberia afectar la persistencia de mensajes. Incorporar un autenticador nuevo no deberia romper los flujos existentes.

MFA es buen ejemplo de subdominio critico porque vive entre seguridad, experiencia de usuario, operacion y canales externos. Esa posicion exige contratos claros.

## 05.8 Notificaciones como dominio asincronico

Notificaciones muestra otra frontera importante: no todo debe ser sincrono. En Spotybank aparecen consumers, receivers, persistencia y APIs para SMS, mail y WhatsApp. Ese conjunto permite estudiar arquitectura orientada a eventos.

Una buena frontera de notificaciones deberia:

- Recibir solicitudes de envio con contrato estable.
- Persistir estado relevante.
- Procesar por canal.
- Manejar reintentos.
- Registrar correlacion.
- Exponer auditoria y estado.
- Proteger contenido sensible en logs.

El dominio no deberia decidir por si mismo reglas de autenticacion, riesgo o ledger. Su responsabilidad es entregar mensajes de manera confiable, observable y trazable.

La pregunta clave no es solo "se envio el mensaje?". Tambien es: que pasa si el canal falla, si el broker reintenta, si el proveedor duplica respuesta o si el usuario recibe tarde un token?

## 05.9 Integraciones y anti-corruption layer

Los adapters representan una zona clasica de sistemas empresariales: conectan servicios modernos con contratos heredados, SOAP, OSB, proveedores o plataformas externas. Si no se cuidan, esos contratos externos contaminan el dominio interno.

Un anti-corruption layer protege de tres maneras:

- Traduce modelos externos a modelos internos.
- Encapsula protocolos, errores y formatos especificos.
- Permite probar el dominio sin depender siempre del proveedor.

En Spotybank, los adapters son una oportunidad didactica para trabajar transformaciones, timeouts, circuit breakers, pruebas de contrato y mocks controlados.

Un adapter sano no toma decisiones centrales de negocio. Traduce, protege, adapta y reporta fallos. Si empieza a contener reglas de autorizacion, calculos de saldo o politicas de riesgo, la frontera se esta desplazando sin control.

## 05.10 Commons: ayuda y riesgo

Los commons reducen duplicacion, pero tambien pueden ocultar acoplamiento. Una libreria compartida es sana cuando contiene capacidades tecnicas estables: logging, tracing, errores comunes, clientes base, utilidades de test o convenciones transversales.

Se vuelve riesgosa cuando empieza a contener reglas de negocio de dominios concretos.

Para Spotybank, una revision de commons deberia preguntar:

- Que clases son puramente tecnicas?
- Que clases contienen reglas funcionales?
- Que servicios dependen de cada commons?
- Hay versionado claro?
- Hay pruebas que protejan compatibilidad?
- Que cambio podria romper a muchos consumidores?

Modernizar commons sin entender impacto puede romper muchos servicios a la vez. Por eso los commons requieren una estrategia de compatibilidad, no solo una actualizacion de dependencias.

## 05.11 La pieza de diseno: `spotybank-core-ledger`

`spotybank-core-ledger` no se presenta como modulo productivo cerrado en el workspace actual. Aun asi, es central para la obra porque representa una capacidad bancaria fundamental: movimientos, saldos, atomicidad, compensaciones, idempotencia y auditoria.

Su estado como pieza de diseno educativo no es una debilidad narrativa. Es una oportunidad pedagogica. Permite pedir al lector que disene una pieza critica a partir de fronteras ya observadas, sin afirmar que existe una implementacion bancaria completa.

Construirlo como ejercicio educativo permitiria ensenar:

- Consistencia transaccional.
- Idempotency keys.
- Outbox pattern.
- Auditoria inmutable.
- Eventos de dominio.
- Compensaciones.
- Pruebas de concurrencia.
- Observabilidad de operaciones financieras.

El ledger tambien obliga a discutir limites. No deberia autenticar usuarios, enviar mensajes, decidir canales ni conocer detalles de proveedores externos. Debe proteger movimientos y consistencia.

La definicion minima de un ledger educativo debe incluir:

| Dimension | Criterio de diseno |
|---|---|
| Consistencia | Cada movimiento preserva reglas contables basicas |
| Idempotencia | La repeticion de una solicitud no duplica efectos |
| Auditoria | Cada cambio deja rastro verificable |
| Eventos | La comunicacion externa ocurre despues del commit mediante outbox o mecanismo equivalente |
| Observabilidad | Cada operacion tiene correlacion, estado y errores trazables |
| Aislamiento | No asume responsabilidades de autenticacion, cuentas o notificaciones |

## 05.12 Propuesta de frontera canonica

Una organizacion canonica inicial para Spotybank podria ser:

| Servicio canonico | Responsabilidad | No deberia hacer |
|---|---|---|
| `spotybank-auth` | Identidad, tokens, autenticacion y autorizacion tecnica | Gestionar cuentas o movimientos |
| `spotybank-accounts` | Cliente, cuentas y datos maestros | Decidir MFA, enviar mensajes o registrar ledger |
| `spotybank-core-ledger` | Movimientos, saldos, atomicidad y auditoria transaccional | Autenticar usuarios o enviar notificaciones |
| `spotybank-mfa` | Enrolamiento, generacion y validacion de segundo factor | Enviar mensajes sin frontera de canal o calcular saldos |
| `spotybank-notifications` | Entrega y trazabilidad de mensajes | Decidir reglas de negocio de autenticacion |
| `spotybank-integration-adapters` | Traduccion y aislamiento de proveedores externos | Contener reglas centrales del dominio |
| `spotybank-commons` | Capacidades tecnicas compartidas | Encapsular decisiones funcionales especificas |

Esta tabla no obliga a crear todos los servicios de inmediato. Sirve como propuesta de orientacion para decidir donde ubicar responsabilidades durante la modernizacion.

## 05.13 Criterios para mover fronteras

Mover una frontera de servicio es una decision costosa. Antes de hacerlo, conviene evaluar:

| Criterio | Pregunta |
|---|---|
| Cohesion | Las reglas cambian por las mismas razones? |
| Acoplamiento | Cuantos consumidores se rompen si cambia el contrato? |
| Datos | Quien es owner de la informacion? |
| Operacion | Quien observa, escala y recupera el servicio? |
| Seguridad | Que controles son propios de este dominio? |
| Pruebas | Que suite protege el comportamiento antes de moverlo? |
| Trazabilidad | Que evidencia sostiene la decision? |

La modernizacion incremental no necesita resolver todas las fronteras al inicio. Necesita identificar las mas riesgosas y crear un camino para mejorarlas sin detener el sistema.

Una frontera puede moverse solo si existe una razon clara y un criterio de seguridad. El movimiento debe quedar acompanado por prueba, contrato, rollback o decision documentada. Sin eso, mover responsabilidades suele esconder complejidad en lugar de resolverla.

## Ejercicio practico

Elegir cinco componentes reales de Spotybank y clasificarlos:

- Servicio de dominio.
- Adapter.
- Worker o consumer.
- Libreria commons.
- Mock o soporte.

### Entregables

1. Responsabilidad principal de cada componente.
2. Responsabilidad que no deberia tener.
3. Dependencia que parece peligrosa.
4. Contrato que deberia versionarse.
5. Prueba que permitiria moverlo con seguridad.
6. Evidencia local que sostiene la clasificacion.
7. Validacion externa necesaria si se llevara a un sistema real.

### Criterios de exito

| Criterio | Esperado |
|---|---|
| Clasificacion | No confunde desplegable con dominio |
| Evidencia | Cita archivos, dependencias o configuracion |
| Prudencia | Marca inferencias y validaciones externas |
| Frontera | Explica que responsabilidad queda dentro y fuera |
| Modernizacion | Propone una mejora incremental verificable |

El ejercicio queda cerrado si cada componente tiene una responsabilidad dentro, una responsabilidad fuera, una evidencia local y una prueba o contrato que permita moverlo sin depender solo de intuicion.

## Resumen del capitulo

- Los microservicios necesitan fronteras, no solo endpoints.
- Spotybank muestra dominios de autenticacion, cuentas, MFA, notificaciones, integraciones y soporte.
- Un servicio desplegable no siempre equivale a un servicio de dominio.
- `spotybank-auth` y `spotybank-accounts` funcionan como servicios canonicos iniciales para el caso educativo.
- `spotybank-core-ledger` es una pieza de diseno educativo y pedagogicamente valiosa.
- Los adapters deben proteger al dominio de contratos externos.
- Los commons deben revisarse para evitar acoplamiento invisible.
- Toda propuesta de frontera debe distinguir evidencia local, inferencia y validacion externa.

## Cierre tecnico-editorial del capitulo

| Control | Dictamen |
|---|---|
| Lectura de dominios | Cerrado: dominios se leen desde responsabilidades, datos, contratos y riesgos, no desde carpetas |
| Evidencia e inferencia | Cerrado: la propuesta canonica se presenta como mapa educativo basado en evidencia local e inferencia arquitectonica |
| Servicios canonicos | Cerrado: auth, accounts, MFA, notificaciones, adapters, commons y ledger quedan diferenciados |
| Ledger educativo | Cerrado: se define como pieza de diseno, no como modulo productivo completo |
| Adapters | Cerrado: se limitan a traduccion, aislamiento y resiliencia frente a contratos externos |
| Commons | Cerrado: se tratan como soporte tecnico bajo control de compatibilidad |
| Movimiento de fronteras | Cerrado: requiere cohesion, acoplamiento, datos, operacion, seguridad, pruebas y trazabilidad |
| Ejercicio practico | Cerrado: exige responsabilidad dentro/fuera, evidencia, contrato o prueba |

Pendientes editoriales internos del capitulo: ninguno.

## Preguntas de revision

1. Que diferencia hay entre un servicio desplegable y un servicio de dominio?
2. Por que MFA no deberia mezclarse completamente con notificaciones?
3. Que problemas aparecen cuando un commons contiene reglas de negocio?
4. Por que un ledger es un buen ejercicio de arquitectura bancaria?
5. Que evidencia pedirias antes de mover una regla de negocio entre servicios?
6. Que diferencia hay entre una agrupacion de estudio y una frontera canonica?

## Referencias del capitulo

- `Documentacion/spotybank/servicios-canonicos.md`
- `Documentacion/arquitectura/matriz-relaciones.md`
- `Documentacion/funcionalidades/autenticacion-y-tokens.md`
- `Documentacion/funcionalidades/mfa-y-autenticadores.md`
- `Documentacion/funcionalidades/notificaciones.md`
- `Documentacion/arquitectura/roadmap-mejoras.md`
- `SPOTYBANK_GUIA_IA_MODERNIZACION/02_PLANIFICACION/MAPA_MODERNIZACION_DESDE_FUENTES.md`
- `SPOTYBANK_GUIA_IA_MODERNIZACION/04_CUERPO_PRINCIPAL/CAP_02_Marco_Teorico/CAP_02_BORRADOR.md`
