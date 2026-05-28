# Release notes - v0.2-editorial

Estado: borrador preparado. No crear tag ni release final hasta cerrar los criterios obligatorios del checklist de salida.

## Nombre de version

```text
Spotybank Guia IA de Modernizacion - v0.2-editorial
```

## Resumen

`v0.2-editorial` consolida el desarrollo editorial ampliado y el cierre tecnico de la obra Spotybank despues de `v0.1-publicable`. La version fortalece los capitulos 1 a 12, ordena el cierre editorial, prepara criterios de salida, deja lista la ronda de revision externa minima por perfiles y mantiene el enfoque educativo, anonimizado y no productivo del caso.

## Cambios principales frente a v0.1-publicable

- Desarrollo editorial ampliado de los capitulos 1 a 12.
- Mayor separacion entre evidencia, inferencia, validacion externa y recomendacion.
- Refuerzo de limites del caso educativo y anonimizado.
- Roadmap de evolucion mas claro para `spotybank-core-ledger` y siguientes fases.
- Criterios de salida `v0.2-editorial` documentados.
- Paquete de revision externa minima preparado por perfiles.
- Registro de cambios, status de obra y checklist de etapas alineados con el ciclo posterior al tag `v0.1-publicable`.

## Incluye

- Capitulos 1 a 12 en estado `CERRADO_TECNICO`.
- Checklist de salida `v0.2-editorial`.
- Paquete de revision externa minima por perfiles.
- Matriz de revision por perfil actualizada.
- Registro de cambios actualizado.
- Estado de obra actualizado.
- Material docente y fasciculos heredados de `v0.1-publicable`.
- Licencia textual CC BY-NC-SA 4.0.
- Ejemplos de codigo propios bajo Apache License 2.0.

## No incluye todavia

- Dictamenes externos completados.
- Tag `v0.2-editorial`.
- Release formal en GitHub con artefactos descargables.
- PDF/HTML exportado dentro del repo.
- Arte grafico final de portada.
- ISBN.
- Validacion con ambientes, owners, SLAs o datos productivos reales.

## Advertencias

- Spotybank sigue siendo un caso educativo ficticio.
- No debe incluir datos reales, secretos, dominios privados ni trazas productivas.
- Las recomendaciones requieren validacion humana antes de usarse en sistemas reales.
- La IA se presenta como acelerador documental y tecnico, no como sustituto de revision profesional.

## Checklist antes de tag

- [ok] Capitulos 1 a 12 cerrados tecnicamente.
- [ok] Checklist de salida `v0.2-editorial` creado.
- [ok] Paquete de revision externa minima preparado.
- [next] Recopilar dictamenes externos por perfiles criticos.
- [next] Resolver hallazgos bloqueantes o registrarlos como fuera de alcance.
- [next] Ejecutar script de publicacion segura.
- [next] Verificar `main` sincronizada con `origin/main`.
- [next] Decidir si se genera PDF/HTML antes del release.
- [next] Crear tag `v0.2-editorial` solo cuando los obligatorios esten en `[ok]`.

## Comandos sugeridos al cierre

```powershell
git status -sb
powershell -NoProfile -ExecutionPolicy Bypass -File .\Publicar_ObraLiteraria_Spotybank.ps1
git tag -a v0.2-editorial -m "Spotybank Guia IA de Modernizacion v0.2-editorial"
git push origin v0.2-editorial
```

## Criterio de publicacion

Publicar `v0.2-editorial` cuando la ronda minima de revision externa no tenga bloqueantes abiertos, el checklist de salida marque los obligatorios en `[ok]` y el script de publicacion segura complete sin hallazgos sensibles.
