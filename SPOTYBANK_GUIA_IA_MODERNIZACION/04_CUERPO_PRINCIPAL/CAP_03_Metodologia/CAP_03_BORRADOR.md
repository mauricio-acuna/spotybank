# Capitulo 03 - Anonimizacion y Rebranding Seguro

Estado de cierre tecnico-editorial: `CERRADO_TECNICO`.

Dictamen del capitulo: apto como guia de saneamiento previo a publicacion. El capitulo diferencia limpieza cosmetica, anonimizacion y saneamiento de seguridad; define controles sobre identidad, configuracion, datos, artefactos y uso de IA; y deja una compuerta verificable para publicar material educativo sin exponer informacion sensible.

Un sistema puede ser tecnicamente interesante y, al mismo tiempo, no estar listo para ser mostrado. Esa tension aparece con frecuencia cuando se convierte un conjunto de repositorios heredados en material educativo. El valor didactico vive en la textura real del sistema: nombres de servicios, configuraciones, integraciones, convenciones, scripts, pruebas y deuda tecnica. El riesgo tambien.

Anonimizar no significa borrar toda huella hasta dejar una maqueta vacia. Significa transformar el material para que pueda estudiarse sin exponer identidad, secretos, dominios, personas, proveedores, infraestructura o decisiones internas de una organizacion real. El desafio es conservar suficiente estructura para aprender y eliminar suficiente contexto para publicar con responsabilidad.

Spotybank nace de esa operacion: saneamiento, rebranding y control editorial.

## Objetivos del capitulo

Al finalizar este capitulo, el lector podra:

- Explicar por que un caso educativo debe separar valor tecnico de identidad original.
- Diferenciar limpieza cosmetica, anonimizacion y saneamiento de seguridad.
- Disenar una estrategia de rebranding tecnico sin perder trazabilidad de aprendizaje.
- Identificar informacion no publicable en codigo, configuracion, documentacion y artefactos auxiliares.
- Construir un checklist de publicacion segura con evidencia, inferencias y decisiones pendientes.
- Usar IA durante el saneamiento sin exponer secretos ni convertir sugerencias en validaciones.
- Aplicar una compuerta de publicacion segura antes de cualquier commit, push, release o artefacto distribuible.

## 03.1 Anonimizar antes de ensenar

Un repositorio heredado suele contener mas informacion de la que parece. No solo hay codigo. Hay nombres de entidades, dominios, usuarios, rutas internas, convenciones de ambiente, endpoints, colas, certificados, scripts, historiales de migracion, comentarios, autores, ejemplos de payload, archivos comprimidos y configuraciones que pueden revelar como trabaja una organizacion.

La anonimizacion no es un tramite posterior a la escritura. Es una condicion previa para que el caso pueda circular fuera del contexto original. Si se redacta un libro sobre un sistema sin haberlo saneado, el texto queda construido sobre una base fragil: cada captura, cada tabla, cada comando y cada ejemplo puede arrastrar informacion que no deberia publicarse.

En Spotybank, la regla es simple: primero se crea una identidad educativa segura; despues se explica el sistema.

Esta regla tiene una consecuencia practica: ningun fragmento se considera publicable solo porque aparezca en documentacion. La documentacion tambien se revisa. Un README, una tabla, un ejemplo de payload o una nota de investigacion pueden filtrar informacion tanto como un archivo de configuracion.

## 03.2 Tres niveles de limpieza

No toda limpieza tiene el mismo alcance. Conviene distinguir tres niveles porque cada uno reduce riesgos distintos.

| Nivel | Que cambia | Que riesgo reduce | Limite |
|---|---|---|---|
| Limpieza cosmetica | Nombres visibles, titulos, README, portada | Confusion de marca o identidad publica | Puede dejar rastros tecnicos internos |
| Anonimizacion | Entidades, personas, dominios, correos, nombres de ambiente | Exposicion de identidad o contexto organizacional | No necesariamente elimina secretos |
| Saneamiento de seguridad | Tokens, passwords, certificados, dumps, endpoints reales, artefactos no revisados | Exposicion tecnica explotable o reutilizable | Requiere escaneo y revision repetible |

Un cambio de nombre en la portada no convierte un material en publicable. Tampoco alcanza con reemplazar un dominio si quedan certificados, usuarios reales o scripts con patrones sensibles. La seguridad editorial necesita los tres niveles.

El orden importa. Primero se identifican superficies, despues se reemplazan valores y recien al final se redacta la explicacion publica. Si se redacta antes de sanear, el texto puede repetir nombres, rutas o decisiones que despues seran dificiles de rastrear.

## 03.3 Amenazas editoriales de un caso tecnico

El riesgo de publicacion no siempre es un secreto obvio. A veces es una combinacion de pequenas pistas. Un nombre de paquete puede revelar una entidad. Un endpoint puede revelar un proveedor. Una cola puede mostrar una frontera funcional. Un ejemplo de configuracion puede exponer un patron de credenciales. Una ruta de archivo puede revelar nombres de usuarios o estaciones de trabajo.

Para revisar un caso educativo, conviene ordenar amenazas por superficie:

| Superficie | Ejemplos de riesgo | Tratamiento en Spotybank |
|---|---|---|
| Identidad | Marca real, nombre de institucion, autores previos | Sustitucion por identidad Spotybank |
| Codigo | Paquetes, imports, constantes, comentarios | Rebranding tecnico y revision de patrones |
| Configuracion | Properties, YAML, manifiestos, variables | Placeholders educativos y valores ficticios |
| Integraciones | URLs, colas, topicos, servicios externos | Dominios y rutas de ejemplo |
| Datos | Dumps, fixtures, payloads, tablas | Datos sinteticos o prefijos educativos |
| Artefactos | ZIP, binarios, certificados, respaldos | Exclusion o regeneracion desde fuente saneada |
| Documentacion | Diagramas, capturas, notas internas | Redaccion neutral y referencias controladas |

La pregunta de revision no es "se ve bonito?". La pregunta es: que podria inferir alguien que no deberia tener contexto sobre el sistema original?

Para cerrar una revision de amenaza editorial, cada superficie debe terminar en una de estas decisiones:

| Decision | Significado | Ejemplo |
|---|---|---|
| Publicable | Puede quedar en la obra sin exponer identidad ni secretos | Nombre canonico `Spotybank` |
| Publicable con placeholder | Se conserva la estructura, pero no el valor original | `https://api.spotybank.io/example` |
| Excluir | No aporta suficiente valor educativo frente al riesgo | ZIP heredado, certificado, dump, log |
| Regenerar | Debe reconstruirse desde fuentes saneadas | Artefacto distribuible o paquete de laboratorio |
| Conservar solo localmente | Sirve para auditoria interna, no para publicacion | Script historico con patrones originales |

## 03.4 Identidad tecnica nueva

La identidad tecnica de Spotybank funciona como una frontera. Dentro de esa frontera se puede hablar de dominios bancarios, autenticacion, MFA, notificaciones, despliegue, observabilidad, performance y modernizacion. Fuera de esa frontera quedan las referencias originales.

La identidad educativa usa:

- Marca publica: `Spotybank`.
- Namespace Java base: `io.spotybank.services`.
- Dominio educativo: `api.spotybank.io`.
- Prefijos de datos educativos: `SB`.
- Credenciales de ejemplo sin valor real.

Esta decision tiene dos beneficios. Primero, reduce exposicion. Segundo, ayuda al lector: todo lo que aparece bajo la identidad Spotybank pertenece al caso educativo y debe leerse como material de aprendizaje, no como fotografia de una entidad real.

El rebranding, sin embargo, debe hacerse con cuidado. Una sustitucion mecanica puede romper compilacion, pruebas, configuracion o documentacion. La identidad nueva tiene que ser coherente, pero no debe ocultar la evidencia de que algunas decisiones son inferencias o limites del caso.

## 03.5 Paquetes, namespaces y trazabilidad

Los paquetes Java y namespaces revelan historia. En un sistema empresarial pueden indicar producto, area, proveedor, equipo o etapa de migracion. Por eso moverlos hacia `io.spotybank.services` no es solo una mejora estetica: es parte del saneamiento.

Una migracion responsable revisa al menos:

- Declaraciones `package`.
- Imports internos.
- Rutas fisicas de carpetas.
- Referencias en pruebas.
- Configuraciones que usen nombres de clase.
- Documentacion generada.
- Ejemplos de comandos o scripts.
- Diagramas que incluyan namespaces.

El criterio no es "renombrar todo de una vez". El criterio es mantener trazabilidad. Cada cambio debe poder explicarse: que se reemplazo, por que se reemplazo, que evidencia muestra que no queda una referencia no publicable y que decision sigue pendiente si no hay confirmacion suficiente.

## 03.6 Configuracion, secretos y placeholders

La configuracion suele concentrar los riesgos mas concretos. Un archivo `application.properties`, un manifiesto YAML o un script de despliegue puede contener usuarios, passwords, tokens, rutas internas, nombres de colas, endpoints, certificados o convenciones de ambiente.

Para un caso educativo, no basta con borrar valores. El lector necesita entender la intencion de cada configuracion. Por eso Spotybank usa placeholders: valores ficticios, legibles y sin utilidad fuera del ejemplo.

| Tipo de valor | Ejemplo educativo | Criterio |
|---|---|---|
| Usuario | `spoty_user` | Explica el rol sin identificar una cuenta real |
| Password | `spoty_secure_pwd` | No debe parecer una clave reutilizable |
| Token | `spoty_example_token` | Debe ser obviamente invalido |
| Secret | `spoty_example_secret` | No debe tener longitud ni formato productivo |
| Endpoint | `https://api.spotybank.io/example` | Debe ser ficticio o controlado por el caso |

Una credencial en un repositorio debe considerarse comprometida aunque sea antigua o "de prueba". Si se encontro en material heredado, no se publica. Si se necesita mostrar la forma de configurarla, se reemplaza por un placeholder educativo.

Un buen placeholder no intenta parecer secreto real. Debe ser didactico, breve y claramente inutil fuera del ejemplo. Si un valor ficticio tiene longitud, prefijo o formato similar al de una credencial real, aumenta el riesgo de confusion y debe simplificarse.

## 03.7 Dominios, endpoints, colas y ambientes

Los dominios internos son informacion sensible porque pueden revelar proveedores, arquitectura, regiones, convenciones de red o herramientas corporativas. Lo mismo ocurre con colas, topicos, buckets, nombres de ambientes y rutas de integracion.

En Spotybank, una referencia de integracion publicable debe cumplir tres condiciones:

1. Ser claramente ficticia o educativa.
2. Mantener semantica suficiente para explicar el flujo.
3. No permitir inferir infraestructura real.

Por ejemplo, una ruta como `https://api.spotybank.io/mfa/validate` sirve para explicar un contrato educativo. No afirma que exista un servicio real disponible en internet. La diferencia debe quedar clara en el texto.

Tambien hay que cuidar las colas y topicos. Un nombre puede exponer dominio funcional, criticidad o proveedor. Para publicacion, conviene reemplazar nombres especificos por nombres canonicos del caso, o documentarlos como ejemplos sinteticos.

## 03.8 Datos, tablas y prefijos

El saneamiento tambien alcanza datos. En banca, un campo, una tabla o un payload puede revelar mucho aunque no incluya un nombre de persona. La estructura puede sugerir procesos internos, reglas de negocio, segmentacion o flujos sensibles.

Spotybank evita datos reales y trabaja con datos sinteticos. Cuando hace falta conservar estructura, se usan prefijos educativos como `SB_` y ejemplos minimos. La meta no es simular una base productiva, sino permitir que el lector entienda responsabilidades y contratos.

La transformacion de datos debe revisar:

- Scripts SQL.
- Mapeos ORM.
- Fixtures de prueba.
- Payloads JSON/XML.
- Datos embebidos en tests.
- Consultas dentro de codigo.
- Documentacion de tablas o colecciones.

Un dato sintetico tambien debe ser verosimil. Si es demasiado absurdo, no ensena. Si parece real, confunde. El equilibrio esta en hacerlo claramente ficticio, pero funcional para el ejercicio.

## 03.9 Artefactos no inspeccionados

Los archivos comprimidos y binarios merecen una regla estricta. Un `.zip`, un `.jar`, un respaldo o un certificado puede contener material no visible en una busqueda superficial. Aunque el repositorio parezca saneado, un artefacto heredado puede conservar configuraciones antiguas, secretos, nombres reales o metadatos.

La politica recomendada es:

- No publicar artefactos comprimidos heredados.
- Regenerar distribuciones desde fuentes saneadas.
- Excluir respaldos, certificados y binarios innecesarios.
- Registrar cualquier excepcion con evidencia de revision.

No conviene confiar en "seguramente esta limpio". La publicacion necesita controles repetibles.

En el cierre editorial de la obra, el repo de `ObraLiteraria` debe verificarse contra extensiones de riesgo antes de publicar:

```text
zip, jar, war, ear, p12, pfx, jks, pem, key, crt, cer, bak, dump, sql, log
```

La ausencia de esos artefactos no garantiza seguridad total, pero elimina una superficie frecuente de filtracion accidental.

## 03.10 Scripts historicos de refactor

Los scripts usados para migrar identidad pueden contener los patrones originales que precisamente se quieren retirar. Esto no significa que sean inutiles. Pueden servir como trazabilidad local del saneamiento. Pero para publicar material educativo hay que decidir que hacer con ellos.

Hay tres opciones razonables:

| Opcion | Uso | Riesgo |
|---|---|---|
| Excluir scripts historicos | Distribucion publica | Se pierde trazabilidad operativa |
| Reescribirlos como genericos | Material docente | Requiere mantenimiento extra |
| Conservarlos solo localmente | Auditoria interna | No deben entrar al repo publico |

Spotybank prioriza scripts de publicacion que escanean patrones no publicables sin exponer directamente valores sensibles. El script no reemplaza una revision humana, pero reduce el riesgo de publicar por accidente.

La compuerta operativa minima antes de publicar es:

1. Revisar cambios locales.
2. Ejecutar escaneo de contenido no publicable.
3. Verificar que no se agregaron artefactos binarios o temporales.
4. Confirmar que los placeholders son ficticios.
5. Hacer commit y push solo si los controles no reportan hallazgos.

En esta obra, esa compuerta se automatiza parcialmente con `Publicar_ObraLiteraria_Spotybank.ps1`.

## 03.11 Evidencia, inferencia y decision pendiente

El saneamiento tambien debe usar el lenguaje metodologico del libro. Cada hallazgo se clasifica para evitar falsas certezas.

| Tipo | Pregunta | Ejemplo |
|---|---|---|
| Evidencia | Que se observo en archivos locales? | Existe un placeholder educativo en una propiedad. |
| Inferencia | Que conclusion razonable se obtiene? | Un endpoint parece pertenecer a un flujo de autenticacion. |
| Decision pendiente | Que requiere validacion externa? | Confirmar si una integracion sigue vigente en un ambiente real. |
| Recomendacion | Que accion reduce riesgo? | Reemplazar valores por placeholders y ejecutar escaneo previo a push. |

Esta clasificacion evita dos errores. El primero es publicar como hecho lo que solo se deduce. El segundo es convertir un escaneo exitoso en garantia absoluta. Un escaneo sin coincidencias es evidencia favorable, no permiso para dejar de revisar.

## 03.12 Uso de IA durante el saneamiento

La IA puede ayudar mucho en esta etapa. Puede buscar patrones, proponer nombres neutrales, detectar inconsistencias entre documentos, generar checklists, resumir riesgos y convertir hallazgos en backlog. Pero tambien puede amplificar un problema si se usa sin cuidado.

Reglas minimas:

- No pegar secretos reales en prompts.
- No compartir archivos completos si contienen datos sensibles.
- Trabajar con valores ya enmascarados.
- Pedir clasificacion de evidencia, inferencia y decision pendiente.
- Verificar manualmente cualquier sustitucion masiva.
- Ejecutar escaneos locales antes de commitear.

La IA es util para no olvidar superficies de revision. No es una autoridad de seguridad. El criterio final sigue siendo humano, documentado y repetible.

## Ejercicio practico

Tomar un microservicio de Spotybank y preparar una mini revision de publicacion segura.

### Entregables

1. Tabla de referencias revisadas: paquetes, properties, tests, README y scripts.
2. Lista de valores que deben quedar como placeholders.
3. Lista de archivos que no deberian publicarse.
4. Evidencia local que respalda que el servicio esta saneado.
5. Validaciones externas necesarias si el ejemplo se llevara a un ambiente real.

### Criterios de exito

| Criterio | Esperado |
|---|---|
| Identidad | Todas las referencias publicas usan Spotybank o placeholders |
| Secretos | No aparecen tokens, passwords ni certificados reales |
| Integraciones | Los endpoints son ficticios o claramente educativos |
| Datos | Los ejemplos son sinteticos |
| Trazabilidad | Cada cambio puede explicarse con evidencia |
| Prudencia | Lo no confirmado queda como decision pendiente |
| Artefactos | No hay comprimidos, certificados, dumps, logs ni binarios heredados en el material publicable |

Para cerrar el ejercicio, el lector debe entregar una decision por cada superficie revisada: publicable, publicable con placeholder, excluir, regenerar o conservar solo localmente.

## Resumen del capitulo

- La anonimizacion es una condicion previa para publicar material tecnico educativo.
- Rebranding seguro no es solo cambiar nombres visibles; incluye codigo, configuracion, datos, artefactos y documentacion.
- Los placeholders deben ensenar intencion sin exponer valores reales.
- Los comprimidos, binarios y scripts historicos requieren control especial.
- El saneamiento debe distinguir evidencia, inferencia, decision pendiente y recomendacion.
- La IA acelera la revision, pero no sustituye escaneo, criterio humano ni trazabilidad.

## Cierre tecnico-editorial del capitulo

| Control | Dictamen |
|---|---|
| Identidad educativa | Cerrado: Spotybank queda como frontera publica del caso |
| Niveles de limpieza | Cerrado: limpieza cosmetica, anonimizacion y saneamiento quedan diferenciados |
| Secretos y placeholders | Cerrado: los valores de ejemplo deben ser ficticios, obvios y sin utilidad real |
| Dominios, endpoints y colas | Cerrado: solo se admiten referencias ficticias, educativas o saneadas |
| Artefactos no inspeccionados | Cerrado: comprimidos, certificados, dumps, logs y binarios heredados se excluyen o regeneran |
| Scripts historicos | Cerrado: pueden servir como trazabilidad local, pero no como material publico si exponen patrones originales |
| IA durante saneamiento | Cerrado: IA solo trabaja con valores enmascarados y bajo revision humana |
| Compuerta de publicacion | Cerrado: escaneo, revision de artefactos y placeholders antes de commit/push |

Pendientes editoriales internos del capitulo: ninguno.

## Preguntas de revision

1. Por que cambiar solo el nombre visible del proyecto no alcanza para publicarlo?
2. Que diferencia hay entre placeholder, secreto de prueba y secreto real?
3. Por que un archivo comprimido puede ser mas riesgoso que un archivo fuente?
4. Como se documenta una decision pendiente durante el saneamiento?
5. Que riesgos aparecen si se usa IA con valores sensibles sin enmascarar?
6. Que decision debe tomarse para cada superficie antes de publicar: publicable, placeholder, excluir, regenerar o conservar localmente?

## Referencias del capitulo

- `Documentacion/spotybank/refactor-identidad.md`
- `Documentacion/spotybank/servicios-canonicos.md`
- `Documentacion/arquitectura/seguridad-y-riesgos.md`
- `Documentacion/statusTasks.md`
- `SPOTYBANK_GUIA_IA_MODERNIZACION/09_REVISIONES/CHECKLIST_REVISION_TECNICA_EDITORIAL.md`
- `Publicar_ObraLiteraria_Spotybank.ps1`
