# Release notes - v0.2-editorial

Estado: lista para tag editorial interno. No crear release final con artefactos hasta cerrar la etapa PDF/HTML o una decision equivalente.

## Nombre de version

```text
Spotybank Guia IA de Modernizacion - v0.2-editorial
```

## Resumen

`v0.2-editorial` consolida el desarrollo editorial ampliado y el cierre tecnico de la obra Spotybank despues de `v0.1-publicable`. La version fortalece los capitulos 1 a 12, ordena el cierre editorial, prepara criterios de salida, deja documentada la decision sobre revision externa y mantiene el enfoque educativo, anonimizado y no productivo del caso.

## Cambios principales frente a v0.1-publicable

- Desarrollo editorial ampliado de los capitulos 1 a 12.
- Mayor separacion entre evidencia, inferencia, validacion externa y recomendacion.
- Refuerzo de limites del caso educativo y anonimizado.
- Roadmap de evolucion mas claro para `spotybank-core-ledger` y siguientes fases.
- Criterios de salida `v0.2-editorial` documentados.
- Validacion integral de cierre tecnico documentada.
- Plan de salida y formato de venta separado de tag/release.
- Decision sobre revision externa documentada para no bloquear el tag editorial interno.
- Paquete de revision externa minima preparado por perfiles.
- Registro de cambios, status de obra y checklist de etapas alineados con el ciclo posterior al tag `v0.1-publicable`.

## Incluye

- Capitulos 1 a 12 en estado `CERRADO_TECNICO`.
- Checklist de salida `v0.2-editorial`.
- Validacion integral de cierre tecnico.
- Plan de salida y formato de venta.
- Decision sobre revision externa.
- Paquete de revision externa minima por perfiles.
- Matriz de revision por perfil actualizada.
- Registro de cambios actualizado.
- Estado de obra actualizado.
- Material docente y fasciculos heredados de `v0.1-publicable`.
- Licencia textual CC BY-NC-SA 4.0.
- Ejemplos de codigo propios bajo Apache License 2.0.

## No incluye todavia

- Dictamenes externos completados.
- Release formal en GitHub con artefactos descargables.
- PDF/HTML exportado dentro del repo.
- Arte grafico final de portada.
- ISBN.
- Precio, landing de venta o curso pago.
- Validacion con ambientes, owners, SLAs o datos productivos reales.

## Advertencias

- Spotybank sigue siendo un caso educativo ficticio.
- No debe incluir datos reales, secretos, dominios privados ni trazas productivas.
- Las recomendaciones requieren validacion humana antes de usarse en sistemas reales.
- La IA se presenta como acelerador documental y tecnico, no como sustituto de revision profesional.

## Checklist antes de tag

- [ok] Capitulos 1 a 12 cerrados tecnicamente.
- [ok] Validacion integral de cierre tecnico documentada.
- [ok] Checklist de salida `v0.2-editorial` creado.
- [ok] Paquete de revision externa minima preparado.
- [ok] Decision sobre revision externa documentada.
- [later] Recopilar dictamenes externos por perfiles criticos si se prepara producto institucional/comercial.
- [later] Resolver hallazgos bloqueantes o registrarlos como fuera de alcance si se activa ronda externa.
- [ok] Ejecutar script de publicacion segura.
- [ok] Verificar `main` sincronizada con `origin/main`.
- [later] Generar PDF/HTML como etapa posterior al tag editorial interno.
- [ok] Crear tag `v0.2-editorial` cuando los obligatorios esten en `[ok]`.

## Comandos sugeridos al cierre

```powershell
git status -sb
powershell -NoProfile -ExecutionPolicy Bypass -File .\Publicar_ObraLiteraria_Spotybank.ps1
git tag -a v0.2-editorial -m "Spotybank Guia IA de Modernizacion v0.2-editorial"
git push origin v0.2-editorial
```

## Criterio de publicacion

Declarar `v0.2-editorial` lista para tag editorial interno cuando el checklist de salida marque los obligatorios en `[ok]`, el script de publicacion segura complete sin hallazgos sensibles y `main` este sincronizada con `origin/main`. La revision externa, PDF/HTML y release con artefactos quedan como etapas posteriores salvo decision explicita.
