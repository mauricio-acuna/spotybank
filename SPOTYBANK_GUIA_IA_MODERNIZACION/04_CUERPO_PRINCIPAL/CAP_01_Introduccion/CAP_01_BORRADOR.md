# Capitulo 01 - Introduccion

Hay sistemas que no se entienden leyendo una sola clase, una sola pantalla de arquitectura o un README escrito al final de la prisa. Se entienden siguiendo rastros: nombres de servicios, dependencias que envejecieron junto con el negocio, configuraciones que sobrevivieron a varias generaciones de plataforma, pruebas incompletas, integraciones que nadie se atreve a tocar sin una reunion previa y decisiones que alguna vez fueron razonables, pero que hoy pesan.

Spotybank nace para estudiar ese territorio.

No es un banco real. No es una plataforma financiera operativa. No es una maqueta limpia construida para que todo encaje en una diapositiva. Es un caso educativo: un laboratorio tecnico basado en un ecosistema de microservicios bancarios anonimizado, saneado y convertido en material de aprendizaje. Su objetivo no es impresionar con una arquitectura perfecta, sino permitir que el lector practique una habilidad mucho mas escasa: mirar un sistema heredado con precision, separar evidencia de opinion, detectar riesgos y construir una modernizacion que pueda explicarse, probarse y defenderse.

La modernizacion de software no empieza cuando alguien elige Kubernetes, cambia una version de Java o agrega una herramienta de inteligencia artificial. Empieza antes, en una pregunta mas incomoda: que sabemos realmente del sistema que queremos cambiar?

Este libro propone una respuesta metodica a esa pregunta.

## Objetivos del capitulo

Al finalizar este capitulo, el lector podra:

- Explicar que es Spotybank y por que se usa como caso educativo.
- Entender por que un sistema legacy puede ser una fuente excelente de aprendizaje.
- Diferenciar modernizacion asistida por IA de simple generacion automatica de codigo.
- Reconocer los limites del caso y las decisiones que no deben presentarse como hechos.
- Identificar como distintos perfiles pueden trabajar sobre el mismo material sin perder coherencia.

## 01.1 Que es Spotybank

Spotybank es un entorno educativo construido a partir de documentacion, evidencias y patrones de un conjunto de microservicios bancarios anonimizados. En esta obra, el nombre Spotybank funciona como identidad publica del caso: una frontera editorial y tecnica que permite estudiar arquitectura bancaria, modernizacion legacy, seguridad, nube, observabilidad, performance, QA y uso responsable de IA sin exponer una entidad real.

La palabra clave aqui es "caso". Spotybank no pretende ser un producto listo para operar, ni una implementacion de referencia para banca digital. Su valor esta en otra parte: ofrece un sistema suficientemente complejo para que las discusiones tecnicas sean reales, pero suficientemente controlado para que pueda usarse en docencia, talleres, laboratorios y lectura profesional.

Un ejemplo academico creado desde cero suele tener una virtud y un defecto. La virtud es que se entiende rapido. El defecto es que casi nunca se parece a los sistemas que sostienen operaciones reales. En esos sistemas aparecen capas historicas, integraciones heterogeneas, responsabilidades mezcladas, nomenclaturas que quedaron a mitad de camino, dependencias transversales, excepciones de negocio, configuracion dispersa y zonas de conocimiento tacito.

Spotybank conserva esa textura, pero la convierte en material seguro.

En lugar de presentar una arquitectura idealizada, la obra propone recorrer un sistema con preguntas de ingenieria:

- Que servicios existen?
- Cuales parecen desplegables y cuales son librerias o artefactos auxiliares?
- Donde hay deuda tecnica visible?
- Que configuracion podria exponer riesgo?
- Que contratos se pueden inferir y cuales requieren validacion?
- Que se puede mejorar ahora sin inventar una migracion imposible?
- Que partes del sistema deben mantenerse como supuestos hasta que exista evidencia?

La obra trabaja sobre una idea central: un sistema heredado no es basura tecnica. Es una concentracion de historia, decisiones, restricciones y aprendizaje. Modernizarlo exige respeto por esa historia, pero no obediencia ciega a ella.

## 01.2 Por que un sistema legacy es valioso para aprender

La industria habla mucho de modernizacion, pero con frecuencia la reduce a una secuencia de slogans: migrar a la nube, adoptar microservicios, automatizar pipelines, usar IA, agregar observabilidad, endurecer seguridad. Todas esas acciones pueden ser valiosas. Tambien pueden ser ruido caro si se aplican sin diagnostico.

Un sistema legacy obliga a pensar con mas rigor porque no concede el lujo de la simplificacion. En un sistema asi, cada cambio convive con restricciones:

| Restriccion | Pregunta que obliga a formular |
|---|---|
| Dependencias antiguas | Que se rompe si actualizamos? |
| Configuracion dispersa | Que valores son sensibles, ambientales o historicos? |
| Integraciones externas | Que contratos existen realmente? |
| Falta de trazas limpias | Como validamos comportamiento sin inventarlo? |
| Conocimiento distribuido | Que decision requiere owner o revision humana? |
| Deuda tecnica acumulada | Que mejora reduce riesgo sin producir una reescritura total? |

Este tipo de caso entrena una competencia distinta a la programacion aislada. Entrena lectura de sistemas.

Leer un sistema no es recorrer archivos al azar. Es construir un mapa verificable. Ese mapa debe distinguir entre lo que se observo, lo que se deduce y lo que falta confirmar. Esa distincion atraviesa toda la obra:

| Tipo de afirmacion | Significado | Ejemplo en Spotybank |
|---|---|---|
| Evidencia | Se observa en archivos, configuracion, codigo o documentacion local. | Existe un conjunto de artefactos Maven asociados al ecosistema. |
| Inferencia | Es una conclusion razonable, pero no definitiva. | Un servicio parece pertenecer al dominio de autenticacion por sus nombres y dependencias. |
| Decision pendiente | Requiere owner, ambiente, metrica, contrato o validacion externa. | Confirmar si un endpoint sigue vigente en una plataforma real. |
| Recomendacion | Propone accion y criterio de validacion. | Externalizar secretos y comprobar que el pipeline bloquea valores sensibles. |

Esta tabla parece simple. No lo es. En proyectos reales, muchas discusiones se traban porque evidencia, inferencia y deseo se mezclan en una misma frase. Este libro insiste en separarlas porque esa separacion protege al lector de tres errores habituales:

1. Confundir nombres de archivo con comportamiento productivo.
2. Convertir una buena practica generica en una decision local sin contexto.
3. Presentar una hipotesis generada por IA como si fuera una conclusion tecnica.

Spotybank sirve para practicar exactamente lo contrario: pensar con disciplina.

## 01.3 El rol de la IA como copiloto de diagnostico y modernizacion

La inteligencia artificial puede acelerar una modernizacion. Tambien puede amplificar una mala interpretacion si se usa sin control.

En esta obra, la IA no aparece como una varita ni como una autoridad. Aparece como un copiloto de ingenieria: una herramienta capaz de leer, resumir, clasificar, proponer y redactar, siempre bajo supervision humana. Su utilidad depende de la calidad del contexto y de la claridad de la tarea.

Bien usada, la IA ayuda a:

- Convertir hallazgos dispersos en inventarios.
- Detectar patrones repetidos en configuracion, dependencias o nombres.
- Redactar documentacion inicial a partir de evidencia local.
- Proponer checklists de seguridad, QA y operacion.
- Transformar riesgos en backlog accionable.
- Comparar alternativas de modernizacion.
- Preparar ejercicios, rubricas y materiales docentes.

Mal usada, la IA puede:

- Inventar capacidades que el sistema no tiene.
- Ocultar incertidumbre con una prosa convincente.
- Mezclar informacion sensible en prompts o salidas.
- Recomendar migraciones demasiado grandes para el contexto.
- Dar una falsa sensacion de revision completa.

Por eso la regla de Spotybank es estricta: la IA acelera el trabajo, pero no firma la decision.

Una modernizacion asistida por IA debe dejar rastros. Si la IA propone que un servicio pertenece a un dominio, el lector debe poder encontrar la evidencia que sostiene esa propuesta. Si la IA recomienda mover una configuracion a un gestor de secretos, debe existir un criterio para validar que el secreto ya no queda versionado. Si la IA resume un capitulo, debe conservar los limites del caso.

El valor de la IA no esta en escribir mas rapido. Esta en ayudar a pensar mejor, siempre que el equipo conserve control sobre el razonamiento.

## 01.4 Alcance, limites y supuestos del caso

Toda obra tecnica seria necesita declarar sus limites. En sistemas bancarios, esa declaracion no es formalidad: es una condicion de responsabilidad.

Spotybank se usa para estudiar modernizacion de microservicios en un contexto educativo. El caso permite discutir dominios bancarios, autenticacion, cuentas, integraciones, mensajeria, despliegue, seguridad, observabilidad, performance, testing y roadmap. Tambien permite disenar actividades para distintos perfiles de un equipo de software.

Pero hay cosas que esta obra no hace:

- No presenta a Spotybank como banco real.
- No promete SLAs ni SLOs productivos.
- No contiene datos reales de clientes.
- No publica secretos, tokens, certificados ni dominios privados.
- No valida contratos contra ambientes productivos.
- No reemplaza revision legal, auditoria de seguridad ni gobierno corporativo.
- No afirma que `spotybank-core-ledger` sea un modulo productivo completo.

El alcance de la obra se resume asi:

| Dimension | Incluido | No incluido |
|---|---|---|
| Arquitectura | Analisis educativo de dominios, fronteras y dependencias | Certificacion de arquitectura productiva |
| Seguridad | Saneamiento, secretos ficticios, DevSecOps y criterios de control | Auditoria formal o pentest |
| Nube | Escenarios cloud native educativos | Operacion real en proveedor especifico |
| Performance | SLIs/SLOs como lenguaje de aprendizaje | Garantias de rendimiento productivo |
| IA | Copiloto de diagnostico, documentacion y backlog | Decision autonoma sin validacion humana |
| Docencia | Ejercicios, laboratorios y rubricas | Acreditacion academica formal |

Esta frontera permite usar el caso con libertad sin convertirlo en algo que no es.

Tambien hay supuestos de trabajo. A lo largo del libro, cuando falten owners, metricas, trazas, contratos o decisiones historicas, la obra no rellenara el vacio con seguridad artificial. Lo marcara como decision pendiente. Esa honestidad no debilita el texto; lo vuelve util.

## 01.5 Perfiles de lectura

Spotybank puede leerse de varias maneras porque la modernizacion no pertenece a un solo rol.

Un desarrollador backend puede concentrarse en Java, Maven, Spring, pruebas y refactorizacion incremental. Un arquitecto puede estudiar dominios, fronteras, contratos y roadmap. Un perfil de seguridad puede revisar secretos, identidad, OAuth2/OIDC, hardening de APIs y controles de publicacion. Un perfil DevOps/SRE puede trabajar con despliegue, observabilidad, recursos, continuidad y runbooks. Un perfil QA puede convertir riesgos en escenarios de prueba, datos sinteticos y criterios de regresion. Un docente puede tomar todo eso y convertirlo en rutas de aprendizaje.

La fuerza del caso esta en que todos miran el mismo sistema.

| Perfil | Pregunta principal | Producto esperado |
|---|---|---|
| Backend | Como modernizar sin romper contratos? | Backlog tecnico, pruebas y refactors acotados |
| Arquitectura | Donde estan las fronteras reales del dominio? | Mapa de servicios, decisiones y roadmap |
| Seguridad | Que no debe publicarse y que debe endurecerse? | Checklist, amenazas y controles verificables |
| DevOps/SRE | Que necesita un servicio para operar bien? | Manifiestos, probes, observabilidad y runbooks |
| QA | Como demostramos que el cambio no degrada el sistema? | Estrategia de pruebas y datos sinteticos |
| Docencia | Como se convierte el caso en aprendizaje? | Laboratorios, rubricas y plan de clase |

Esta lectura por perfiles evita un problema frecuente en obras tecnicas amplias: intentar que todo lector lea todo con la misma profundidad. Aqui no hace falta. Lo importante es que cada perfil entienda su responsabilidad y pueda conversar con los demas usando el mismo mapa.

## 01.6 Como leer esta guia

La obra puede leerse como libro completo o como serie de fasciculos.

La lectura completa ofrece una narrativa de transformacion:

1. Entender el caso.
2. Inventariar la evidencia tecnica.
3. Sanear identidad y preparar publicacion segura.
4. Documentar microservicios de forma viva.
5. Discutir dominios y fronteras.
6. Modernizar backend por oleadas.
7. Integrar seguridad y DevSecOps.
8. Llevar servicios a escenarios cloud native.
9. Analizar performance, resiliencia y operacion.
10. Usar IA como acelerador con limites.
11. Convertir el material en curso.
12. Definir un roadmap de evolucion.

La lectura por fasciculos permite otro recorrido. Un equipo puede tomar primero seguridad si necesita publicar material saneado. Un docente puede empezar por los laboratorios. Un arquitecto puede saltar a dominios y roadmap. Un equipo backend puede ir directo a modernizacion y pruebas.

La recomendacion practica es esta:

- Si eres lector individual, lee los capitulos 1 a 3 antes de saltar.
- Si eres docente, combina capitulos con laboratorios y rubricas.
- Si eres lider tecnico, usa cada capitulo como insumo de backlog.
- Si eres revisor, marca cada observacion como evidencia, inferencia o decision pendiente.

## 01.7 Actividad inicial: abrir el caso sin romperlo

Antes de entrar al inventario tecnico, conviene practicar la postura que guiara el resto del libro. La actividad inicial no consiste en modificar codigo. Consiste en mirar con metodo.

### Objetivo

Construir una primera lectura controlada de Spotybank, sin exponer datos sensibles ni convertir sospechas en afirmaciones.

### Instrucciones

1. Recorre la estructura documental de la obra.
2. Identifica tres evidencias directas sobre el caso.
3. Identifica tres inferencias razonables.
4. Identifica tres decisiones pendientes que requeririan owner, ambiente, trazas o medicion.
5. Redacta una recomendacion de modernizacion con criterio de validacion.

### Entregable

Una tabla como la siguiente:

| Hallazgo | Tipo | Evidencia o razon | Siguiente accion |
|---|---|---|---|
| Hay multiples artefactos Maven | Evidencia | Inventario local | Clasificar servicios y librerias |
| Un servicio parece pertenecer a autenticacion | Inferencia | Nombre y dependencias | Validar responsabilidad real |
| No se conocen SLOs productivos | Decision pendiente | No hay medicion real | Definir SLO educativo o pedir datos |
| Externalizar secretos | Recomendacion | Riesgo de configuracion sensible | Escaneo sin secretos versionados |

### Criterio de exito

La entrega es correcta si ninguna afirmacion se presenta con mas certeza de la que permite la evidencia. Esta regla, aunque parezca modesta, es una de las competencias mas importantes de toda modernizacion.

## Resumen del capitulo

Spotybank es un caso educativo de modernizacion de microservicios bancarios. Su valor esta en conservar la complejidad de un sistema heredado sin exponer informacion real ni convertir el caso en producto financiero.

La obra propone mirar el sistema con disciplina: separar evidencia, inferencia, decision pendiente y recomendacion. Esa separacion permite usar IA con provecho, porque obliga a validar cada conclusion y evita que una respuesta bien redactada se confunda con una decision tecnica.

El libro puede leerse completo o por fasciculos. Cada perfil encuentra una ruta propia, pero todos trabajan sobre el mismo mapa. Esa es la promesa central de Spotybank: convertir un ecosistema tecnico complejo en aprendizaje aplicable, seguro y verificable.

## Preguntas de revision

1. Que diferencia a Spotybank de un ejemplo academico creado desde cero?
2. Por que un sistema legacy puede ser mas valioso para aprender que una arquitectura idealizada?
3. En que tareas puede ayudar la IA durante una modernizacion?
4. Que riesgos aparecen si se usa IA sin distinguir evidencia, inferencia y decision pendiente?
5. Que elementos quedan fuera del alcance de `v0.1-publicable`?
6. Que perfil de lectura se parece mas a tu trabajo actual y que entregable deberia producir?

