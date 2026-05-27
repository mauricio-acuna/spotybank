# Checklist de salida v0.2-editorial

Este checklist define los criterios para declarar lista la version `v0.2-editorial` de la obra Spotybank.

La version `v0.2-editorial` parte del tag `v0.1-publicable` y del desarrollo editorial ampliado de los capitulos 1 a 12 en `main`.

## Objetivo

Preparar una salida editorial mas completa, revisable y exportable, sin convertir el caso educativo en una promesa de sistema productivo real.

## Alcance esperado

- Capitulos 1 a 12 con voz editorial ampliada.
- Fasciculos por perfil alineados con los capitulos.
- Material docente utilizable en cursos, talleres o rutas internas.
- Criterios de revision externa definidos.
- Formatos de entrega preparados o planificados.
- Seguridad documental verificada antes de publicar.

## Semaforo de estado

- [ok]: criterio completado.
- [next]: criterio obligatorio o recomendado para cerrar `v0.2-editorial`.
- [later]: mejora valiosa, no bloqueante para esta salida.
- [blocked]: requiere informacion o decision externa.

## Criterios obligatorios

| Criterio | Estado | Evidencia esperada |
|---|---|---|
| Rama `main` sincronizada con `origin/main` | [next] | `git status -sb` sin divergencias |
| Capitulos 1 a 12 en estado `DONE_EDITORIAL` | [ok] | `00_GESTION_PROYECTO/statusObraLiteraria.md` |
| Registro de cambios actualizado | [ok] | `00_GESTION_PROYECTO/REGISTRO_CAMBIOS.md` |
| Checklist de etapas alineado con el cierre editorial | [ok] | `00_GESTION_PROYECTO/CHECKLIST_ETAPAS.md` |
| Revision externa minima por perfiles | [next] | Dictamenes guiados por `09_REVISIONES/REVISION_EXTERNA_MINIMA_v0.2-editorial.md` |
| Escaneo de publicacion segura ejecutado | [next] | Salida del script sin coincidencias sensibles |
| Limites del caso educativo vigentes | [ok] | Disclaimers, fuera de alcance y notas metodologicas |
| Decision de formato de entrega tomada | [next] | Markdown solo, PDF/HTML, o ambos |

## Coherencia editorial

| Revision | Estado | Criterio |
|---|---|---|
| Indice, README y portada apuntan al mismo alcance | [next] | No hay promesas fuera de `v0.2-editorial` |
| Capitulos mantienen nombres y orden estables | [ok] | Capitulos 1 a 12 completos |
| Glosario y acronimos cubren terminos centrales | [next] | Terminos de seguridad, IA, SRE, arquitectura y docencia revisados |
| Figuras y tablas no contradicen el texto | [next] | Tablas ejecutivas y Mermaid revisadas |
| Actividades practicas tienen objetivo y entregable | [next] | Ejercicios y laboratorios revisados por perfil |
| Referencias a versiones previas estan claras | [ok] | `v0.1-publicable` queda como release preliminar |

## Revision por perfiles

Usar `09_REVISIONES/REVISION_EXTERNA_MINIMA_v0.2-editorial.md` y `09_REVISIONES/PLANTILLA_REVISION.md` como base. Cada perfil debe entregar observaciones concretas y una recomendacion de salida.

| Perfil | Estado | Foco de revision |
|---|---|---|
| Backend Java/Spring | [next] | Modernizacion incremental, compatibilidad, pruebas y deuda tecnica |
| Arquitectura de microservicios | [next] | Fronteras de dominio, dependencias, contratos y roadmap |
| Seguridad / DevSecOps | [next] | Saneamiento, secretos, threat model, supply chain y controles |
| DevOps / SRE | [next] | Despliegue, observabilidad, resiliencia, rollback y operacion |
| QA / Testing | [next] | Pruebas, cobertura educativa, contratos y performance |
| Docencia / Editorial | [next] | Claridad, progresion, rubricas, laboratorios y legibilidad |

## Seguridad de publicacion

| Control | Estado | Accion |
|---|---|---|
| Ejecutar script de publicacion segura | [next] | `powershell -NoProfile -ExecutionPolicy Bypass -File .\Publicar_ObraLiteraria_Spotybank.ps1` |
| Verificar ausencia de secretos | [next] | Revisar salida del escaneo antes del commit |
| Verificar ausencia de artefactos pesados no deseados | [next] | No publicar zips, builds, logs ni temporales |
| Mantener placeholders educativos | [ok] | No reemplazar con datos reales |
| Confirmar que no se usan ambientes productivos | [ok] | El caso sigue siendo educativo y anonimizado |

## Entregables

| Entregable | Estado | Decision |
|---|---|---|
| Markdown versionado en Git | [ok] | Entregable base |
| PDF unico de la obra | [next] | Recomendado para lectores y estudiantes |
| HTML navegable | [later] | Util si se publica como sitio |
| Fasciculos PDF por perfil | [later] | Util para talleres especificos |
| Release notes de `v0.2-editorial` | [next] | Crear antes de tag/release |
| Arte final de portada | [later] | No bloquea el contenido tecnico |
| Release de GitHub con artefactos | [later] | Solo si se generan PDF/HTML descargables |

## Decisiones de salida

| Decision | Minimo para v0.2 | Puede quedar para despues |
|---|---|---|
| Revision externa | Una ronda minima por perfiles criticos | Segunda ronda editorial |
| Exportacion | Definir formato y generar al menos PDF si se decide | Sitio HTML completo |
| Arte | Portada textual actual aceptada | Portada grafica final |
| Release GitHub | Tag si el contenido esta cerrado | Release con assets exportados |
| ISBN | No requerido | Edicion editorial o impresa |

## Comandos sugeridos

```powershell
git status -sb
powershell -NoProfile -ExecutionPolicy Bypass -File .\Publicar_ObraLiteraria_Spotybank.ps1
git tag -a v0.2-editorial -m "Spotybank Guia IA de Modernizacion v0.2-editorial"
git push origin v0.2-editorial
```

El tag `v0.2-editorial` debe crearse solo cuando los criterios obligatorios esten en `[ok]`.

## No bloquear v0.2

Estos puntos son valiosos, pero no deben impedir el cierre editorial de `v0.2`:

- ISBN.
- Arte grafico final de portada.
- Owners productivos reales.
- SLAs, SLOs y metricas reales de produccion.
- Ambientes cloud reales.
- Implementacion productiva de `spotybank-core-ledger`.
- Release con assets descargables si aun no se exporta PDF/HTML.

## Criterio de salida

Declarar `v0.2-editorial` lista solo cuando todos los criterios obligatorios esten en `[ok]`, el script de publicacion segura no reporte hallazgos sensibles y `main` este sincronizada con `origin/main`.
