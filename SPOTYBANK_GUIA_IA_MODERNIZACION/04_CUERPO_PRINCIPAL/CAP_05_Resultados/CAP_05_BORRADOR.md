# Capitulo 05 - Dominios Bancarios y Fronteras de Servicio

## Objetivos del capitulo

Al finalizar este capitulo, el lector podra:

- Identificar dominios funcionales dentro de Spotybank.
- Diferenciar servicio tecnico, servicio de dominio y libreria compartida.
- Entender por que `spotybank-core-ledger` es una pieza pedagogica necesaria.
- Proponer fronteras de servicio mas claras para una modernizacion incremental.

## 05.1 Por que hablar de dominios

Un microservicio no es simplemente una aplicacion pequena con un endpoint. Un microservicio sano representa una capacidad de negocio o una responsabilidad tecnica claramente delimitada. Cuando esa frontera no esta clara, el sistema se vuelve dificil de modificar: reglas de negocio duplicadas, dependencias cruzadas, commons demasiado grandes y adapters que empiezan a decidir mas de lo que deberian.

Spotybank permite estudiar este problema porque combina servicios de autenticacion, MFA, notificaciones, integraciones, commons y bases. Ese mapa es realista: no todos los artefactos son dominios, no todas las carpetas son productos, y no todas las dependencias representan una relacion funcional sana.

## 05.2 Dominios visibles en Spotybank

Desde la documentacion generada, se observan al menos cinco grandes zonas:

- Autenticacion y tokens.
- MFA y autenticadores.
- Notificaciones.
- Integraciones y adapters externos.
- Commons, base y soporte.

Estas zonas no son necesariamente bounded contexts finales. Son una primera lectura para ordenar la conversacion. En una fase de validacion, cada zona deberia contrastarse con negocio, owners y trazas reales.

## 05.3 `spotybank-auth`

`spotybank-auth` representa el dominio educativo de autenticacion. Su responsabilidad esperada incluye login, identidad, tokens y autorizacion tecnica entre servicios. Tambien se relaciona con MFA, porque en un sistema bancario moderno la autenticacion no puede separarse por completo del riesgo y del segundo factor.

Como caso de estudio, `spotybank-auth` permite trabajar:

- Migracion hacia OAuth2/OIDC.
- Manejo seguro de tokens.
- Exposicion controlada de endpoints.
- Pruebas de seguridad.
- Observabilidad de intentos de login.
- Separacion entre autenticacion humana y autenticacion servicio a servicio.

La frontera sana para este dominio deberia evitar que reglas de clientes, cuentas o ledger queden mezcladas dentro de la autenticacion.

## 05.4 `spotybank-accounts`

`spotybank-accounts` representa informacion de cliente, relacion bancaria, cuentas y datos maestros de usuario. Este dominio es sensible porque sus datos suelen alimentar autenticacion, MFA, notificaciones y decisiones de riesgo.

Como caso educativo, permite discutir:

- Ownership de datos.
- Versionado de contratos.
- DTOs publicos contra modelos internos.
- Cache y consistencia.
- Privacidad y minimizacion de datos.
- Pruebas de compatibilidad con consumidores.

La frontera sana para `spotybank-accounts` exige que otros servicios no repliquen logica de cliente sin control. Si muchos servicios necesitan la misma validacion de cliente, puede haber una capacidad mal ubicada o una dependencia transversal excesiva.

## 05.5 MFA y autenticadores como subdominio critico

MFA aparece en Spotybank como un conjunto amplio de controladores, adapters y tokens por canal. No es simplemente una funcion secundaria. En banca digital, MFA protege operaciones, reduce fraude y afecta directamente la experiencia del usuario.

El desafio de frontera en MFA es separar:

- Decision de riesgo.
- Canal de entrega.
- Generacion de token.
- Validacion de token.
- Estado de enrolamiento.
- Auditoria.
- Integracion con proveedores externos.

Cuando estas responsabilidades se mezclan, el sistema se vuelve fragil. Por ejemplo, cambiar un proveedor de SMS no deberia obligar a reescribir reglas de riesgo.

## 05.6 Notificaciones como dominio asincrono

Notificaciones muestra otra frontera importante: no todo debe ser sincrono. En Spotybank aparecen consumidores, receivers, persistencia y APIs para SMS, mail y WhatsApp. Ese conjunto permite estudiar arquitectura orientada a eventos.

Una buena frontera de notificaciones deberia:

- Recibir solicitudes de envio con contrato estable.
- Persistir estado relevante.
- Procesar por canal.
- Manejar reintentos.
- Registrar correlacion.
- Exponer auditoria y estado.

El dominio no deberia decidir por si mismo reglas de negocio de autenticacion o riesgo. Debe entregar mensajes de manera confiable y observable.

## 05.7 Integraciones y anti-corruption layer

Los adapters de Spotybank representan una zona clasica de sistemas empresariales: conectan servicios modernos con contratos heredados, SOAP, OSB, proveedores o sistemas externos. Si no se cuidan, esos contratos externos contaminan el dominio interno.

Un anti-corruption layer protege al sistema de tres maneras:

- Traduce modelos externos a modelos internos.
- Encapsula protocolos y errores especificos.
- Permite probar el dominio sin depender siempre del proveedor.

En Spotybank, los adapters son una oportunidad didactica excelente para enseñar transformaciones, timeouts, circuit breakers, pruebas de contrato y mocks controlados.

## 05.8 Commons: ayuda y riesgo

Los commons reducen duplicacion, pero tambien pueden ocultar acoplamiento. Una libreria compartida es sana cuando contiene capacidades tecnicas estables: logging, tracing, errores comunes, clientes base, utilidades de test. Se vuelve riesgosa cuando empieza a contener reglas de negocio de dominios concretos.

Para Spotybank, una revision de commons deberia preguntar:

- Que clases son puramente tecnicas?
- Que clases contienen reglas funcionales?
- Que servicios dependen de cada commons?
- Hay versionado claro?
- Hay pruebas que protejan compatibilidad?

Modernizar commons sin entender impacto puede romper muchos servicios a la vez.

## 05.9 La pieza pendiente: `spotybank-core-ledger`

`spotybank-core-ledger` todavia no existe como modulo implementado en el workspace actual. Aun asi, es central para la obra porque representa una capacidad bancaria fundamental: el libro mayor de movimientos, atomicidad, compensaciones, idempotencia y auditoria.

Construirlo como ejercicio educativo permitiria enseñar:

- Consistencia transaccional.
- Idempotency keys.
- Outbox pattern.
- Auditoria inmutable.
- Eventos de dominio.
- Compensaciones.
- Pruebas de concurrencia.
- Observabilidad de operaciones financieras.

La ausencia del ledger no es una debilidad narrativa; es una oportunidad pedagogica. El lector puede diseñarlo a partir de las fronteras ya estudiadas.

## 05.10 Propuesta de frontera canonica

Una organizacion canonica inicial para Spotybank podria ser:

| Servicio canonico | Responsabilidad | No deberia hacer |
|---|---|---|
| `spotybank-auth` | Identidad, tokens, autenticacion y autorizacion tecnica | Gestionar cuentas o movimientos |
| `spotybank-accounts` | Cliente, cuentas y datos maestros | Decidir MFA, enviar mensajes o registrar ledger |
| `spotybank-core-ledger` | Movimientos, saldos, atomicidad y auditoria transaccional | Autenticar usuarios o enviar notificaciones |
| `spotybank-notifications` | Entrega y trazabilidad de mensajes | Decidir reglas de negocio de autenticacion |
| `spotybank-integration-adapters` | Traduccion y aislamiento de proveedores externos | Contener reglas centrales del dominio |

Esta tabla no obliga a crear todos los servicios de inmediato. Sirve como brujula para decidir donde ubicar responsabilidades durante la modernizacion.

## 05.11 Ejercicio practico

Elegir cinco componentes reales de Spotybank y clasificarlos:

- Servicio de dominio.
- Adapter.
- Worker o consumer.
- Libreria commons.
- Mock o soporte.

Luego responder:

- Que responsabilidad tiene?
- Que responsabilidad no deberia tener?
- Que dependencia parece peligrosa?
- Que contrato deberia versionarse?
- Que prueba permitiria moverlo con seguridad?

## Resumen del capitulo

- Los microservicios necesitan fronteras, no solo endpoints.
- Spotybank muestra dominios de autenticacion, cuentas, MFA, notificaciones, integraciones y soporte.
- `spotybank-auth` y `spotybank-accounts` ya funcionan como servicios canonicos iniciales.
- `spotybank-core-ledger` es una pieza pendiente y pedagogicamente valiosa.
- Los adapters deben proteger al dominio de contratos externos.
- Los commons deben ser revisados para evitar acoplamiento invisible.

## Preguntas de revision

1. Que diferencia hay entre un servicio desplegable y un servicio de dominio?
2. Por que MFA no deberia mezclarse completamente con notificaciones?
3. Que problemas aparecen cuando un commons contiene reglas de negocio?
4. Por que un ledger es un buen ejercicio de arquitectura bancaria?

## Referencias del capitulo

- `Documentacion/spotybank/servicios-canonicos.md`
- `Documentacion/arquitectura/matriz-relaciones.md`
- `Documentacion/funcionalidades/autenticacion-y-tokens.md`
- `Documentacion/funcionalidades/mfa-y-autenticadores.md`
- `Documentacion/funcionalidades/notificaciones.md`
- `Documentacion/arquitectura/roadmap-mejoras.md`

