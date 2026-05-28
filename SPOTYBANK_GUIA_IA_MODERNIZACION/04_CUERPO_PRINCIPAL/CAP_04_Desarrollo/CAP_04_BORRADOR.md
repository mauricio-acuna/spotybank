# Capitulo 04 - Documentacion Viva de Microservicios

Estado de cierre tecnico-editorial: `CERRADO_TECNICO`.

Dictamen del capitulo: apto como guia de documentacion viva para microservicios. El capitulo define capas documentales, README por componente, fichas por funcionalidad, catalogos, matriz de relaciones, runbooks, gobernanza y uso controlado de IA con criterios de cierre verificables.

La documentacion de un sistema no falla de golpe. Se va separando del codigo poco a poco. Primero queda un README sin actualizar. Despues aparece un endpoint que nadie registro. Mas tarde una cola cambia de nombre, un adapter deja de usarse, un servicio se despliega con una variable nueva y una decision arquitectonica queda guardada en una conversacion. Cuando alguien nuevo intenta entender el sistema, encuentra piezas sueltas y una promesa incompleta: "la documentacion esta por ahi".

En un ecosistema de microservicios, esa distancia entre codigo y documentacion no es un problema estetico. Es riesgo operativo. Afecta onboarding, soporte, seguridad, pruebas, refactors, despliegue y continuidad. Si nadie sabe que toca un servicio, que contrato expone o que dependencia consume, cada cambio se vuelve mas caro de explicar y mas dificil de defender.

Spotybank trata la documentacion como parte del sistema. No como decoracion, no como cierre administrativo, no como texto que se escribe cuando sobra tiempo. La documentacion viva es infraestructura de comprension.

## Objetivos del capitulo

Al finalizar este capitulo, el lector podra:

- Explicar por que la documentacion de microservicios debe tratarse como parte del sistema.
- Diferenciar documentacion generada, documentacion validada y documentacion operacional.
- Disenar README, catalogos y matrices que ayuden a trabajar, no solo a archivar.
- Usar documentacion por funcionalidad para leer flujos que atraviesan varios servicios.
- Definir una gobernanza minima para que la documentacion no vuelva a envejecer.
- Usar IA para acelerar mapas tecnicos sin perder trazabilidad ni validacion humana.
- Cerrar cada artefacto documental con criterios verificables de utilidad, evidencia, operabilidad y mantenimiento.

## 04.1 Documentar no es decorar

La documentacion util responde preguntas que aparecen en el trabajo diario. No busca sonar importante; busca reducir incertidumbre.

En Spotybank, una persona deberia poder abrir la documentacion y responder:

- Que responsabilidad tiene este servicio?
- Es un servicio desplegable, una libreria, un adapter, un worker o un mock?
- Que tecnologias usa?
- Que endpoints, rutas o consumidores expone?
- Que colas, topicos o integraciones toca?
- Que dependencias internas aparecen?
- Que riesgos son visibles desde evidencia local?
- Que queda pendiente de validar?

La documentacion viva no pretende estar terminada para siempre. Su valor esta en evolucionar junto con el codigo y hacer explicito el estado de conocimiento: que se sabe, que se infiere y que falta confirmar.

Por eso una buena documentacion de microservicios no es una narracion cerrada. Es un mapa de trabajo. Debe permitir navegar, priorizar, preguntar mejor y cambiar con menos miedo.

## 04.2 Tres tipos de documentacion

Conviene distinguir tres capas porque se suelen mezclar.

| Tipo | Como se obtiene | Valor | Riesgo si se confunde |
|---|---|---|---|
| Generada | Scripts, parsers, escaneos, IA, lectura estatica | Rapidez y cobertura inicial | Presentarla como validada sin revision |
| Validada | Revision humana, pruebas, owners, ejecucion controlada | Confianza para decidir | Requiere tiempo y criterio |
| Operacional | Runbooks, alertas, procedimientos, escalamiento | Respuesta ante incidentes y cambios | Quedar separada de arquitectura y codigo |

La documentacion generada es excelente para empezar. En un workspace amplio, permite producir inventarios, listados de endpoints, matrices de dependencias y borradores de README. Pero no todo lo generado es verdad completa. Puede haber rutas muertas, properties no usadas, endpoints heredados o inferencias razonables pero incompletas.

La documentacion validada agrega confianza. La operacional agrega accion. Las tres son necesarias, pero no cumplen el mismo rol.

## 04.3 README por microservicio

El README por microservicio es la puerta de entrada al componente. No debe intentar contar todo, pero si debe evitar que cada lector empiece desde cero.

Un README util incluye:

- Nombre del componente.
- Categoria funcional.
- Tipo de artefacto.
- Tecnologia principal.
- Responsabilidad observada o inferida.
- Endpoints, rutas o consumidores principales.
- Dependencias internas.
- Infraestructura detectada.
- Riesgos visibles.
- Pendientes de validacion.

La palabra "inferida" importa. En un sistema heredado, muchas responsabilidades se deducen por nombres, paquetes, dependencias o configuracion. Eso no debe ocultarse. Un README honesto puede decir: "este servicio parece participar en MFA por sus rutas y dependencias". Esa frase es mas confiable que una afirmacion absoluta sin evidencia.

Una estructura minima podria ser:

| Seccion | Pregunta que responde |
|---|---|
| Proposito | Para que existe este componente? |
| Evidencia local | Que archivos sostienen esa lectura? |
| Interfaces | Como entra o sale informacion? |
| Dependencias | De que otros componentes o plataformas depende? |
| Riesgos | Que podria romperse o faltar? |
| Pendientes | Que requiere owner, ambiente o prueba? |

El README no reemplaza al codigo. Funciona como indice interpretativo. Si esta bien escrito, orienta la lectura tecnica sin impedir que el lector verifique.

Para declarar cerrado un README de servicio, debe cumplir al menos estos controles:

| Control | Minimo aceptable |
|---|---|
| Identidad | Nombre canonico, tipo de artefacto y responsabilidad declarada |
| Evidencia | Archivos, clases, configuraciones o manifiestos citados |
| Interfaces | Endpoints, consumidores, workers o rutas principales listados |
| Dependencias | Build, runtime, plataforma e integraciones diferenciadas |
| Riesgos | Riesgos visibles y validaciones externas necesarias |
| Operacion | Senales minimas de salud, logs o runbook asociado |
| Mantenimiento | Fecha o condicion que obliga a revisar el README |

Un README sin evidencia es una opinion. Un README con evidencia, riesgos y senales de operacion empieza a ser una herramienta de trabajo.

## 04.4 Documentacion por funcionalidad

Los microservicios no se entienden solo por carpetas. Un flujo de autenticacion, MFA, notificaciones, onboarding o consulta de cliente puede atravesar varios componentes. Por eso Spotybank necesita documentacion por funcionalidad.

Este nivel responde preguntas distintas:

- Que servicios participan en una funcionalidad?
- Cual parece ser el flujo principal?
- Donde hay adapters, workers o consumidores asincronicos?
- Que dependencias externas aparecen?
- Que contrato necesita pruebas?
- Que parte del flujo es evidencia y que parte es inferencia?

La documentacion por funcionalidad es especialmente util para equipos mixtos. Un perfil backend puede entrar por codigo. Un perfil QA puede entrar por escenarios. Un perfil DevOps puede entrar por despliegue. Un perfil de seguridad puede entrar por superficies de autenticacion y datos. Todos miran el mismo flujo, pero con preguntas distintas.

En una obra educativa, este enfoque tambien ayuda a ensenar. El lector no queda atrapado en una lista de repositorios; entiende como varias piezas colaboran para producir una capacidad del sistema.

Una ficha viva por funcionalidad debe incluir:

| Seccion | Contenido esperado |
|---|---|
| Funcion | Capacidad que se quiere entender: MFA, notificaciones, onboarding, consulta de cuenta |
| Servicios | Componentes participantes y rol de cada uno |
| Flujo | Pasos principales con evidencia o inferencia marcada |
| Contratos | APIs, eventos, payloads, colas o adapters involucrados |
| Riesgos | Seguridad, datos, retries, timeouts, performance u ownership |
| Pruebas | Escenarios minimos para validar cambios |
| Operacion | Senales, metricas, logs, DLQ o runbook |
| Cambios futuros | Como se actualiza la ficha cuando cambia el flujo |

## 04.5 Matriz central de relaciones

La matriz de relaciones es una pieza clave para modernizar sin tocar a ciegas. Consolida dependencias Maven, referencias por configuracion, uso de commons, infraestructura asociada e integraciones.

Su objetivo no es demostrar una verdad absoluta. Su objetivo es revelar acoplamientos.

En Spotybank, una matriz de relaciones puede marcar:

- Dependencias Maven internas.
- Uso de librerias compartidas.
- Referencias a properties comunes.
- Integraciones REST, SOAP, JMS o MQ.
- Dependencias de base de datos.
- Manifiestos de despliegue.
- Servicios con alto grado de conexion.

La lectura mas importante no siempre esta en una fila aislada. A veces esta en el patron. Si muchos servicios dependen de una libreria comun antigua, modernizar esa libreria tiene radio de impacto amplio. Si un adapter concentra dependencias externas, puede ser una frontera de cambio mas controlable. Si un servicio aparece conectado a autenticacion, MFA y notificaciones, no conviene tratarlo como pieza menor.

Una matriz bien mantenida permite priorizar refactors, planificar pruebas y discutir riesgos con evidencia.

El criterio de calidad de una matriz de relaciones no es la cantidad de filas. Es la capacidad de responder preguntas de impacto:

- Que componentes se ven afectados si cambia una libreria comun?
- Que flujos dependen de una cola o adapter?
- Que servicios comparten configuracion sensible?
- Que dependencia es solo de build y cual afecta runtime?
- Donde conviene poner una prueba contractual antes de refactorizar?

## 04.6 Catalogo de endpoints y rutas

El catalogo de endpoints y rutas ayuda a entender la superficie de entrada y salida. Puede construirse desde anotaciones Java, configuraciones, clases Camel, Swagger/OpenAPI o lectura estatica de controladores.

El valor educativo del catalogo esta en mostrar que una API no es solo una URL. Cada endpoint implica:

- Contrato de entrada.
- Contrato de salida.
- Seguridad esperada.
- Versionado.
- Observabilidad.
- Consumidores.
- Pruebas de regresion.

En sistemas heredados, el catalogo tambien revela deuda. Puede mostrar endpoints con convenciones antiguas, rutas sin owner claro, documentacion Swagger incompleta, versionado inconsistente o contratos que no tienen pruebas asociadas.

La regla de prudencia es la misma que en capitulos anteriores: una ruta detectada en codigo es evidencia de superficie tecnica, no confirmacion automatica de uso productivo. Para saber si esta vigente hacen falta logs, trazas, consumidores, owner o pruebas en ambiente controlado.

## 04.7 Catalogo de mensajeria

La mensajeria merece documentacion propia porque sus fallas suelen ser menos visibles que las de una API sincrona. Una cola sin ownership claro puede convertirse en riesgo operacional: duplicados, mensajes perdidos, reprocesos manuales, DLQ saturada o consumidores detenidos sin alarma.

Un catalogo de mensajeria debe responder:

- Que servicio produce mensajes?
- Que servicio consume?
- Que cola o topico se usa?
- Hay DLQ?
- Hay redelivery?
- El procesamiento es idempotente?
- Como se hace replay seguro?
- Que metrica permite saber si el flujo esta sano?

En Spotybank aparecen patrones asociados a JMS, ActiveMQ, IBM MQ y rutas Camel. Para uso educativo, eso permite discutir una idea importante: lo asincronico no elimina complejidad, la mueve. Por eso necesita contrato, observabilidad y procedimiento.

Una cola documentada solo por nombre es insuficiente. Una cola documentada con productor, consumidor, semantica, reintentos y criterio de recuperacion empieza a ser operable.

Un catalogo de mensajeria queda cerrado cuando cada entrada responde, como minimo:

| Campo | Pregunta |
|---|---|
| Canal | Que cola o topico representa? |
| Productor | Quien publica o dispara el mensaje? |
| Consumidor | Quien procesa el mensaje? |
| Semantica | Que hecho de negocio o tecnico representa? |
| Error | Que ocurre ante fallo parcial? |
| Recuperacion | Hay DLQ, replay, redelivery o procedimiento manual? |
| Observabilidad | Que metrica o log permite detectar degradacion? |

## 04.8 Documentacion operacional

Un sistema no se entiende completamente hasta que se sabe operarlo. La documentacion operacional traduce arquitectura en accion: que mirar, que medir, que reiniciar, que escalar, que no tocar y cuando pedir ayuda.

En una version madura, cada servicio o funcionalidad deberia enlazar a un runbook. Ese runbook debe cubrir:

- Como saber si el servicio esta saludable.
- Que logs o trazas revisar.
- Que dependencias externas validar.
- Que hacer ante errores de base de datos.
- Que hacer ante caida de broker.
- Que hacer ante timeouts SOAP o REST.
- Como pausar, reintentar o reprocesar sin duplicar efectos.
- Cuando escalar a seguridad, arquitectura, plataforma o negocio.

La documentacion operacional tambien tiene valor docente. Obliga a pensar mas alla del "compila". Un sistema moderno no es solo codigo actualizado. Es codigo que puede observarse, recuperarse y explicarse durante un incidente.

Un runbook minimo no necesita cubrir todos los incidentes posibles. Debe cubrir el primer nivel de respuesta:

| Bloque | Pregunta |
|---|---|
| Sintoma | Como se reconoce el problema? |
| Impacto | Que funcionalidad o usuario educativo se ve afectado? |
| Diagnostico | Que logs, metricas, trazas o colas revisar? |
| Accion segura | Que se puede hacer sin empeorar el estado? |
| Escalamiento | Cuando pedir apoyo a seguridad, arquitectura, plataforma o negocio? |
| Aprendizaje | Que documento se actualiza despues del incidente? |

## 04.9 Definicion de done documental

La documentacion viva necesita reglas. Si nadie la mantiene, vuelve a quedar vieja. Spotybank propone una definicion de done documental:

- Todo cambio funcional actualiza README o documento transversal.
- Todo endpoint nuevo aparece en catalogo.
- Toda cola nueva aparece en catalogo de mensajeria.
- Toda dependencia nueva queda registrada.
- Toda decision arquitectonica relevante se documenta.
- Todo riesgo nuevo entra al backlog tecnico.
- Toda excepcion se marca como decision pendiente.

Esta definicion no busca agregar burocracia. Busca evitar que el conocimiento vuelva a esconderse en conversaciones, tickets sueltos o memoria individual.

El cambio no esta terminado cuando compila. Esta terminado cuando se puede entender, probar, operar y ensenar.

## 04.10 Gobernanza documental

La gobernanza documental responde una pregunta incomoda: quien cuida el mapa?

Una propuesta ligera para Spotybank:

| Momento | Control |
|---|---|
| Pull request | Verificar si cambia README, endpoint, cola, dependencia o riesgo |
| Release | Revisar catalogos, matriz y notas de cambio |
| Incidente | Actualizar runbook con aprendizaje real |
| Refactor | Registrar decision, impacto esperado y criterio de exito |
| Onboarding | Usar dudas nuevas para mejorar documentacion |

La documentacion viva no necesita un comite pesado. Necesita puntos de control simples y repetibles. Si cada cambio deja el mapa un poco mejor, la deuda documental disminuye. Si cada cambio la ignora, el mapa envejece otra vez.

## 04.11 Uso de IA para documentacion viva

La IA puede acelerar mucho la creacion de documentacion inicial. Puede leer patrones, agrupar servicios, detectar tecnologias, proponer tablas, comparar README y generar borradores. En un sistema grande, esto reduce semanas de exploracion manual.

Pero la IA debe trabajar dentro de un flujo controlado:

1. Recolectar evidencia local.
2. Generar borrador.
3. Marcar inferencias.
4. Validar con pruebas, owners o ejecucion.
5. Corregir documentacion.
6. Registrar pendientes.
7. Repetir en cada iteracion.

La IA es especialmente util en los dos primeros pasos. Los pasos siguientes convierten texto en conocimiento confiable. Sin validacion, la documentacion puede sonar convincente y aun asi estar equivocada.

Un buen prompt para este contexto no pide "documenta este sistema" de forma abierta. Pide algo mas estricto: "separa evidencia, inferencia, decision pendiente y recomendacion; cita archivos; no afirmes uso productivo sin trazas".

Una salida de IA para documentacion viva solo es aceptable si deja trazabilidad:

- Cita fuentes o patrones usados.
- Marca inferencias y validaciones externas.
- Propone preguntas para owners o revisores.
- No afirma uso productivo sin evidencia de runtime.
- No copia secretos, dominios privados ni datos reales.
- Sugiere que artefacto documental debe actualizarse.

## 04.12 Calidad documental

La documentacion viva debe poder evaluarse. Algunos criterios practicos:

| Criterio | Pregunta |
|---|---|
| Navegabilidad | Una persona nueva encuentra el punto de entrada? |
| Evidencia | Las afirmaciones importantes citan archivos o fuentes? |
| Actualidad | El documento refleja el estado del repositorio? |
| Operabilidad | Sirve durante un incidente o despliegue? |
| Trazabilidad | Distingue evidencia, inferencia y pendiente? |
| Accionabilidad | Termina en pruebas, decisiones o backlog? |

Una documentacion extensa pero inutil falla estos criterios. Una documentacion breve pero verificable puede ser mucho mas valiosa.

Para cierre tecnico, cada documento vivo debe declarar su proposito. Si no se sabe para quien sirve, cuando se usa o que decision mejora, probablemente sobra, esta incompleto o debe fusionarse con otro artefacto.

## Ejercicio practico

Elegir una funcionalidad de Spotybank, por ejemplo MFA, notificaciones u onboarding, y construir una ficha viva.

### Entregables

1. Servicios participantes.
2. Endpoints principales.
3. Colas o topicos.
4. Dependencias externas.
5. Riesgos conocidos.
6. Evidencia local que sostiene cada afirmacion.
7. Preguntas para owners o revisores.
8. Pruebas minimas antes de liberar cambios.

### Criterios de exito

| Criterio | Esperado |
|---|---|
| Cobertura | La ficha conecta servicios, contratos e infraestructura |
| Honestidad | Lo no confirmado queda como decision pendiente |
| Utilidad | La ficha ayuda a planificar un cambio realista |
| Operacion | Incluye senales o runbook minimo |
| Mantenimiento | Define que documento se actualiza ante nuevos cambios |

El ejercicio queda cerrado si la ficha permite a otra persona planificar un cambio, una prueba o una revision de riesgo sin pedir una explicacion oral previa.

## Resumen del capitulo

- La documentacion viva es parte del sistema, no decoracion posterior.
- README, catalogos, matrices y runbooks cumplen funciones distintas y complementarias.
- La documentacion generada acelera, pero debe diferenciarse de la validada.
- La matriz de relaciones permite ver acoplamientos que el codigo aislado oculta.
- La documentacion operacional es clave para soporte, seguridad y aprendizaje.
- La gobernanza documental evita que el mapa vuelva a quedar viejo.
- La IA ayuda a producir borradores y detectar patrones, pero no reemplaza evidencia ni validacion.

## Cierre tecnico-editorial del capitulo

| Control | Dictamen |
|---|---|
| Capas documentales | Cerrado: generada, validada y operacional quedan diferenciadas |
| README por microservicio | Cerrado: incluye controles minimos de identidad, evidencia, interfaces, dependencias, riesgos, operacion y mantenimiento |
| Documentacion por funcionalidad | Cerrado: ficha viva con flujo, contratos, riesgos, pruebas y operacion |
| Matriz de relaciones | Cerrado: orientada a impacto, acoplamientos, pruebas y priorizacion |
| Catalogo de endpoints y mensajeria | Cerrado: superficie tecnica, contratos, errores, recuperacion y observabilidad |
| Runbooks | Cerrado: primer nivel de respuesta, diagnostico, accion segura y aprendizaje |
| Gobernanza documental | Cerrado: controles en PR, release, incidente, refactor y onboarding |
| IA documental | Cerrado: IA genera borradores con trazabilidad, no conocimiento validado por si sola |

Pendientes editoriales internos del capitulo: ninguno.

## Preguntas de revision

1. Que diferencia hay entre documentacion generada, validada y operacional?
2. Por que una matriz de relaciones ayuda a planificar refactors?
3. Que informacion minima debe tener un catalogo de mensajeria?
4. Como se evita que la documentacion vuelva a quedar desactualizada?
5. Que riesgos aparecen si una IA genera documentacion sin marcar inferencias?
6. Que controles minimos debe cumplir un README de servicio para considerarse cerrado?

## Referencias del capitulo

- `Documentacion/microservicios/README.md`
- `Documentacion/arquitectura/matriz-relaciones.md`
- `Documentacion/arquitectura/catalogo-endpoints-rutas.md`
- `Documentacion/arquitectura/catalogo-mensajeria.md`
- `Documentacion/runbooks/incidentes-comunes.md`
- `Documentacion/gobernanza/definicion-done-documentacion.md`
- `SPOTYBANK_GUIA_IA_MODERNIZACION/02_PLANIFICACION/MAPA_EVIDENCIAS_SPOTYBANK.md`
- `SPOTYBANK_GUIA_IA_MODERNIZACION/09_REVISIONES/CHECKLIST_REVISION_TECNICA_EDITORIAL.md`
