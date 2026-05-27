# Checklist para tag y release

Este checklist queda listo para crear `v0.1-publicable` cuando se decida publicar el estado actual del repo.

## Precondiciones documentales

- [ok] Licencia final definida.
- [ok] Status de obra actualizado.
- [ok] Release notes revisadas.
- [ok] Checklist tecnico/editorial completado.
- [ok] Acta de cierre creada.
- [ok] Escaneo documental de cierre sin coincidencias.
- [ok] Advertencias de caso educativo incluidas.

## Precondiciones operativas

- [ok] Repo local verificado antes del seguimiento documental 2026-05-26.
- [ok] Rama `main` alineada con `origin/main` antes del cierre operativo 2026-05-27.
- [ok] Escaneo de referencias sensibles sin coincidencias.
- [ok] Commit documental de seguimiento creado y subido.
- [ok] Tag `v0.1-publicable` creado y publicado.

## Comandos sugeridos

```powershell
git status -sb
.\Publicar_ObraLiteraria_Spotybank.ps1
git tag -a v0.1-publicable -m "Spotybank Guia IA de Modernizacion v0.1-publicable"
git push origin v0.1-publicable
```

Nota: el escaneo real debe usar el script de publicacion o los patrones definidos en `Publicar_ObraLiteraria_Spotybank.ps1`.

## Decision de release

| Decision | Estado |
|---|---|
| Crear tag documental | Completado para `v0.1-publicable` |
| Crear release preliminar | Listo con advertencias actuales |
| Esperar tag final editorial/impreso | Solo si se quiere ISBN, maquetacion profesional o revision externa |

## Recomendacion actual

Crear `v0.1-publicable` como release preliminar educativa despues de ejecutar el script de publicacion segura. Reservar una version posterior para PDF/HTML, portada grafica final, ISBN y revisiones externas.

Actualizacion 2026-05-27: cierre operativo de `v0.1-publicable` preparado para quedar publicado en `main` y tag remoto.
