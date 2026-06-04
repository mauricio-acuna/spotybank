# Status de Obra Literaria Tecnica

Fecha de control: 2026-06-03

Este tablero controla la obra editorial `Spotybank: guia IA de modernizacion de microservicios bancarios`.

## Resumen de cierre

- Avance global estimado: 100% para `v0.1-publicable` y 100% para tag editorial interno `v0.2-editorial`.
- Estado editorial: CAPITULOS 1 A 12 EN CERRADO_TECNICO; VALIDACION INTEGRAL Y CIERRE DE SALIDA COMPLETADOS.
- Autor: Mauricio Acuña, Ingeniero en Informatica.
- Version base publicada: `v0.1-publicable`.
- Version editorial publicada: `v0.2-editorial`.
- Estrategia de publicacion: libro unico en Markdown y fasciculos por perfil; exportacion PDF/HTML disponible como siguiente formato.
- Licencia textual: CC BY-NC-SA 4.0.
- Licencia de ejemplos de codigo propios: Apache License 2.0.
- Repo Git independiente de la obra: `Documentacion/ObraLiteraria`.
- Repo remoto registrado: `https://github.com/mauricio-acuna/spotybank.git`.
- Estado Git verificado: `main` sincronizada con `origin/main` para cierre editorial interno al 2026-06-03.
- Ciclo actual: salida editorial interna cerrada; PDF/HTML, release con assets, revision externa ampliada y venta/curso quedan como etapas posteriores.

## Estados usados

- DONE: creado, revisado internamente y utilizable para `v0.1-publicable`.
- DONE_EDITORIAL: desarrollado con voz editorial ampliada para el ciclo posterior a `v0.1-publicable`.
- CERRADO_TECNICO: revisado capitulo por capitulo, reforzado tecnicamente y sin pendientes editoriales internos conocidos.
- NEXT: bloque inmediato recomendado para cerrar `v0.2-editorial`.
- LATER: mejora posterior, no bloqueante para `v0.1-publicable`.
- OUT_OF_SCOPE_V01: requiere informacion externa o trabajo productivo real; no forma parte de esta version.

## Hecho para v0.1-publicable

| Bloque | Estado | Evidencia |
|---|---|---|
| Identidad editorial | DONE | Portada, ficha, README, prefacio, contraportada y sobre el autor actualizados con Mauricio Acuña |
| Cuerpo principal | DONE | Capitulos 1 a 12 completos en `04_CUERPO_PRINCIPAL` |
| Material docente | DONE | Ejercicios, laboratorios, rubricas y planes de clase creados |
| Evidencia tecnica | DONE | Notas de fuentes, mapa de evidencias y mapa de modernizacion creados |
| Figuras y tablas | DONE | Figuras Mermaid iniciales, registro visual y tablas ejecutivas creadas |
| Revision tecnica/editorial | DONE | Checklist marcado `[ok]` y acta de cierre creada |
| Licencia | DONE | `LICENSE.md` y `10_PUBLICACION/PROPUESTA_LICENCIA_Y_USO.md` actualizados |
| Publicacion | DONE | Plan publicable, release notes, checklist de tag y plan de difusion actualizados |
| Seguridad de publicacion | DONE | Escaneo 2026-05-12 sin coincidencias y script de publicacion segura con control previo |

## Capitulos

| Capitulo | Estado | Archivo |
|---|---|---|
| 1 - Introduccion | CERRADO_TECNICO | `04_CUERPO_PRINCIPAL/CAP_01_Introduccion/CAP_01_BORRADOR.md` |
| 2 - Inventario tecnico inicial | CERRADO_TECNICO | `04_CUERPO_PRINCIPAL/CAP_02_Marco_Teorico/CAP_02_BORRADOR.md` |
| 3 - Anonimizacion y rebranding seguro | CERRADO_TECNICO | `04_CUERPO_PRINCIPAL/CAP_03_Metodologia/CAP_03_BORRADOR.md` |
| 4 - Documentacion viva de microservicios | CERRADO_TECNICO | `04_CUERPO_PRINCIPAL/CAP_04_Desarrollo/CAP_04_BORRADOR.md` |
| 5 - Dominios bancarios y fronteras | CERRADO_TECNICO | `04_CUERPO_PRINCIPAL/CAP_05_Resultados/CAP_05_BORRADOR.md` |
| 6 - Modernizacion de backend | CERRADO_TECNICO | `04_CUERPO_PRINCIPAL/CAP_06_Discusion/CAP_06_BORRADOR.md` |
| 7 - Seguridad y DevSecOps | CERRADO_TECNICO | `04_CUERPO_PRINCIPAL/CAP_07_Conclusiones/CAP_07_BORRADOR.md` |
| 8 - Despliegue cloud native | CERRADO_TECNICO | `04_CUERPO_PRINCIPAL/CAP_08_Despliegue_Cloud_Native/CAP_08_BORRADOR.md` |
| 9 - Performance, escalamiento y resiliencia | CERRADO_TECNICO | `04_CUERPO_PRINCIPAL/CAP_09_Performance_Escalamiento_Resiliencia/CAP_09_BORRADOR.md` |
| 10 - IA como acelerador | CERRADO_TECNICO | `04_CUERPO_PRINCIPAL/CAP_10_IA_Acelerador/CAP_10_BORRADOR.md` |
| 11 - Spotybank como curso | CERRADO_TECNICO | `04_CUERPO_PRINCIPAL/CAP_11_Spotybank_Como_Curso/CAP_11_BORRADOR.md` |
| 12 - Roadmap de evolucion | CERRADO_TECNICO | `04_CUERPO_PRINCIPAL/CAP_12_Roadmap_Evolucion/CAP_12_BORRADOR.md` |

## Fasciculos

| Fasciculo | Estado |
|---|---|
| 0 - Presentacion del caso | DONE |
| 1 - Inventario del sistema | DONE |
| 2 - Arquitectura | DONE |
| 3 - Seguridad y DevSecOps | DONE |
| 4 - Modernizacion Java/Spring/Maven | DONE |
| 5 - QA y testing | DONE |
| 6 - Nube y observabilidad | DONE |
| 7 - Performance | DONE |
| 8 - Diseno curricular | DONE |

## Seguimiento posterior no bloqueante

| Item | Estado | Motivo |
|---|---|---|
| Revision externa por especialistas | LATER | Recomendada antes de producto institucional, comercial o release con artefactos |
| ISBN | LATER | Solo requerido para edicion editorial o impresa formal |
| Maquetacion profesional | LATER | Markdown es el formato base de `v0.1-publicable` |
| Exportacion PDF/HTML | NEXT | Script preparado; Markdown unico local generable; falta Pandoc para HTML/PDF si se decide release formal |
| Portada grafica final | LATER | Ya existe prompt de imagen; falta generar o seleccionar arte final |
| Landing page y difusion ampliada | LATER | Plan creado; ejecucion posterior |

## Fuera de alcance de v0.1

| Item | Estado | Razon |
|---|---|---|
| Owners reales confirmados | OUT_OF_SCOPE_V01 | El caso es educativo y anonimizado |
| SLAs, SLOs y metricas productivas reales | OUT_OF_SCOPE_V01 | La obra no valida operacion bancaria real |
| Contratos vigentes contra ambientes reales | OUT_OF_SCOPE_V01 | Requiere contexto productivo no incluido |
| Trazas reales saneadas | OUT_OF_SCOPE_V01 | Se trabaja con evidencia documental y datos sinteticos |
| Implementacion productiva de `spotybank-core-ledger` | OUT_OF_SCOPE_V01 | Se conserva como pieza educativa y roadmap |

## Avance de escritura editorial

| Fecha | Bloque | Estado | Resultado |
|---|---|---|---|
| 2026-05-13 | Capitulo 1 - Introduccion | DONE_EDITORIAL | Reescritura desarrollada con apertura narrativa, metodo de evidencia, limites, perfiles y actividad inicial |
| 2026-05-13 | Capitulo 2 - Inventario tecnico inicial | DONE_EDITORIAL | Reescritura desarrollada con evidencia cuantitativa, clasificacion de artefactos, stack, riesgos y ejercicio practico |
| 2026-05-27 | Capitulo 3 - Anonimizacion y rebranding seguro | DONE_EDITORIAL | Reescritura desarrollada con enfoque de saneamiento, rebranding, placeholders, artefactos no inspeccionados y ejercicio practico |
| 2026-05-27 | Capitulo 4 - Documentacion viva de microservicios | DONE_EDITORIAL | Reescritura desarrollada con README por servicio, catalogos, matrices, runbooks, gobernanza documental e IA |
| 2026-05-27 | Capitulo 5 - Dominios bancarios y fronteras | DONE_EDITORIAL | Reescritura desarrollada con dominios, fronteras, adapters, commons, ledger y criterios de modernizacion |
| 2026-05-27 | Capitulo 6 - Modernizacion de backend | DONE_EDITORIAL | Reescritura desarrollada con oleadas Java/Spring/Maven, pruebas, contratos, resiliencia, observabilidad y rollback |
| 2026-05-27 | Capitulo 7 - Seguridad y DevSecOps | DONE_EDITORIAL | Reescritura desarrollada con saneamiento, threat model, secretos, MFA, supply chain, plataforma, pipeline y backlog |
| 2026-05-27 | Capitulo 8 - Despliegue cloud native | DONE_EDITORIAL | Reescritura desarrollada con contrato runtime, probes, resources, HPA, GitOps, network policies y continuidad |
| 2026-05-27 | Capitulo 9 - Performance, escalamiento y resiliencia | DONE_EDITORIAL | Reescritura desarrollada con SLIs/SLOs, percentiles, pools, colas, HPA, resiliencia y pruebas de carga |
| 2026-05-27 | Capitulo 10 - IA como acelerador | DONE_EDITORIAL | Reescritura desarrollada con prompts seguros, evidencia/inferencia, backlog, pruebas, seguridad y antipatrones |
| 2026-05-27 | Capitulo 11 - Spotybank como curso | DONE_EDITORIAL | Reescritura desarrollada con rutas por perfil, fasciculos, duraciones, laboratorios, revision por pares y rubricas |
| 2026-05-27 | Capitulo 12 - Roadmap de evolucion | DONE_EDITORIAL | Reescritura desarrollada con versiones, fases, ledger, roadmap 90 dias, criterios `v0.2` y cierre de obra |
| 2026-05-27 | Revision integral de coherencia | DONE | Alineados status, registro de cambios y checklist de etapas con cierre editorial ampliado |
| 2026-05-27 | Checklist de salida `v0.2-editorial` | DONE | Creado checklist para criterios de release, revision externa, exportacion y artefactos |
| 2026-05-27 | Paquete de revision externa minima | DONE | Preparado documento de ronda, perfiles, preguntas, escala y criterio de cierre para `v0.2-editorial` |
| 2026-05-27 | Release notes draft `v0.2-editorial` | DONE | Preparado borrador de release notes con cambios, alcance, exclusiones y checklist previo a tag |
| 2026-05-27 | Plan de exportacion PDF/HTML `v0.2-editorial` | DONE | Definido orden de archivos, comandos Pandoc y decision de formatos; herramientas no disponibles localmente |
| 2026-05-27 | Dictamenes de revision externa por perfiles | NEXT | Recopilar observaciones por backend, arquitectura, seguridad, SRE, QA y docencia |
| 2026-05-28 | Capitulo 1 - Introduccion | CERRADO_TECNICO | Cierre reforzado con dictamen, compuerta tecnica, higiene de IA, validacion de actividad y sin pendientes internos |
| 2026-05-28 | Capitulo 2 - Inventario tecnico inicial | CERRADO_TECNICO | Cierre reforzado con baseline reproducible, clasificacion de artefactos, matriz de riesgo, dependencias y uso controlado de IA |
| 2026-05-28 | Capitulo 3 - Anonimizacion y rebranding seguro | CERRADO_TECNICO | Cierre reforzado con matriz de decision por superficie, placeholders, control de artefactos y compuerta segura de publicacion |
| 2026-05-28 | Capitulo 4 - Documentacion viva de microservicios | CERRADO_TECNICO | Cierre reforzado con criterios para README, fichas vivas, catalogos, runbooks, gobernanza e IA documental |
| 2026-05-28 | Capitulo 5 - Dominios bancarios y fronteras | CERRADO_TECNICO | Cierre reforzado con criterios de frontera, servicios canonicos, adapters, commons y ledger educativo |
| 2026-05-28 | Capitulo 6 - Modernizacion de backend | CERRADO_TECNICO | Cierre reforzado con oleadas, baseline, piloto, matrices Java/Spring, pruebas, observabilidad y rollback |
| 2026-05-28 | Capitulo 7 - Seguridad y DevSecOps | CERRADO_TECNICO | Cierre reforzado con amenaza, severidad, secretos, MFA, supply chain, pipeline, IA y backlog verificable |
| 2026-05-28 | Capitulo 8 - Despliegue cloud native | CERRADO_TECNICO | Cierre reforzado con contrato runtime, unidad minima, probes, resources, HPA, GitOps, rollout y continuidad |
| 2026-05-28 | Capitulo 9 - Performance, escalamiento y resiliencia | CERRADO_TECNICO | Cierre reforzado con SLIs/SLOs educativos, bottlenecks, HPA, DLQ, resiliencia, pruebas de carga y backlog medible |
| 2026-05-28 | Capitulo 10 - IA como acelerador | CERRADO_TECNICO | Cierre reforzado con prompts seguros, definicion de done IA, backlog, refactor asistido, privacidad y antipatrones |
| 2026-05-28 | Capitulo 11 - Spotybank como curso | CERRADO_TECNICO | Cierre reforzado con producto educativo, resultados observables, rutas, fasciculos, laboratorios, rubricas, revision por pares y proyecto final |
| 2026-05-28 | Capitulo 12 - Roadmap de evolucion | CERRADO_TECNICO | Cierre reforzado con versiones, fases, ledger educativo, eventos, roadmap 90 dias, criterios v0.2 y limites de release/formato |
| 2026-05-28 | Validacion integral de cierre tecnico | CERRADO_TECNICO | README, ficha, leeme primero, indice, checklist de salida y release notes draft alineados con los 12 capitulos cerrados |
| 2026-05-28 | Plan de salida y formato de venta | DONE | Publicacion editorial separada de PDF/HTML, release con assets, venta directa, curso pago y licencia comercial |
| 2026-05-28 | Checklist de salida v0.2-editorial | DONE | Criterios internos cerrados y escaneo seguro del cierre de salida ejecutado en publicacion |

## Proximo bloque recomendado

1. Generar PDF/HTML solo si se decide preparar release con artefactos descargables.
2. Activar revision externa por perfiles antes de producto institucional, comercial o curso pago.
3. Mantener venta, licencia comercial y landing page como decisiones separadas del cierre editorial.

## Historial

| Fecha | Cambio |
|---|---|
| 2026-05-11 | Creado tablero especifico de obra literaria y estructura editorial. |
| 2026-05-11 | Redactado cuerpo principal de 12 capitulos. |
| 2026-05-11 | Creados ejercicios, laboratorios, rubricas, planes de clase y figuras iniciales. |
| 2026-05-11 | Preparado versionado GitHub independiente, script de publicacion y release notes. |
| 2026-05-12 | Creados fasciculos ejecutables 0 a 8, figuras Mermaid y tablas ejecutivas. |
| 2026-05-12 | Cerrada identidad editorial con autor, licencia, portada, prefacio, contraportada, glosario, acronimos y documentos de publicacion. |
| 2026-05-13 | Desarrollado editorialmente el capitulo 1 como apertura tecnica y metodologica de la obra. |
| 2026-05-13 | Desarrollado editorialmente el capitulo 2 como inventario tecnico inicial basado en evidencia. |
| 2026-05-26 | Verificado estado Git contra `origin/main` y preparado seguimiento documental previo a tag `v0.1-publicable`. |
| 2026-05-27 | Cerradas tareas operativas de publicacion inicial: escaneo, push de `main` y tag `v0.1-publicable`. |
| 2026-05-27 | Desarrollado editorialmente el capitulo 3 como guia de anonimizacion y rebranding seguro. |
| 2026-05-27 | Desarrollado editorialmente el capitulo 4 como guia de documentacion viva de microservicios. |
| 2026-05-27 | Desarrollado editorialmente el capitulo 5 como guia de dominios bancarios y fronteras de servicio. |
| 2026-05-27 | Desarrollado editorialmente el capitulo 6 como guia de modernizacion backend incremental. |
| 2026-05-27 | Desarrollado editorialmente el capitulo 7 como guia de seguridad y DevSecOps. |
| 2026-05-27 | Desarrollado editorialmente el capitulo 8 como guia de despliegue cloud native educativo. |
| 2026-05-27 | Desarrollado editorialmente el capitulo 9 como guia de performance, escalamiento y resiliencia. |
| 2026-05-27 | Desarrollado editorialmente el capitulo 10 como guia de IA aplicada a modernizacion. |
| 2026-05-27 | Desarrollado editorialmente el capitulo 11 como guia para convertir Spotybank en curso. |
| 2026-05-27 | Desarrollado editorialmente el capitulo 12 como roadmap de evolucion y cierre de obra. |
| 2026-05-27 | Completado desarrollo editorial ampliado de capitulos 1 a 12 en `main` posterior al tag `v0.1-publicable`. |
| 2026-05-27 | Alineados registro de cambios y checklist de etapas con publicacion del tag y cierre editorial ampliado. |
| 2026-05-27 | Creado checklist de salida `v0.2-editorial` para orientar revision externa, exportacion y release. |
| 2026-05-27 | Preparado paquete de revision externa minima para `v0.2-editorial` por perfiles. |
| 2026-05-27 | Preparado borrador de release notes para `v0.2-editorial`. |
| 2026-05-27 | Preparado plan de exportacion PDF/HTML para `v0.2-editorial`. |
| 2026-05-28 | Cerrado tecnicamente el capitulo 1 y creado registro de cierre tecnico por capitulos. |
| 2026-05-28 | Cerrado tecnicamente el capitulo 2 y saneada fuente de modernizacion asociada. |
| 2026-05-28 | Cerrado tecnicamente el capitulo 3 y saneada fuente de refactor de identidad asociada. |
| 2026-05-28 | Cerrado tecnicamente el capitulo 4 con criterios verificables de documentacion viva. |
| 2026-05-28 | Cerrado tecnicamente el capitulo 5 con criterios verificables de dominios y fronteras. |
| 2026-05-28 | Cerrado tecnicamente el capitulo 6 con criterios verificables de modernizacion backend incremental. |
| 2026-05-28 | Cerrado tecnicamente el capitulo 7 con criterios verificables de seguridad y DevSecOps. |
| 2026-05-28 | Cerrado tecnicamente el capitulo 8 con criterios verificables de despliegue cloud native educativo. |
| 2026-05-28 | Cerrado tecnicamente el capitulo 9 con criterios verificables de performance, escalamiento y resiliencia. |
| 2026-05-28 | Cerrado tecnicamente el capitulo 10 con criterios verificables de uso responsable de IA. |
| 2026-05-28 | Cerrado tecnicamente el capitulo 11 con criterios verificables de diseno docente, rutas, fasciculos, laboratorios y evaluacion. |
| 2026-05-28 | Cerrado tecnicamente el capitulo 12 con criterios verificables de roadmap, fases, ledger educativo, v0.2 y limites de publicacion. |
| 2026-05-28 | Completada validacion integral de cierre tecnico global posterior a los 12 capitulos. |
| 2026-05-28 | Ordenado plan de salida y formato de venta sin crear tag, release, precio ni oferta comercial. |
| 2026-05-28 | Cerrados criterios internos del checklist de salida y documentada decision sobre revision externa. |
| 2026-06-03 | Publicado `main` y preparado tag editorial interno `v0.2-editorial` despues del escaneo de publicacion segura. |
| 2026-06-04 | Preparado exportador local para libro unico en Markdown y exportacion HTML/PDF condicionada a Pandoc. |
