# Notas de investigacion - Capitulo 03

## Fuentes revisadas

- `Documentacion/spotybank/refactor-identidad.md`
- `Documentacion/spotybank/servicios-canonicos.md`
- `Documentacion/arquitectura/seguridad-y-riesgos.md`
- `Documentacion/statusTasks.md`
- `SPOTYBANK_GUIA_IA_MODERNIZACION/09_REVISIONES/CHECKLIST_REVISION_TECNICA_EDITORIAL.md`
- `Publicar_ObraLiteraria_Spotybank.ps1`

## Ideas clave

- La anonimizacion debe ocurrir antes de publicar, no al final como limpieza cosmetica.
- Rebranding seguro combina identidad editorial, paquetes, configuracion, datos y artefactos.
- Los placeholders deben explicar intencion sin parecer credenciales validas.
- Los comprimidos y binarios heredados son superficies de riesgo porque pueden contener material no inspeccionado.
- La IA ayuda a revisar patrones, pero no reemplaza escaneo local, criterio humano ni trazabilidad.

## Argumento editorial

El capitulo debe mostrar que Spotybank no es solo un cambio de nombre. Es una operacion de saneamiento tecnico que permite convertir un sistema realista en un caso educativo publicable.

La estructura propuesta distingue limpieza cosmetica, anonimizacion y saneamiento de seguridad. Esa distincion ayuda a evitar una falsa sensacion de cierre: un README limpio no garantiza que properties, scripts, payloads o artefactos auxiliares sean publicables.

## Decisiones cerradas

- Mantener `Spotybank` como identidad educativa publica.
- Usar `io.spotybank.services` como namespace didactico.
- Usar `api.spotybank.io` solo como dominio educativo de ejemplo.
- Excluir o regenerar artefactos comprimidos heredados.
- Mantener escaneo previo a publicacion con `Publicar_ObraLiteraria_Spotybank.ps1`.
- Cerrar el capitulo con compuerta de publicacion segura, matriz de decision por superficie y control de artefactos de riesgo.
- Registrar que no quedan pendientes editoriales internos para el capitulo 3 en el ciclo `v0.2-editorial`.

## Mejoras futuras no bloqueantes

- Definir si se agregan ejemplos resueltos de saneamiento por microservicio.
- Exportar figuras o tablas del flujo de saneamiento a formato grafico final.
- Revisar con perfil legal/editorial externo antes de una edicion formal impresa o comercial.
