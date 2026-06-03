# Revision externa minima v0.2-editorial

Este documento prepara la ronda minima de revision externa para `v0.2-editorial`.

La revision busca detectar bloqueantes tecnicos, editoriales o de publicacion antes de una salida institucional, comercial, docente paga o release con artefactos. Para un tag editorial interno `v0.2-editorial`, la decision vigente queda documentada en `DECISION_REVISION_EXTERNA_v0.2-editorial.md`.

## Alcance de la ronda

- Version revisada: `v0.2-editorial`.
- Base documental: `main` posterior al tag `v0.1-publicable`.
- Cuerpo principal: capitulos 1 a 12 en estado `CERRADO_TECNICO`.
- Evidencia de gestion: `00_GESTION_PROYECTO/statusObraLiteraria.md`.
- Criterio de salida: `10_PUBLICACION/CHECKLIST_SALIDA_v0.2-editorial.md`.

## Perfiles requeridos

| Perfil | Estado | Prioridad | Archivos foco |
|---|---|---|---|
| Backend Java/Spring | PENDIENTE_DICTAMEN | Alta | Capitulos 6, 9, 10 y 12 |
| Arquitectura de microservicios | PENDIENTE_DICTAMEN | Alta | Capitulos 2, 5, 8 y 12 |
| Seguridad / DevSecOps | PENDIENTE_DICTAMEN | Alta | Capitulos 3, 7, 8 y 10 |
| DevOps / SRE | PENDIENTE_DICTAMEN | Media/alta | Capitulos 8, 9 y 12 |
| QA / Testing | PENDIENTE_DICTAMEN | Media/alta | Capitulos 6, 9, 11 y apendices docentes |
| Docencia / Editorial | PENDIENTE_DICTAMEN | Alta | Capitulos 1, 11, ejercicios, rubricas y planes de clase |

## Preguntas comunes

Cada revisor debe responder estas preguntas antes de emitir recomendacion:

1. El texto separa claramente evidencia, inferencia y recomendacion?
2. Hay alguna afirmacion que parezca prometer un sistema bancario productivo real?
3. Los limites del caso educativo y anonimizado son suficientes?
4. Las actividades practicas tienen objetivo, contexto y entregable verificable?
5. Hay riesgos de publicacion: secretos, datos reales, dominios privados, logs o artefactos no saneados?
6. Que contenido debe corregirse antes de un tag `v0.2-editorial`?
7. Que contenido puede quedar como mejora posterior?

## Escala de evaluacion

| Puntaje | Significado | Accion esperada |
|---|---|---|
| 5 | Listo sin cambios relevantes | Puede cerrar como `[ok]` |
| 4 | Listo con ajustes menores | Corregir antes de release si son simples |
| 3 | Requiere ajustes claros | Registrar issues y resolver antes de tag |
| 2 | Tiene bloqueantes importantes | No crear tag hasta corregir |
| 1 | No apto para salida editorial | Replanificar bloque afectado |

## Recomendacion final permitida

- Aceptar sin cambios.
- Aceptar con cambios menores.
- Revisar y reenviar.
- Bloquear salida `v0.2-editorial`.

## Registro minimo por dictamen

Crear un archivo por perfil con este formato de nombre:

```text
REVISION_v0.2_{PERFIL}_{YYYY-MM-DD}.md
```

Usar `09_REVISIONES/PLANTILLA_REVISION.md` como base y agregar esta tabla de hallazgos:

| Severidad | Archivo/seccion | Hallazgo | Recomendacion | Bloquea v0.2 |
|---|---|---|---|---|
| Alta/Media/Baja | | | | Si/No |

## Criterio de cierre de ronda

La ronda minima queda cerrada cuando:

- Existen dictamenes para arquitectura, seguridad/DevSecOps y docencia/editorial.
- No quedan hallazgos de severidad alta sin respuesta.
- Los hallazgos medios tienen decision: corregir ahora o pasar a backlog posterior.
- El checklist de salida `v0.2-editorial` refleja el resultado de la ronda.

## Trabajo posterior recomendado

1. Seleccionar revisores o responsables por perfil.
2. Copiar la plantilla para cada dictamen.
3. Registrar hallazgos con severidad y decision.
4. Actualizar `10_PUBLICACION/CHECKLIST_SALIDA_v0.2-editorial.md` cuando la ronda termine.
