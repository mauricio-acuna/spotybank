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

- [next] Repo local limpio.
- [next] Rama `main` alineada con `origin/main`.
- [next] Escaneo de referencias sensibles sin coincidencias.
- [next] Commit de cierre creado.
- [next] Tag `v0.1-publicable` creado y publicado.

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
| Crear tag documental | Listo cuando el repo este limpio |
| Crear release preliminar | Listo con advertencias actuales |
| Esperar tag final editorial/impreso | Solo si se quiere ISBN, maquetacion profesional o revision externa |

## Recomendacion actual

Crear `v0.1-publicable` como release preliminar educativa despues de ejecutar el script de publicacion segura. Reservar una version posterior para PDF/HTML, portada grafica final, ISBN y revisiones externas.
