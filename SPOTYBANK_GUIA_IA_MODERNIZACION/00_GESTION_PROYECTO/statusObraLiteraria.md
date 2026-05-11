# Status de Obra Literaria Tecnica

Fecha de control: 2026-05-11

Este tablero controla solo la obra editorial `Spotybank: guia IA de modernizacion de microservicios bancarios`. No reemplaza `Documentacion/statusTasks.md`; lo complementa con el detalle de capitulos, fasciculos, revision y publicacion.

## Resumen de avance

- Avance global estimado: 67%.
- Estado editorial: REDACCION INICIAL.
- Estrategia recomendada: publicar primero por fasciculos y consolidar luego como libro unico.
- Versionado GitHub: ACTIVO COMO REPO INDEPENDIENTE DE OBRA LITERARIA.
- Base documental disponible: suficiente para avanzar capitulos tecnicos basados en inspeccion estatica.
- Dependencias externas: owners, SLAs, contratos vigentes, metricas reales, trazas y ambientes.

## Estados usados

- DONE: creado y utilizable como borrador.
- IN_PROGRESS: en redaccion o ampliacion.
- PENDING: pendiente de redactar.
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

## Versionado GitHub

| Item | Estado | Resultado actual | Pendiente |
|---|---|---|---|
| Repo Git independiente de la obra | DONE | Directorio versionado: `Documentacion/ObraLiteraria` | Mantener fuera del repo principal |
| Repo remoto | DONE | `https://github.com/mauricio-acuna/spotybank.git` con rama `main` publicada | Mantener credenciales GitHub vigentes |
| Publicacion manual segura | DONE | `Publicar_ObraLiteraria_Spotybank.ps1` creado con escaneo previo | Ejecutar despues de cada bloque de escritura |
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
| Mapa de evidencias | DONE | `MAPA_EVIDENCIAS_SPOTYBANK.md` creado | Mantener actualizado por capitulo |

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
| 10 - IA como acelerador | PENDING | `04_CUERPO_PRINCIPAL/CAP_10_IA_Acelerador/NOTAS_INVESTIGACION.md` | Redactar |
| 11 - Spotybank como curso | PENDING | `04_CUERPO_PRINCIPAL/CAP_11_Spotybank_Como_Curso/NOTAS_INVESTIGACION.md` | Redactar |
| 12 - Roadmap de evolucion | PENDING | `04_CUERPO_PRINCIPAL/CAP_12_Roadmap_Evolucion/NOTAS_INVESTIGACION.md` | Redactar |

## Fasciculos

| Fasciculo | Estado | Pendiente |
|---|---|---|
| 0 - Presentacion del caso | IN_PROGRESS | Derivar desde capitulos 1 y 3 |
| 1 - Inventario del sistema | IN_PROGRESS | Derivar desde capitulo 2 |
| 2 - Arquitectura | IN_PROGRESS | Base textual lista desde capitulos 4 y 5; faltan ejercicios y figuras |
| 3 - Seguridad y DevSecOps | IN_PROGRESS | Derivar desde capitulo 3 y seguridad |
| 4 - Modernizacion Java/Spring/Maven | IN_PROGRESS | Base textual lista desde capitulo 6; faltan ejercicios y figuras |
| 5 - QA y testing | PENDING | Requiere ejercicios |
| 6 - Nube y observabilidad | IN_PROGRESS | Base textual lista desde capitulo 8; faltan ejercicios y figuras |
| 7 - Performance | IN_PROGRESS | Base textual lista desde capitulo 9; faltan ejercicios y figuras |
| 8 - Diseno curricular | PENDING | Requiere capitulo 11 |

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
| P1 | Crear ejercicios por capitulo | PENDING | Necesario para uso academico |
| P1 | Crear figuras y tablas | PENDING | Necesario para lectura didactica |
| P2 | Revision tecnica por perfil | PENDING | Backend, arquitectura, seguridad, DevOps, QA |
| P2 | Revision editorial | PENDING | Coherencia, estilo y publicacion |
| P2 | Definir licencia y formato de publicacion | PENDING | Uso academico/empresa |
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

1. Redactar capitulo 10: IA como acelerador de modernizacion.
2. Redactar capitulo 11: Spotybank como curso.
3. Redactar capitulo 12: roadmap de evolucion.
4. Agregar ejercicios practicos a capitulos 1 a 9.
5. Crear plantillas de laboratorio para nube y performance.

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
