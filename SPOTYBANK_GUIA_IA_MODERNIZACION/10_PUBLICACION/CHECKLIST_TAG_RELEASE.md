# Checklist para tag y release

Este checklist debe ejecutarse antes de crear `v0.1-publicable`.

## Precondiciones

- [ ] Repo local limpio.
- [ ] Rama `main` alineada con `origin/main`.
- [ ] Escaneo de referencias sensibles sin coincidencias.
- [ ] Licencia final confirmada o release marcado como preliminar.
- [ ] Status de obra actualizado.
- [ ] Release notes revisadas.

## Comandos sugeridos

```powershell
git status -sb
git pull --rebase origin main
rg -n -i "patrones-sensibles" . -g "!.git/**" -g "!_logs/**"
git tag -a v0.1-publicable -m "Spotybank Guia IA de Modernizacion v0.1-publicable"
git push origin v0.1-publicable
```

Nota: el escaneo real debe usar el script de publicacion o los patrones definidos en `Publicar_ObraLiteraria_Spotybank.ps1`.

## Decision de release

| Decision | Criterio |
|---|---|
| Crear tag ahora | Licencia confirmada y revision minima aceptada |
| Crear release preliminar | Licencia propuesta, revision interna lista y advertencias claras |
| Esperar | Falta decision de licencia o hay bloqueantes de seguridad |

## Recomendacion actual

Esperar para tag final hasta confirmar licencia y completar al menos una revision humana por perfil tecnico/docente. Mientras tanto, mantener estas release notes como borrador.
