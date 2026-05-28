# Licencia y uso

Este documento registra la decision de licencia para la version `v0.1-publicable` y orienta la preparacion de `v0.2-editorial`. No reemplaza asesoramiento legal especializado.

## Objetivo de publicacion

Spotybank busca funcionar como material educativo y tecnico para:

- Universidades.
- Institutos.
- Terciarios.
- Empresas.
- Centros de formacion profesional.
- Equipos de desarrollo, mantenimiento, arquitectura, seguridad, QA y DevOps/SRE.

## Decision vigente

Licencia definida para la obra textual:

```text
Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International
CC BY-NC-SA 4.0
```

Motivo editorial:

- Permite compartir y adaptar el material.
- Exige atribucion.
- Evita uso comercial sin permiso.
- Obliga a compartir adaptaciones bajo condiciones compatibles.

## Alternativas evaluadas

| Licencia | Conviene cuando | Riesgo |
|---|---|---|
| CC BY 4.0 | Se quiere maxima difusion, incluso comercial | Terceros pueden vender derivados |
| CC BY-NC 4.0 | Se permite adaptar sin uso comercial | No obliga a compartir adaptaciones igual |
| CC BY-NC-SA 4.0 | Se quiere educacion abierta no comercial | Puede limitar alianzas comerciales |
| Todos los derechos reservados | Se busca control total | Reduce adopcion educativa |

## Codigo fuente y ejemplos propios

Si se publica codigo educativo propio, puede usar una licencia distinta a la obra textual.

Licencia definida para codigo de ejemplo propio:

```text
Apache License 2.0
```

Motivo:

- Es conocida en entornos empresariales.
- Permite uso, modificacion y distribucion.
- Incluye clausulas de patente.

Si el codigo es solo pseudocodigo o fragmentos didacticos, se puede incluir bajo la misma licencia de la obra.

## Restricciones de uso

Independientemente de la licencia, el material publicado no debe contener:

- Secretos reales.
- Tokens.
- Passwords.
- Certificados.
- Dominios corporativos antiguos.
- Nombres de entidades reales.
- Nombres de desarrolladores previos.
- Datos personales.
- Archivos comprimidos no saneados.

## Texto corto de licencia

```text
Spotybank es un caso educativo de modernizacion de microservicios bancarios.
El material textual se publica bajo licencia CC BY-NC-SA 4.0, salvo que se indique lo contrario.
Los ejemplos de codigo propios se publican bajo Apache License 2.0.
No se permite incorporar secretos, datos reales ni referencias a entidades externas al caso educativo.
```

## Archivos de licencia

- Archivo de licencia del repo: `../../LICENSE.md`.
- Licencia CC BY-NC-SA 4.0: https://creativecommons.org/licenses/by-nc-sa/4.0/
- Texto legal CC BY-NC-SA 4.0: https://creativecommons.org/licenses/by-nc-sa/4.0/legalcode
- Apache License 2.0: https://www.apache.org/licenses/LICENSE-2.0

## Estado de cierre

La licencia queda definida para `v0.1-publicable` y se mantiene como base para `v0.2-editorial` mientras no exista una decision editorial distinta.

Una version comercial, institucional, empresarial o de curso pago requiere terminos separados. Esa decision no bloquea el cierre tecnico ni el tag editorial, pero debe resolverse antes de vender PDF, pack docente, licencias institucionales o talleres pagos.
