# Status de Obra Literaria Tecnica

Fecha de control: 2026-05-12

Este tablero controla solo la obra editorial `Spotybank: guia IA de modernizacion de microservicios bancarios`. No reemplaza `Documentacion/statusTasks.md`; lo complementa con el detalle de capitulos, fasciculos, revision y publicacion.

## Resumen de avance

- Avance global estimado: 99%.
- Estado editorial: CUERPO PRINCIPAL COMPLETO EN BORRADOR.
- Estrategia recomendada: publicar primero por fasciculos y consolidar luego como libro unico.
- Versionado GitHub: ACTIVO COMO REPO INDEPENDIENTE DE OBRA LITERARIA.
- Base documental disponible: suficiente para avanzar capitulos tecnicos basados en inspeccion estatica, fuentes locales y referencias oficiales actuales.
- Dependencias externas: owners, SLAs, contratos vigentes, metricas reales, trazas y ambientes.

## Estados usados

- DONE: creado y utilizable como borrador.
- IN_PROGRESS: en redaccion o ampliacion.
- PENDING: pendiente de redactar, crear o completar.
- NEEDS_REVIEW: requiere revision tecnica/editorial.
- BLOCKED: requiere informacion externa.

## Material base disponible

| Fuente | Estado | Uso en la obra |
|---|---|---|
| Documentacion de microservicios | DONE | Inventario, ejemplos y ejercicios por servicio |
| Vision general de arquitectura | DONE | Capitulo 2 y marco del caso |
| Refactor de identidad Spotybank | DONE | Capitulo 3 |
| Matriz de relaciones | DONE | Capitulos 2, 4 y 5 |
| Seguridad y riesgos | DONE | Capitulos 3 y 7 |
| Roadmap de mejoras | DONE | Capitulos 6, 8, 9 y 12 |
| Bloqueos externos | DONE | Metodologia y advertencias |
| Evidencia directa desde fuentes | DONE | Inventario real de POMs, Java, configuracion, mensajeria, Camel, SOAP, pruebas y despliegue |
| Referencias actuales 2026 | DONE | Modernizacion Spring, Camel, Kubernetes, OpenTelemetry, OWASP, SLSA, Karate y Testcontainers |
| Mapa de modernizacion desde fuentes | DONE | Secuencia de oleadas ejecutables sin requerir decisiones externas |

## Versionado GitHub

| Item | Estado | Resultado actual | Pendiente |
|---|---|---|---|
| Repo Git independiente de la obra | DONE | Directorio versionado: `Documentacion/ObraLiteraria` | Mantener fuera del repo principal |
| Repo remoto | DONE | `https://github.com/mauricio-acuna/spotybank.git` con rama `main` publicada | Mantener credenciales GitHub vigentes |
| Publicacion manual segura | DONE | `Publicar_ObraLiteraria_Spotybank.ps1` creado con escaneo previo y manejo de commits locales pendientes de push | Ejecutar despues de cada bloque de escritura |
| Publicacion automatica 3 veces al dia | DONE | Tarea Windows `Spotybank-ObraLiteraria-Publicar` creada para 09:00, 14:00 y 19:00 | Revisar logs/credenciales si un push falla |
| Exclusiones de material no publicable | DONE | `.gitignore` creado para logs, zips, llaves y temporales | Mantener escaneo antes de publicar |
| Descarga y aportes desde otro ordenador | DONE | `INSTRUCCIONES_DESCARGA_Y_APORTES.md` creado | Mantener actualizado si cambia el flujo Git |

## Estructura editorial

| Bloque | Estado | Resultado actual | Pendiente |
|---|---|---|---|
| README editorial | DONE | `README.md` creado | Ajustar tono final |
| Ficha de proyecto | DONE | `FICHA_PROYECTO.md` creada | Definir autor/editorial/licencia |
| Decisiones editoriales | DONE | `DECISIONES_EDITORIALES.md` creado | Revisar con stakeholders |
| Indice provisional | DONE | `INDICE_PROVISIONAL.md` creado | Ajustar cuando avance la redaccion |
| Plan por fasciculos | DONE | `PLAN_FASCICULOS_PERFILES.md` creado | Definir orden de publicacion real |
| Fasciculos ejecutables | DONE | `FASCICULOS_EJECUTABLES_POR_PERFIL.md` creado con practicas, entregables y criterios por perfil | Revisar con docentes o coordinadores |
| Mapa de evidencias | DONE | `MAPA_EVIDENCIAS_SPOTYBANK.md` creado | Mantener actualizado por capitulo |
| Evidencia desde codigo/configuracion | DONE | `EVIDENCIA_FUENTES_MICROSERVICIOS_2026-05-11.md` creado | Ampliar si se agregan nuevos microservicios |
| Referencias de modernizacion | DONE | `REFERENCIAS_MODERNIZACION_2026.md` creado | Actualizar antes de publicacion final |
| Mapa de modernizacion desde fuentes | DONE | `MAPA_MODERNIZACION_DESDE_FUENTES.md` creado y convertido en fasciculos ejecutables | Mantener alineado con cambios futuros de la obra |
| Ejercicios y laboratorios | DONE | `APE_F_Ejercicios_Laboratorios` creado | Revisar con docentes o facilitadores |
| Planes de clase | DONE | `PLANES_CLASE.md` creado | Ajustar a calendario real |
| Figuras y tablas editoriales | DONE | `FIGURAS_MERMAID_INICIALES.md`, `REGISTRO_FIGURAS_TABLAS.md` y `TABLAS_EJECUTIVAS_MODERNIZACION.md` actualizados | Exportar version grafica final si se exige maquetacion |
| Checklist de revision | DONE | `CHECKLIST_REVISION_TECNICA_EDITORIAL.md` creado | Ejecutar revision real por perfil |
| Revision interna asistida | DONE | `REVISION_INTERNA_IA_2026-05-11.md` creado | No reemplaza revision humana |
| Matriz de revision por perfil | DONE | `MATRIZ_REVISION_POR_PERFIL.md` creado | Asignar responsables reales |
| Propuesta de licencia | IN_PROGRESS | `PROPUESTA_LICENCIA_Y_USO.md` creado | Confirmar licencia final |
| Plan de version publicable | DONE | `PLAN_VERSION_PUBLICABLE.md` creado | Ejecutar release/tag cuando corresponda |
| Release notes v0.1 | DONE | `RELEASE_NOTES_v0.1-publicable_DRAFT.md` creado | Revisar antes de tag |
| Checklist tag/release | DONE | `CHECKLIST_TAG_RELEASE.md` creado | Ejecutar cuando licencia/revision esten listas |

## Capitulos

| Capitulo | Estado | Archivo | Pendiente |
|---|---|---|---|
| 1 - Introduccion | DONE | `04_CUERPO_PRINCIPAL/CAP_01_Introduccion/CAP_01_BORRADOR.md` | Revision editorial y ejemplos visuales |
| 2 - Inventario tecnico inicial | DONE | `04_CUERPO_PRINCIPAL/CAP_02_Marco_Teorico/CAP_02_BORRADOR.md` | Agregar figura de mapa de dominios |
| 3 - Anonimizacion y rebranding seguro | DONE | `04_CUERPO_PRINCIPAL/CAP_03_Metodologia/CAP_03_BORRADOR.md` | Agregar checklist visual y caso practico |
| 4 - Documentacion viva de microservicios | DONE | `04_CUERPO_PRINCIPAL/CAP_04_Desarrollo/CAP_04_BORRADOR.md` | Agregar figura de flujo documental |
| 5 - Dominios bancarios y fronteras | DONE | `04_CUERPO_PRINCIPAL/CAP_05_Resultados/CAP_05_BORRADOR.md` | Agregar diagrama de bounded contexts |
| 6 - Modernizacion de backend | DONE | `04_CUERPO_PRINCIPAL/CAP_06_Discusion/CAP_06_BORRADOR.md` | Agregar matriz de oleadas |
| 7 - Seguridad y DevSecOps | DONE | `04_CUERPO_PRINCIPAL/CAP_07_Conclusiones/CAP_07_BORRADOR.md` | Agregar checklist DevSecOps |
| 8 - Despliegue cloud native | DONE | `04_CUERPO_PRINCIPAL/CAP_08_Despliegue_Cloud_Native/CAP_08_BORRADOR.md` | Agregar laboratorio OpenShift/Kind/Minikube |
| 9 - Performance, escalamiento y resiliencia | DONE | `04_CUERPO_PRINCIPAL/CAP_09_Performance_Escalamiento_Resiliencia/CAP_09_BORRADOR.md` | Agregar plantilla de prueba de carga |
| 10 - IA como acelerador | DONE | `04_CUERPO_PRINCIPAL/CAP_10_IA_Acelerador/CAP_10_BORRADOR.md` | Agregar plantilla de prompt seguro |
| 11 - Spotybank como curso | DONE | `04_CUERPO_PRINCIPAL/CAP_11_Spotybank_Como_Curso/CAP_11_BORRADOR.md` | Crear planes de clase por duracion |
| 12 - Roadmap de evolucion | DONE | `04_CUERPO_PRINCIPAL/CAP_12_Roadmap_Evolucion/CAP_12_BORRADOR.md` | Convertir roadmap en tabla ejecutiva |

## Fasciculos

| Fasciculo | Estado | Pendiente |
|---|---|---|
| 0 - Presentacion del caso | DONE | Fasciculo ejecutable creado; pendiente revision real |
| 1 - Inventario del sistema | DONE | Fasciculo ejecutable creado; pendiente revision real |
| 2 - Arquitectura | DONE | Fasciculo ejecutable creado; pendiente revision real |
| 3 - Seguridad y DevSecOps | DONE | Fasciculo ejecutable creado; pendiente revision real |
| 4 - Modernizacion Java/Spring/Maven | DONE | Fasciculo ejecutable creado; pendiente revision real |
| 5 - QA y testing | DONE | Fasciculo ejecutable creado; pendiente revision real |
| 6 - Nube y observabilidad | DONE | Fasciculo ejecutable creado; pendiente revision real |
| 7 - Performance | DONE | Fasciculo ejecutable creado; pendiente revision real |
| 8 - Diseno curricular | DONE | Fasciculo ejecutable creado; pendiente revision real |

## Pendientes priorizados

| Prioridad | Tarea | Estado | Motivo |
|---|---|---|---|
| P0 | Mantener este status actualizado | DONE | Controla avance real de la obra |
| P0 | Completar capitulos 1 a 3 | DONE | Base narrativa y tecnica inicial |
| P1 | Redactar capitulo 4 | DONE | Explica como usar la documentacion viva |
| P1 | Redactar capitulo 5 | DONE | Define dominios y `spotybank-core-ledger` |
| P1 | Redactar capitulo 6 | DONE | Modernizacion de backend por oleadas |
| P1 | Redactar capitulo 7 | DONE | Seguridad y DevSecOps |
| P1 | Crear carpetas para capitulos 8 a 12 | DONE | Carpetas y notas de investigacion creadas |
| P1 | Redactar capitulo 8 | DONE | Despliegue cloud native |
| P1 | Redactar capitulo 9 | DONE | Performance, escalamiento y resiliencia |
| P1 | Redactar capitulo 10 | DONE | IA como acelerador de modernizacion |
| P1 | Redactar capitulo 11 | DONE | Spotybank como curso y producto educativo |
| P1 | Redactar capitulo 12 | DONE | Roadmap de evolucion |
| P1 | Crear ejercicios por capitulo | DONE | Ejercicios 1 a 12 creados en apendice F |
| P1 | Crear laboratorios por perfil | DONE | Laboratorios backend, arquitectura, seguridad, DevOps/SRE, QA, gestion y docencia creados |
| P1 | Crear rubricas por perfil | DONE | Rubricas general, perfil y proyecto final creadas |
| P1 | Crear planes de clase | DONE | Planes de 12, 24, 40 y 80 horas creados |
| P1 | Leer fuentes locales y documentar evidencia tecnica | DONE | Se relevaron POMs, Java, properties, YAML, Dockerfiles, JMS, Camel/SOAP, Swagger/Springfox, Karate y despliegue |
| P1 | Buscar referencias actuales para propuestas nuevas | DONE | Se agrego bibliografia oficial/primaria 2026 para modernizacion |
| P1 | Crear mapa de modernizacion basado en evidencia | DONE | Oleadas por baseline, pruebas, seguridad, observabilidad, runtime, cloud native, performance y supply chain |
| P1 | Crear fasciculos ejecutables por perfil | DONE | Fasciculos 0 a 8 creados con practicas, entregables, criterios de evaluacion y backlog por fasciculo |
| P1 | Crear figuras y tablas | DONE | Figuras Mermaid 1 a 12, registro de figuras/tablas y tablas ejecutivas creadas; queda exportacion grafica si se define formato |
| P1 | Preparar revision interna y release notes | DONE | Revision interna, matriz por perfil, release notes y checklist de tag creados |
| P2 | Revision tecnica por perfil | PENDING | Checklist creado; falta revision real por backend, arquitectura, seguridad, DevOps y QA |
| P2 | Revision editorial | PENDING | Checklist creado; falta lectura editorial |
| P2 | Definir licencia y formato de publicacion | IN_PROGRESS | Propuesta de licencia y plan publicable creados; falta decision final |
| P1 | Versionar solo la obra literaria en GitHub | DONE | Repo local independiente, push inicial y tarea automatica creados |
| P1 | Documentar descarga y aportes desde otro ordenador | DONE | Instrucciones creadas para clonar, aportar, publicar y resolver conflictos |

## Bloqueos

- No hay owners reales confirmados.
- No hay SLAs, SLOs ni metricas reales.
- No hay contratos vigentes validados contra ambiente.
- No hay trazas reales saneadas.
- `spotybank-core-ledger` aun no existe como modulo implementado.
- La publicacion automatica depende de que las credenciales GitHub locales sigan funcionando.

## Proximo bloque recomendado

1. Asignar responsables reales para revision por perfil.
2. Ejecutar revision editorial.
3. Confirmar licencia final.
4. Decidir si se publica v0.1 con figuras Mermaid o con figuras exportadas.
5. Crear tag/release `v0.1-publicable`.

## Historial

| Fecha | Cambio |
|---|---|
| 2026-05-11 | Creado tablero especifico de obra literaria. |
| 2026-05-11 | Marcados como borradores completos los capitulos 1, 2 y 3. |
| 2026-05-11 | Marcados como borradores completos los capitulos 4 y 5. |
| 2026-05-11 | Marcados como borradores completos los capitulos 6 y 7. |
| 2026-05-11 | Preparado versionado GitHub independiente para publicar solo la obra literaria Spotybank. |
| 2026-05-11 | Publicado commit inicial en `https://github.com/mauricio-acuna/spotybank.git` y creada tarea programada 09:00, 14:00 y 19:00. |
| 2026-05-11 | Creado instructivo para descargar la obra y continuar aportes desde otro ordenador. |
| 2026-05-11 | Creadas carpetas de capitulos 8 a 12 y redactados capitulos 8 y 9 en borrador completo. |
| 2026-05-11 | Redactados capitulos 10, 11 y 12 en borrador completo; cuerpo principal completo de la obra. |
| 2026-05-11 | Creados ejercicios por capitulo, laboratorios por perfil, rubricas, planes de clase y figuras Mermaid iniciales. |
| 2026-05-11 | Creados propuesta de licencia, checklist de revision y plan de version publicable. |
| 2026-05-11 | Creados revision interna asistida, matriz de revision por perfil, release notes borrador y checklist de tag/release. |
| 2026-05-11 | Agregada evidencia directa desde fuentes de microservicios, referencias actuales de modernizacion y mapa de modernizacion por oleadas. |
| 2026-05-11 | Ajustado el publicador para empujar commits locales pendientes aunque no existan cambios nuevos en working tree. |
| 2026-05-12 | Creados fasciculos ejecutables 0 a 8, figuras Mermaid para capitulos 1 a 7 y tablas ejecutivas de modernizacion. |
