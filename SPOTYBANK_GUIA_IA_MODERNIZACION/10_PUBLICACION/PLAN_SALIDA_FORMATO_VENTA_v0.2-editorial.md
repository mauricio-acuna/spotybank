# Plan de salida y formato de venta v0.2-editorial

Estado: plan de ordenamiento. No crea tag, release, precio, landing page ni oferta comercial.

## Principio rector

Primero se publica una salida editorial clara; despues se decide si existe una version comercial, institucional o de curso. La obra no debe mezclar cierre tecnico, release de GitHub, PDF descargable, venta directa y curso pago como si fueran el mismo producto.

## Separacion de decisiones

| Decision | Estado recomendado | Criterio |
|---|---|---|
| Contenido tecnico-editorial | Cerrado | Capitulos 1 a 12 en `CERRADO_TECNICO` y validacion integral completada |
| Tag `v0.2-editorial` | Pendiente | Solo despues de checklist final, escaneo seguro y decision sobre revision externa |
| PDF/HTML | Pendiente tecnico | Requiere herramienta de exportacion o pipeline |
| Release con assets | Posterior | Solo si existen PDF/HTML revisados |
| Venta directa | Posterior | Requiere formato final, precio, canal, terminos comerciales e impuestos |
| Curso/taller pago | Posterior | Requiere programa, duracion, entregables, licencia de uso y soporte docente |
| Licencia comercial separada | Posterior | Requiere decision explicita del autor; no se infiere desde CC BY-NC-SA 4.0 |

## Formatos posibles

| Formato | Uso | Estado |
|---|---|---|
| Markdown en GitHub | Fuente canonica, revision, transparencia | Listo |
| PDF unico | Lectura, entrega academica, descarga | Recomendado, no generado |
| HTML unico | Navegacion web/local | Opcional, no generado |
| Fasciculos PDF | Talleres por perfil | Posterior |
| Pack docente | Curso institucional | Posterior |
| Edicion comercial | Venta directa o institucional | Posterior |

## Recomendacion de secuencia

1. Cerrar checklist `v0.2-editorial`.
2. Decidir si revision externa minima bloquea o no el tag.
3. Ejecutar script de publicacion segura.
4. Crear tag `v0.2-editorial` solo si los criterios obligatorios estan en `[ok]`.
5. Generar PDF/HTML en una etapa separada.
6. Revisar PDF/HTML como artefactos, no como fuente.
7. Crear release con assets solo si los artefactos estan revisados.
8. Definir venta o curso comercial con terminos propios.

## Minimo para venta o curso pago

- PDF o paquete docente revisado.
- Portada final o decision explicita de usar portada textual.
- Terminos comerciales separados de la licencia abierta.
- Alcance de uso: individual, institucional, curso interno, taller o consultoria.
- Politica de actualizaciones.
- Canal de pago y facturacion definido fuera del repo.
- Aviso claro: Spotybank es caso educativo, no sistema financiero real.

## Decision de licencia

La licencia textual actual es CC BY-NC-SA 4.0. Esa licencia permite uso educativo no comercial bajo sus condiciones, pero no define por si sola una venta directa, una licencia institucional o un curso pago.

Si el autor decide vender una version PDF, un pack docente o un taller, debe tratarse como licencia o contrato separado, manteniendo claro que la version abierta conserva sus terminos.

## No hacer todavia

- No crear precio.
- No prometer fecha comercial.
- No publicar landing de venta.
- No mezclar release tecnico con oferta paga.
- No cambiar licencia sin decision editorial explicita.
- No generar tag antes del checklist final.
