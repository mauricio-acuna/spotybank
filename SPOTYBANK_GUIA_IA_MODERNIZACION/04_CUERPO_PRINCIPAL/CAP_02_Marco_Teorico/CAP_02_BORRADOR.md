# Capitulo 02 - Inventario Tecnico Inicial

Modernizar sin inventariar es caminar sobre un puente de noche: tal vez se llegue al otro lado, pero cada paso depende mas de la suerte que de la ingenieria. En un ecosistema de microservicios, el inventario no es una planilla burocratica. Es el primer mecanismo de control tecnico. Permite saber que existe, que se puede tocar, que no se entiende todavia y que no debe publicarse sin saneamiento.

Spotybank empieza aqui porque toda decision posterior depende de esta lectura inicial. Antes de hablar de nube, seguridad, performance o IA, hay que responder una pregunta menos vistosa y mas decisiva: cual es el mapa real del sistema?

La respuesta nunca aparece completa en un solo archivo. Se reconstruye a partir de senales: POMs, paquetes Java, controladores, rutas Camel, properties, manifiestos, Dockerfiles, pruebas, nombres de colas, dependencias, anotaciones, plantillas de despliegue y documentacion historica. El inventario es el arte de convertir esas senales en un modelo suficientemente confiable para decidir el siguiente paso.

## Objetivos del capitulo

Al finalizar este capitulo, el lector podra:

- Construir un inventario inicial de microservicios a partir de evidencia estatica.
- Separar servicios desplegables, librerias compartidas, adapters, mocks y artefactos de soporte.
- Reconocer tecnologias legacy y riesgos de modernizacion.
- Distinguir dependencia de compilacion, dependencia runtime y dependencia funcional.
- Usar IA para acelerar lectura y clasificacion sin perder control sobre la evidencia.
- Entender por que el inventario es una herramienta de gobierno tecnico, no un tramite documental.

## 02.1 Por que empezar por inventario

Los sistemas se degradan de muchas formas. Algunas son visibles: una version antigua de Java, una dependencia sin mantenimiento, un pipeline manual. Otras son mas silenciosas: un servicio que nadie sabe si sigue activo, una libreria comun que todos usan pero nadie gobierna, una cola configurada en tres lugares con nombres ligeramente distintos, una ruta de integracion que parece critica pero no tiene owner claro.

El inventario captura ese estado antes de intervenirlo.

En un proyecto pequeno, listar componentes puede parecer excesivo. En un ecosistema bancario de microservicios, no hacerlo es peligroso. Un cambio aparentemente local puede afectar autenticacion, segundo factor, notificaciones, integraciones externas, persistencia o despliegue. La arquitectura real no vive solo en diagramas; vive en las dependencias que el build resuelve, en los endpoints que los consumidores llaman, en los mensajes que los workers procesan y en los secretos que el runtime espera.

Un buen inventario inicial responde cinco preguntas:

1. Que componentes existen?
2. Que tipo de componente es cada uno?
3. Que tecnologias y dependencias aparecen?
4. Que riesgos se observan sin ejecutar el sistema?
5. Que decisiones requieren validacion externa?

La quinta pregunta es tan importante como las cuatro primeras. Un inventario honesto no finge saberlo todo. Marca la frontera entre lo observado y lo pendiente.

## 02.2 Evidencia disponible en Spotybank

La evidencia usada para este capitulo proviene de inspeccion estatica del workspace local. Eso significa que se analizaron archivos, nombres de artefactos, configuraciones, manifiestos, dependencias y patrones de codigo. No se usaron ambientes productivos, trazas reales, credenciales ni datos de clientes.

La fotografia inicial muestra un ecosistema amplio:

| Categoria inspeccionada | Conteo observado | Lectura tecnica |
|---|---:|---|
| `pom.xml` | 63 | Ecosistema Maven con padres compartidos, servicios, commons y adapters. |
| Archivos Java | 2604 | Base backend grande, con controladores, workers, rutas, modelos, adapters y pruebas. |
| `application*.properties` | 132 | Configuracion dispersa y valiosa para relevar dependencias y riesgos. |
| Dockerfile | 47 | Empaquetado containerizado en varios modulos. |
| Docker Compose | 47 | Soporte local o de integracion util para laboratorios. |
| YAML/OpenShift/Kubernetes | 336 | Despliegue declarativo con objetos de plataforma y configuracion externa. |

Estos numeros no son un trofeo. Son un aviso. Un sistema con decenas de POMs, cientos de manifiestos y miles de archivos Java no se moderniza con una decision global. Se moderniza por oleadas, con priorizacion, pruebas y criterios claros.

La evidencia tambien muestra que Spotybank combina varios estilos tecnologicos:

- Servicios Spring Boot y Spring MVC.
- Rutas Apache Camel/Fuse.
- Integraciones SOAP/CXF/WSDL.
- Mensajeria con JMS, ActiveMQ e IBM MQ.
- Persistencia MongoDB, JPA, H2 de prueba y SQL Server en puntos especificos.
- Documentacion API con Swagger/Springfox.
- Pruebas con Karate, JUnit, Mockito y reportes Cucumber.
- Empaquetado Docker y despliegue historico en OpenShift.
- Observabilidad con senales asociadas a Jaeger, OpenTracing, Logback y Logstash.

Esta mezcla es precisamente lo que vuelve valioso el caso. No representa una arquitectura pura, sino una arquitectura vivida.

## 02.3 Microservicios, librerias y artefactos Maven

El primer error al inventariar microservicios es asumir que cada repositorio o modulo es un microservicio. No lo es. En ecosistemas Maven, un mismo workspace puede contener servicios desplegables, librerias compartidas, padres de build, clientes, modelos, adapters, mocks, pruebas funcionales, utilidades y proyectos de soporte.

La pregunta correcta no es "cuantos repositorios hay?", sino "que rol cumple cada artefacto?".

Una clasificacion inicial puede usar estas categorias:

| Categoria | Senales frecuentes | Riesgo si se confunde |
|---|---|---|
| Servicio desplegable | Main Spring Boot, Dockerfile, manifiesto, endpoints o workers | Tratarlo como libreria y no validar runtime |
| Worker o consumidor | `@JmsListener`, configuracion de cola, procesamiento asincronico | Ignorar idempotencia, DLQ o reintentos |
| Adapter de integracion | Camel, CXF, WSDL, clientes externos, transformaciones | Filtrar contratos externos hacia el dominio |
| Libreria comun | Artefacto reutilizado por varios modulos | Crear acoplamiento transversal no gobernado |
| Parent Maven | Gestion de versiones, plugins y dependencias | Romper builds masivos por cambios globales |
| Mock o soporte de prueba | Fixtures, stubs, pruebas API, datos sinteticos | Confundir comportamiento simulado con runtime real |
| Manifiesto de despliegue | YAML, ConfigMap, Secret, Route, DeploymentConfig | Asumir que representa produccion sin validacion |

La presencia de padres Maven como `spotybank-parent-springboot`, `spotybank-parent-fuse` y `spotybank-parent-commons` sugiere una organizacion historica por familias tecnologicas. Eso puede ser util para centralizar dependencias. Tambien puede dificultar una modernizacion si las versiones quedan amarradas a demasiados modulos a la vez.

En una obra educativa, esta tension es perfecta: permite discutir el equilibrio entre estandarizacion y autonomia. Un parent Maven da orden; un parent Maven mal gobernado puede convertir cada upgrade en una negociacion con medio sistema.

## 02.4 Stack tecnologico detectado

El stack de Spotybank revela una transicion tipica de sistemas empresariales: servicios REST modernos conviven con integraciones heredadas, mensajeria asincronica, pruebas de distinto linaje y despliegues que ya usan contenedores, pero todavia no expresan por completo una disciplina cloud native.

### Spring Boot y Spring MVC

La presencia de starters, Actuator y convenciones Spring indica una base de servicios Java orientados a APIs y workers. Esta es una buena noticia para modernizar: Spring ofrece caminos conocidos para actualizar runtime, seguridad, observabilidad y configuracion.

Pero no basta con decir "usa Spring". Hay que mirar versiones, starters, dependencias transitivas, patrones de configuracion y compatibilidad con consumidores. Una actualizacion de Spring Boot puede exigir cambios en seguridad, Actuator, serializacion, validacion y pruebas.

### Apache Camel, Fuse y rutas de integracion

Camel aparece como pieza relevante para integraciones. Eso suele indicar transformaciones, enrutamiento, llamadas externas, manejo de protocolos y logica de conectividad. En un sistema bancario, estas rutas no son decoracion: pueden estar en el camino de operaciones criticas.

La modernizacion aqui no deberia empezar eliminando Camel por reflejo. Deberia empezar separando responsabilidades: que parte de la ruta es transformacion tecnica, que parte es regla de negocio, que parte es resiliencia y que parte es contrato externo.

### SOAP, CXF y WSDL

La evidencia de CXF, SOAP y WSDL muestra integraciones con contratos formales o sistemas heredados. Esto permite introducir el patron de capa anticorrupcion. La idea no es negar la existencia de contratos antiguos, sino evitar que el modelo interno quede contaminado por ellos.

Un adapter bien disenado traduce, encapsula y mide. Un adapter mal disenado deja que cada detalle externo invada el dominio.

### Mensajeria

Los workers con `@JmsListener` revelan procesamiento asincronico. En Spotybank aparecen senales asociadas a MFA, WhatsApp, persistencia y actualizaciones. Esa zona es especialmente rica para ejercicios porque obliga a hablar de idempotencia, reintentos, DLQ, correlacion y trazabilidad.

En mensajeria, el error comun es probar solo el camino feliz. Un inventario serio pregunta tambien:

- Que pasa si el mensaje llega dos veces?
- Que pasa si falla el proveedor externo?
- Donde queda el evento si no puede procesarse?
- Que se registra en logs?
- Como se correlaciona el evento con la solicitud original?

### Pruebas y documentacion API

Karate, JUnit, Mockito, Cucumber y Swagger/Springfox indican que existe material aprovechable para preservar comportamiento y documentar APIs. Aunque parte del stack pueda estar envejecido, no debe descartarse: puede ser la red de seguridad para migrar con menos riesgo.

La estrategia correcta no es borrar pruebas antiguas, sino evaluarlas, estabilizarlas y migrarlas gradualmente cuando aporten valor.

### Despliegue y operacion

La evidencia de Docker, Compose, OpenShift y YAML muestra que Spotybank ya tiene historia de contenedores y plataforma. Sin embargo, tambien aparecen senales de operacion incompleta: pocas probes, `resources: {}` en muchos manifiestos y dependencia de objetos historicos de OpenShift.

Esta es una distincion fundamental: estar containerizado no significa estar listo para operar cloud native.

## 02.5 Configuracion, secretos y riesgos de exposicion

Los 132 archivos `application*.properties` son una fuente de informacion valiosa y delicada. En ellos suelen aparecer endpoints, nombres de colas, timeouts, perfiles, flags, configuracion de base de datos, rutas externas y referencias a credenciales. Para una obra publicable, este material debe tratarse con cuidado.

La regla de Spotybank es clara: la documentacion puede describir categorias de riesgo, pero no debe copiar secretos ni valores sensibles.

Un inventario de configuracion debe clasificar cada hallazgo:

| Tipo de configuracion | Ejemplos de senal | Tratamiento editorial |
|---|---|---|
| Parametro no sensible | Timeout, flag educativo, nombre generico de perfil | Puede documentarse si no revela entorno real |
| Dependencia externa | URL saneada, nombre generico de proveedor, cola ficticia | Documentar como categoria o placeholder |
| Secreto | Token, credencial, certificado, clave | No publicar; reemplazar por placeholder |
| Dato de ambiente | Host, namespace, ruta privada, region | Saneamiento antes de publicar |
| Politica operacional | Reintentos, pool, circuit breaker | Documentar con criterio de validacion |

La configuracion tambien permite detectar deuda operacional. Si un manifiesto no declara probes, la plataforma no sabe distinguir un proceso vivo de un servicio listo. Si `resources` queda vacio, no hay base para scheduling confiable ni HPA. Si los secretos aparecen como variables sin gobierno claro, la rotacion y la auditoria se vuelven fragiles.

El inventario no resuelve esos problemas, pero los vuelve visibles. Esa visibilidad ya es una forma de progreso.

## 02.6 Dependencias entre servicios

Una dependencia no siempre significa lo mismo. Esta distincion evita diagnosticos superficiales.

| Tipo de dependencia | Donde aparece | Que significa |
|---|---|---|
| Build | `pom.xml`, parent, dependencia Maven | Un modulo necesita otro para compilar o empaquetar |
| Runtime | Configuracion, endpoint, cola, base de datos | Un componente necesita otro para operar |
| Funcional | Flujo de negocio, contrato, evento | Una capacidad depende de otra para cumplir su proposito |
| Operacional | Pipeline, manifiesto, secreto, plataforma | El despliegue o ejecucion depende de infraestructura |
| Organizacional | Owner, equipo, aprobacion, conocimiento tacito | La decision depende de personas o gobierno |

Un inventario limitado al build puede dar una vision falsa. Dos servicios pueden no depender en Maven y aun asi estar acoplados por una cola, un contrato HTTP, una tabla compartida o una regla de negocio. A la inversa, una libreria comun puede aparecer en muchos POMs sin representar una dependencia funcional directa.

Por eso Spotybank propone mirar dependencias desde varios planos. La matriz de relaciones no debe responder solo "quien importa a quien", sino "que tipo de consecuencia tiene ese vinculo".

Esta mirada es especialmente importante para modernizar por oleadas. Si se actualiza primero una libreria comun usada por muchos servicios, el radio de impacto puede ser grande. Si se moderniza un adapter con buen contrato, el impacto puede ser menor y mas controlable. Si se toca autenticacion sin pruebas suficientes, el impacto puede alcanzar a todo el ecosistema.

## 02.7 Evidencia local contra validacion externa

La inspeccion estatica permite afirmar muchas cosas. Tambien deja zonas oscuras.

Puede afirmar, por ejemplo, que existen POMs, rutas, workers, properties, manifiestos y dependencias. Puede detectar patrones de stack. Puede mostrar que hay pruebas. Puede senalar riesgos probables en configuracion y despliegue.

No puede confirmar por si sola:

- Si un servicio esta activo en produccion.
- Si una cola recibe trafico real.
- Si un endpoint sigue siendo usado por consumidores externos.
- Si una configuracion local coincide con ambientes vigentes.
- Si una dependencia historica todavia es necesaria.
- Si un SLO educativo se parece a una expectativa real.
- Si un owner funcional aprueba una frontera de dominio.

Esta limitacion no debilita el inventario; lo hace mas preciso. Un buen inventario no dice "esto es asi" cuando solo puede decir "esto se observa". La diferencia parece pequena, pero en modernizacion evita errores costosos.

La obra usara una convencion recurrente:

| Marca | Uso |
|---|---|
| Evidencia local | Se observa directamente en fuentes o documentos del workspace. |
| Inferencia | Se deduce razonablemente, pero requiere validacion. |
| Decision pendiente | Necesita owner, ambiente, traza, metrica o criterio externo. |
| Recomendacion | Propone accion y define como validarla. |

Ese lenguaje debe acompanar todos los capitulos. Es la diferencia entre una guia tecnica y una coleccion de opiniones bien redactadas.

## 02.8 Uso de IA durante el inventario

La IA puede ser muy buena inventariando cuando se le pide una tarea concreta y se le entregan fuentes saneadas. Puede agrupar dependencias, detectar patrones, resumir configuracion, proponer categorias funcionales y generar preguntas para owners.

Pero debe trabajar con una consigna estricta:

- No inventar capacidades.
- No copiar secretos.
- No convertir nombres en certezas funcionales.
- No omitir incertidumbre.
- No recomendar reescrituras globales sin criterio.

Un prompt util para inventario podria pedir:

```text
Analiza la siguiente evidencia saneada del componente.
Clasifica el artefacto como servicio, worker, adapter, libreria, mock o soporte.
Separa evidencia, inferencia y decision pendiente.
Propone riesgos iniciales y una pregunta para el owner.
No asumas runtime productivo si no hay evidencia.
```

La IA, en este contexto, es una lupa y una mesa de orden. No es el owner del sistema.

## 02.9 Ejercicio practico

Elegir tres componentes de categorias distintas:

1. Uno asociado a autenticacion o tokens.
2. Uno asociado a MFA o segundo factor.
3. Uno asociado a notificaciones o mensajeria.

Para cada componente, completar:

| Campo | Respuesta esperada |
|---|---|
| Categoria | Servicio, worker, adapter, libreria, mock o soporte |
| Evidencia local | Archivos, POM, configuracion, ruta, anotacion o manifiesto observado |
| Responsabilidad inferida | Que parece hacer y por que |
| Dependencias visibles | Maven, runtime, mensajeria, base de datos o plataforma |
| Riesgo inicial | Seguridad, operacion, pruebas, versionado, contrato o datos |
| Decision pendiente | Que debe validar un owner o ambiente |
| Siguiente accion | Prueba, documento, refactor, escaneo o entrevista |

### Criterio de exito

El ejercicio es correcto si el lector no mezcla evidencia con interpretacion. Una responsabilidad puede estar bien inferida y aun asi seguir pendiente de confirmacion. Esa prudencia es una competencia profesional, no una debilidad.

## Resumen del capitulo

Modernizar empieza por inventariar. En Spotybank, la evidencia inicial muestra un ecosistema amplio: 63 POMs, 2604 archivos Java, 132 properties, 47 Dockerfiles, 47 Docker Compose y 336 YAML/OpenShift/Kubernetes. Esa escala exige orden antes de cualquier cambio.

El inventario permite distinguir servicios, workers, adapters, librerias, parents Maven, mocks y manifiestos. Tambien permite reconocer un stack mixto: Spring Boot, Camel/Fuse, SOAP/CXF, JMS, persistencia mixta, pruebas funcionales, Docker y OpenShift.

La clave no es listar por listar. La clave es convertir la evidencia en decisiones prudentes. Lo observado se documenta. Lo inferido se marca. Lo pendiente se valida. Lo recomendado se acompana con un criterio de exito.

## Preguntas de revision

1. Por que una lista plana de repositorios no alcanza como inventario?
2. Que diferencia hay entre dependencia de build, runtime y funcional?
3. Por que un parent Maven puede ser ayuda y riesgo al mismo tiempo?
4. Que informacion no puede confirmarse sin owners o ambientes?
5. Por que estar containerizado no equivale a estar preparado para operar cloud native?
6. Como puede ayudar la IA en inventario sin reemplazar la validacion tecnica?

## Referencias del capitulo

- `01_INVESTIGACION/notas_campo/EVIDENCIA_FUENTES_MICROSERVICIOS_2026-05-11.md`
- `02_PLANIFICACION/MAPA_EVIDENCIAS_SPOTYBANK.md`
- `02_PLANIFICACION/MAPA_MODERNIZACION_DESDE_FUENTES.md`
- `07_FIGURAS_Y_TABLAS/TABLAS_EJECUTIVAS_MODERNIZACION.md`
