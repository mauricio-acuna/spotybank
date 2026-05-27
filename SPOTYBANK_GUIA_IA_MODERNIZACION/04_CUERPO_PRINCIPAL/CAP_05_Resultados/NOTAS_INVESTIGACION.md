# Notas de investigacion - Capitulo 05

## Fuentes revisadas

- `Documentacion/spotybank/servicios-canonicos.md`
- `Documentacion/arquitectura/matriz-relaciones.md`
- `Documentacion/funcionalidades/autenticacion-y-tokens.md`
- `Documentacion/funcionalidades/mfa-y-autenticadores.md`
- `Documentacion/funcionalidades/notificaciones.md`
- `Documentacion/arquitectura/roadmap-mejoras.md`
- `SPOTYBANK_GUIA_IA_MODERNIZACION/02_PLANIFICACION/MAPA_MODERNIZACION_DESDE_FUENTES.md`
- `SPOTYBANK_GUIA_IA_MODERNIZACION/04_CUERPO_PRINCIPAL/CAP_02_Marco_Teorico/CAP_02_BORRADOR.md`

## Ideas clave

- Un microservicio desplegable no siempre equivale a un dominio.
- Las fronteras deben distinguir responsabilidad, datos, contratos, operacion y seguridad.
- Auth, accounts, MFA, notificaciones, adapters y commons muestran ritmos de cambio distintos.
- Los adapters deben funcionar como anti-corruption layer y no como lugar oculto de reglas de negocio.
- Los commons ayudan si son tecnicos; generan riesgo si concentran decisiones funcionales.
- `spotybank-core-ledger` debe mantenerse como pieza educativa pendiente y no como modulo productivo cerrado.

## Argumento editorial

El capitulo debe ayudar a leer Spotybank desde dominios y fronteras, no desde carpetas. La idea central es que modernizar requiere saber que responsabilidad pertenece a cada zona y que tipo de validacion necesita cada movimiento.

La propuesta canonica no se presenta como verdad final del negocio, sino como mapa educativo basado en evidencia local e inferencias arquitectonicas.

## Decisiones cerradas

- Mantener `spotybank-auth` y `spotybank-accounts` como servicios canonicos iniciales del caso.
- Presentar MFA como subdominio critico por su relacion con seguridad, riesgo, canales y experiencia.
- Tratar notificaciones como dominio asincronico con responsabilidad de entrega y trazabilidad.
- Mantener adapters como capa de aislamiento frente a proveedores y contratos externos.
- Mantener commons bajo revision por riesgo de acoplamiento invisible.
- Presentar `spotybank-core-ledger` como pieza pendiente de diseno educativo.

## Decisiones pendientes para versiones futuras

- Definir ejercicios resueltos de clasificacion de componentes por frontera.
- Agregar diagramas de bounded contexts o context map para una version grafica.
- Revisar fronteras propuestas con perfil de arquitectura externo.
- Crear laboratorio especifico para disenar `spotybank-core-ledger`.
