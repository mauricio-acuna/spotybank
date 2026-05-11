# Propuesta de licencia y uso

Este documento no reemplaza asesoramiento legal. Su objetivo es dejar una propuesta editorial clara para discutir antes de publicar la obra Spotybank.

## Objetivo de publicacion

Spotybank busca funcionar como material educativo y tecnico para:

- Universidades.
- Institutos.
- Terciarios.
- Empresas.
- Centros de formacion profesional.
- Equipos de desarrollo, mantenimiento, arquitectura, seguridad, QA y DevOps/SRE.

## Recomendacion inicial

Licencia sugerida para la obra textual:

```text
Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International
CC BY-NC-SA 4.0
```

Motivo:

- Permite compartir y adaptar el material.
- Exige atribucion.
- Evita uso comercial sin permiso.
- Obliga a compartir adaptaciones bajo condiciones compatibles.

## Alternativas

| Licencia | Conviene cuando | Riesgo |
|---|---|---|
| CC BY 4.0 | Se quiere maxima difusion, incluso comercial | Terceros pueden vender derivados |
| CC BY-NC 4.0 | Se permite adaptar sin uso comercial | No obliga a compartir adaptaciones igual |
| CC BY-NC-SA 4.0 | Se quiere educacion abierta no comercial | Puede limitar alianzas comerciales |
| Todos los derechos reservados | Se busca control total | Reduce adopcion educativa |

## Codigo fuente y ejemplos

Si se publica codigo educativo propio, puede usar una licencia distinta a la obra textual.

Recomendacion para codigo de ejemplo:

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

## Texto corto sugerido

```text
Spotybank es un caso educativo de modernizacion de microservicios bancarios.
El material textual se propone bajo licencia CC BY-NC-SA 4.0, salvo que se indique lo contrario.
Los ejemplos de codigo propios pueden publicarse bajo Apache License 2.0.
No se permite incorporar secretos, datos reales ni referencias a entidades externas al caso educativo.
```

## Pendiente antes de publicar

- Confirmar licencia final.
- Agregar archivo `LICENSE` si se publica como repo standalone.
- Agregar nota de licencia al README principal.
- Definir si habra version comercial/empresarial separada.
- Revisar compatibilidad con imagenes, diagramas y plantillas.
