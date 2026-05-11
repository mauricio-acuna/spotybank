# Capitulo 10 - IA como Acelerador de Modernizacion

## Objetivos del capitulo

Al finalizar este capitulo, el lector podra:

- Usar IA como apoyo metodico para diagnosticar un sistema de microservicios.
- Diferenciar asistencia, inferencia y decision tecnica validada.
- Generar documentacion, mapas, backlog y planes de mejora con trazabilidad.
- Identificar riesgos de privacidad, seguridad y confianza en el uso de IA.
- Disenar un flujo de trabajo donde IA acelera sin reemplazar criterio profesional.

## 10.1 La IA no moderniza sola

Spotybank no propone una fantasia donde una IA toma un sistema heredado y lo convierte magicamente en una plataforma moderna. La propuesta es mas sobria y mas util: la IA puede acelerar lectura, clasificacion, documentacion, comparacion, generacion de hipotesis y preparacion de decisiones.

La modernizacion sigue siendo una responsabilidad humana. Alguien debe decidir que riesgo es aceptable, que contrato se mantiene, que dependencia se reemplaza, que modulo se reescribe y que comportamiento bancario no puede romperse.

La IA entra como una herramienta de multiplicacion: lee rapido, organiza volumen, encuentra patrones, propone caminos y ayuda a escribir evidencia. Pero el equipo conserva la responsabilidad tecnica, funcional y etica.

## 10.2 Un nuevo modo de leer sistemas heredados

En un sistema con muchos microservicios, la primera dificultad es orientarse. Hay paquetes, properties, rutas, endpoints, colas, integraciones, Dockerfiles, manifiestos, tests, dependencias y convenciones historicas. Leer todo linealmente puede llevar semanas.

La IA permite un flujo distinto:

1. Buscar evidencia local.
2. Resumir por servicio.
3. Detectar patrones repetidos.
4. Agrupar por funcionalidad.
5. Separar hechos de inferencias.
6. Crear preguntas para owners.
7. Convertir hallazgos en backlog.

El valor no esta en que la IA "adivine" la arquitectura. El valor esta en que ayude a construir un mapa inicial que despues se revisa con codigo, logs, owners y ambientes.

## 10.3 La regla de evidencia

Toda afirmacion tecnica en Spotybank debe entrar en una de estas categorias:

| Categoria | Definicion | Ejemplo |
|---|---|---|
| Evidencia | Observado en archivos del workspace | Un `pom.xml` declara una dependencia |
| Inferencia | Conclusion razonable a partir de evidencia | El servicio parece actuar como adapter |
| Decision pendiente | Requiere validacion externa | Confirmar owner o SLA |
| Recomendacion | Propuesta de mejora | Migrar secretos a Vault |

Esta regla es crucial para usar IA con responsabilidad. El lector debe poder distinguir entre "lo vimos", "lo deducimos", "hay que confirmarlo" y "proponemos hacerlo".

## 10.4 Documentacion asistida

Uno de los primeros usos de IA en Spotybank es generar documentacion inicial. Esto no reemplaza documentacion oficial, pero crea una base navegable.

Resultados posibles:

- README por microservicio.
- Documentos por funcionalidad.
- Matriz de relaciones.
- Catalogo de endpoints.
- Catalogo de colas.
- Matriz de despliegue.
- Backlog tecnico.
- Runbooks iniciales.
- Preguntas para validacion externa.

La documentacion asistida debe tener limites claros:

- No copiar secretos.
- No publicar nombres reales.
- No afirmar contratos no validados.
- No mezclar entidades reales con el caso educativo.
- No ocultar incertidumbre.

En Spotybank, el documento no termina cuando se genera. Empieza ahi su ciclo de revision.

## 10.5 IA para mapas de arquitectura

La IA puede ayudar a construir mapas iniciales de arquitectura a partir de pistas:

- Nombres de modulos.
- Paquetes Java.
- Dependencias Maven.
- Endpoints REST.
- Rutas Camel.
- Configuracion de mensajeria.
- Manifiestos de despliegue.
- Tests existentes.

El mapa resultante debe tratarse como hipotesis. Si un servicio contiene rutas de notificacion, no significa automaticamente que sea owner del dominio de notificaciones. Puede ser adapter, fachada o modulo historico. Por eso la obra insiste en validar.

## 10.6 IA para detectar deuda tecnica

La deuda tecnica suele estar dispersa. La IA puede ayudar a reunirla y clasificarla:

| Tipo de deuda | Indicio posible | Accion sugerida |
|---|---|---|
| Versiones legacy | Java antiguo, parent heredado | Plan de upgrade incremental |
| Seguridad | Secretos en configuracion | Rotacion y Vault |
| Observabilidad | Logs no estructurados | Correlation ID y trazas |
| Mensajeria | DLQ no documentada | Politica de reintentos y reproceso |
| Testing | Pocos tests o tests acoplados | Piramide de pruebas |
| Despliegue | Sin probes ni resources | Contrato cloud native |

El peligro es convertir la deuda en una lista infinita. El trabajo profesional consiste en priorizar por riesgo, impacto y capacidad de ejecucion.

## 10.7 IA para generar backlog accionable

Un buen backlog no dice solo "mejorar seguridad". Dice que se hara, por que, con que evidencia y como se validara.

Formato recomendado:

```text
Titulo:
Contexto:
Riesgo:
Alcance:
Criterios de aceptacion:
Evidencia de cierre:
Dependencias:
Prioridad:
```

Ejemplo educativo:

```text
Titulo: Documentar DLQ y reproceso para flujo de notificaciones
Contexto: El catalogo de mensajeria identifica productores y consumidores, pero falta owner operativo de DLQ.
Riesgo: Mensajes fallidos pueden acumularse sin alerta ni proceso de recuperacion.
Alcance: Definir DLQ, owner, alerta, runbook y prueba de reproceso con datos sinteticos.
Criterios de aceptacion: Existe runbook, metrica, alerta y prueba documentada.
Evidencia de cierre: Captura de prueba en ambiente lab y actualizacion documental.
Prioridad: P1.
```

La IA puede producir borradores de tickets. El equipo decide prioridad real.

## 10.8 IA para pruebas y calidad

La IA puede ayudar a proponer pruebas, pero no debe inventar comportamiento bancario sin validacion.

Usos adecuados:

- Crear listas de casos borde.
- Proponer pruebas unitarias.
- Sugerir tests de contrato.
- Generar datos sinteticos.
- Identificar falta de idempotencia.
- Revisar consistencia de errores.
- Proponer escenarios de carga.

Usos riesgosos:

- Crear reglas de negocio sin owner.
- Asumir codigos de error no documentados.
- Generar datos parecidos a clientes reales.
- Confirmar seguridad solo por lectura estatica.

En Spotybank, la IA ayuda a preguntar mejor. La respuesta final viene de evidencia.

## 10.9 IA y refactorizacion

La refactorizacion asistida por IA debe ser incremental. Un sistema bancario no se mejora con cambios masivos sin control. La IA puede proponer transformaciones, pero el equipo debe reducir blast radius.

Secuencia recomendada:

1. Crear inventario.
2. Agregar pruebas de caracterizacion.
3. Definir comportamiento esperado.
4. Refactorizar una pieza pequena.
5. Ejecutar pruebas.
6. Revisar diff.
7. Documentar decision.
8. Repetir.

La IA es especialmente util para encontrar duplicacion, sugerir nombres, aislar responsabilidades y preparar pruebas. Pero debe evitarse el "refactor por entusiasmo", donde se cambia mucho y se entiende poco.

## 10.10 IA en seguridad

El uso de IA en seguridad tiene dos caras. Puede acelerar deteccion de riesgos, pero tambien puede exponer informacion sensible si se usa mal.

Reglas para Spotybank:

- No enviar secretos a herramientas externas.
- No enviar datos reales de clientes.
- No enviar contratos internos sin permiso.
- Sanear logs antes de analizarlos.
- Trabajar con placeholders.
- Registrar supuestos.
- Validar hallazgos criticos con herramientas y personas.

La IA puede explicar por que un secreto versionado es peligroso, pero no debe convertirse en otro lugar donde el secreto queda copiado.

## 10.11 IA para escritura tecnica

Una obra como Spotybank se beneficia mucho de IA en escritura:

- Convertir notas en secciones.
- Normalizar tono.
- Crear resumanes.
- Proponer ejercicios.
- Generar tablas comparativas.
- Reordenar capitulos.
- Revisar coherencia entre partes.
- Adaptar el material por perfil.

La escritura tecnica buena no es decorar texto. Es hacer que el conocimiento sea navegable. La IA ayuda cuando ordena, reduce ambiguedad y mantiene consistencia.

## 10.12 Flujo de trabajo recomendado

Un flujo maduro de IA para Spotybank podria ser:

| Paso | Actividad | Salida |
|---|---|---|
| 1 | Inspeccion local | Lista de evidencias |
| 2 | Sintesis asistida | README, mapas y tablas |
| 3 | Revision humana | Correcciones y limites |
| 4 | Backlog | Tickets priorizados |
| 5 | Experimento | Prueba, refactor o laboratorio |
| 6 | Validacion | Evidencia de cierre |
| 7 | Publicacion | Documento actualizado |

El ciclo no termina con generar contenido. Termina cuando hay revision y evidencia.

## 10.13 Antipatrones

Antipatrones frecuentes:

- Pedir a la IA una arquitectura objetivo sin mostrar restricciones.
- Confiar en nombres de archivo como si fueran verdad funcional.
- Publicar texto generado sin revision.
- Mezclar datos reales con material educativo.
- Reescribir codigo sin pruebas.
- Crear backlog sin owner.
- Resolver conflictos Git a ciegas.
- Confundir fluidez textual con certeza tecnica.

Spotybank debe ensenar estos riesgos porque son parte del trabajo real.

## 10.14 Ejercicio practico

Tomar un microservicio documentado y pedir asistencia para generar:

- Resumen funcional.
- Riesgos tecnicos.
- Preguntas para owner.
- Tres tickets de mejora.
- Dos pruebas recomendadas.
- Un diagrama textual simple.

Luego clasificar cada resultado como evidencia, inferencia, decision pendiente o recomendacion.

La entrega se evalua por trazabilidad, no por cantidad de texto.

## Resumen del capitulo

- La IA acelera lectura, organizacion, documentacion y backlog.
- No reemplaza criterio tecnico ni validacion humana.
- Toda afirmacion debe distinguir evidencia, inferencia, decision pendiente y recomendacion.
- La IA es poderosa para escribir y sintetizar, pero riesgosa si se usa con secretos o datos reales.
- La modernizacion asistida debe ser incremental, trazable y verificable.

## Preguntas de revision

1. Por que la IA no debe decidir sola una arquitectura objetivo?
2. Que diferencia hay entre evidencia e inferencia?
3. Que riesgos aparecen al usar IA con logs reales?
4. Como convertiras un hallazgo asistido por IA en un ticket accionable?
5. Que significa revisar un texto generado en contexto tecnico?

## Referencias del capitulo

- `Documentacion/statusTasks.md`
- `Documentacion/arquitectura/matriz-relaciones.md`
- `Documentacion/arquitectura/backlog-tecnico.md`
- `Documentacion/validacion/registro-bloqueos-externos.md`
- `Documentacion/ObraLiteraria/INSTRUCCIONES_DESCARGA_Y_APORTES.md`
