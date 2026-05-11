# Capitulo 03 - Anonimizacion y Rebranding Seguro

## Objetivos del capitulo

Al finalizar este capitulo, el lector podra:

- Explicar por que un caso educativo debe eliminar identidad, secretos y dominios reales.
- Diseñar una estrategia de rebranding tecnico sin romper la trazabilidad del aprendizaje.
- Diferenciar limpieza cosmetica de saneamiento de seguridad.
- Aplicar un checklist minimo antes de compartir material fuera de una organizacion.

## 03.1 Por que anonimizar antes de enseñar

Un sistema heredado puede tener enorme valor educativo, pero tambien puede contener informacion que no debe salir de su contexto original: nombres de entidades, dominios internos, usuarios, tokens, endpoints, autores previos, IPs, convenciones corporativas y archivos comprimidos con contenido no revisado.

La anonimizacion no es un detalle legal al final del camino. Es una condicion previa para convertir un repositorio realista en un caso publicable. Spotybank adopta una identidad educativa precisamente para separar el material de aprendizaje de cualquier entidad previa.

## 03.2 Identidad tecnica nueva

La identidad tecnica de Spotybank define una frontera clara:

- Marca educativa: `Spotybank`.
- Namespace Java base: `io.spotybank.services`.
- Dominio educativo: `api.spotybank.io`.
- Prefijos de datos educativos: `SB`.
- Credenciales de ejemplo: placeholders sin valor real.

Esta decision tiene dos beneficios. Primero, reduce el riesgo de exposicion de informacion sensible. Segundo, le da coherencia narrativa al caso: el lector estudia un producto educativo, no una copia de un sistema corporativo.

## 03.3 Limpieza de paquetes y namespaces

Los paquetes Java y namespaces tienen un peso mayor del que parece. No solo organizan codigo; tambien revelan historia, ownership y contexto empresarial. En Spotybank, mover paquetes hacia `io.spotybank.services` ayuda a crear una base didactica neutral.

Una migracion de paquetes debe cuidar:

- Declaraciones `package` en Java.
- Imports internos.
- Rutas fisicas de carpetas.
- Referencias en tests.
- Configuraciones que dependan de nombres de clase.
- Documentacion generada.

El objetivo no es hacer un rename agresivo sin control, sino consolidar una identidad limpia que pueda compilar y enseñarse.

## 03.4 Sustitucion de secretos y credenciales

Una credencial en un repositorio debe considerarse comprometida aunque parezca antigua, vacia o de prueba. Para un caso educativo, no alcanza con borrar valores evidentes; hay que reemplazarlos por ejemplos que enseñen la intencion sin exponer material real.

Ejemplos de placeholders educativos:

- `spoty_user`
- `spoty_secure_pwd`
- `spoty_example_token`
- `spoty_example_secret`

La regla editorial es simple: el lector debe entender que ahi va una credencial, pero no debe recibir una credencial real.

## 03.5 Dominios, endpoints y ambientes

Los dominios internos tambien son informacion sensible. Pueden revelar proveedores, arquitectura, redes, herramientas, regiones o convenciones corporativas. Spotybank reemplaza endpoints antiguos por `api.spotybank.io` o rutas de ejemplo.

En un libro o fasciculo tecnico, los endpoints deben cumplir tres condiciones:

- Ser claramente ficticios o educativos.
- Mantener semantica suficiente para explicar la arquitectura.
- No permitir inferir infraestructura real.

## 03.6 Tablas y prefijos de base de datos

El rebranding tambien puede alcanzar nombres de tablas, colecciones o prefijos. En un caso bancario, los nombres de datos revelan dominios funcionales y convenciones internas. La sustitucion hacia prefijos como `SB_` permite conservar sentido educativo sin filtrar nomenclatura previa.

La transformacion debe documentarse porque puede afectar:

- Scripts SQL.
- Mapeos ORM.
- Tests de integracion.
- Datos de prueba.
- Consultas embebidas.

## 03.7 Archivos comprimidos y artefactos no inspeccionados

Los `.zip` originales son un riesgo especial. Aunque el codigo visible este saneado, un comprimido puede conservar historial, binarios, configuraciones, certificados, credenciales o nombres reales. Por eso la politica de Spotybank es excluirlos del material publicable o regenerarlos desde una fuente limpia.

No conviene publicar archivos comprimidos heredados salvo que hayan pasado por una revision explicita y repetible.

## 03.8 Scripts historicos de refactor

Los scripts usados para migrar identidad pueden contener patrones de busqueda con nombres antiguos. Eso no significa que el producto educativo final este contaminado, pero si significa que esos scripts deben tratarse como herramientas internas de migracion.

Antes de publicar un paquete externo, hay dos opciones:

- Excluir scripts historicos.
- Reescribirlos como scripts genericos sin patrones sensibles.

Para uso local, conservarlos puede ser util como trazabilidad. Para distribucion, conviene limpiar.

## 03.9 Checklist minimo de publicacion segura

Antes de compartir Spotybank fuera del entorno local:

- Verificar que no haya tokens, passwords ni usuarios reales.
- Verificar que no haya dominios corporativos ni correos personales.
- Verificar paquetes y namespaces.
- Verificar rutas de archivos y nombres de carpetas.
- Excluir o sanear `.zip` originales.
- Excluir scripts historicos con patrones sensibles.
- Ejecutar escaneo de secretos.
- Validar enlaces y navegacion local.
- Registrar excepciones y decisiones pendientes.

## 03.10 Uso de IA durante el saneamiento

La IA puede ayudar a buscar patrones, proponer reemplazos, generar documentacion y mantener tableros de estado. Sin embargo, el saneamiento requiere disciplina: no se debe pegar secretos en prompts, no se deben exponer salidas completas con tokens y no se debe asumir que un escaneo unico es suficiente.

La IA debe trabajar con valores ya enmascarados o con patrones de busqueda, no con secretos vivos.

## Ejercicio practico

Tomar un microservicio de Spotybank y revisar:

1. Nombre del artefacto.
2. Paquete Java.
3. Properties.
4. Tests.
5. README generado.

Luego responder:

- Que referencias aun parecen demasiado especificas?
- Que valores deben ser placeholders?
- Que archivos no deberian publicarse?
- Que evidencia permite afirmar que el servicio esta saneado?

## Resumen del capitulo

- La anonimizacion es una condicion previa para publicar material educativo.
- Rebranding seguro implica identidad, paquetes, dominios, datos y documentacion.
- Los placeholders deben enseñar sin exponer.
- Los comprimidos y scripts historicos requieren tratamiento especial.
- La IA ayuda, pero el control de seguridad debe ser deliberado.

## Preguntas de revision

1. Por que cambiar solo el nombre visible del proyecto no alcanza?
2. Que diferencia hay entre placeholder y secreto de prueba?
3. Por que los archivos comprimidos son un riesgo en un caso educativo?
4. Que deberia quedar documentado despues de una anonimizacion?

## Referencias del capitulo

- `Documentacion/spotybank/refactor-identidad.md`
- `Documentacion/spotybank/servicios-canonicos.md`
- `Documentacion/arquitectura/seguridad-y-riesgos.md`
- `Documentacion/statusTasks.md`

