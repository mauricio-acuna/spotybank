# Notas de investigacion - Capitulo 07

## Fuentes revisadas

- `Documentacion/arquitectura/seguridad-y-riesgos.md`
- `Documentacion/seguridad/inventario-config-sensible.md`
- `Documentacion/arquitectura/backlog-tecnico.md`
- `Documentacion/arquitectura/despliegue-nube.md`
- `Documentacion/arquitectura/catalogo-mensajeria.md`
- `SPOTYBANK_GUIA_IA_MODERNIZACION/02_PLANIFICACION/MAPA_MODERNIZACION_DESDE_FUENTES.md`
- `SPOTYBANK_GUIA_IA_MODERNIZACION/04_CUERPO_PRINCIPAL/CAP_03_Metodologia/CAP_03_BORRADOR.md`
- `Publicar_ObraLiteraria_Spotybank.ps1`

## Ideas clave

- Seguridad empieza con saneamiento editorial, pero no termina ahi.
- Spotybank debe separar seguridad de publicacion, aplicacion y plataforma.
- Secretos, Actuator, MFA, logs, dependencias, contenedores y mensajeria son superficies prioritarias.
- DevSecOps es una cadena de controles, no una herramienta aislada.
- SBOM, escaneo de imagenes y procedencia ayudan a gobernar supply chain.
- La IA puede ayudar en revision y backlog, pero no debe recibir secretos ni cerrar hallazgos sin evidencia.

## Argumento editorial

El capitulo debe conectar la seguridad educativa del caso con seguridad operativa. La obra no despliega un banco real, pero usa un contexto bancario para ensenar disciplina: proteger secretos, reducir superficie, versionar contratos, controlar supply chain y convertir hallazgos en trabajo verificable.

La idea central es que un hallazgo de seguridad solo sirve si termina en una accion con evidencia de cierre.

## Decisiones cerradas

- Mantener tres niveles: saneamiento educativo, seguridad de aplicacion y seguridad de plataforma.
- Incluir modelo de amenazas minimo para ejercicios.
- Priorizar secretos, MFA, Actuator, dependencias, contenedores y mensajeria.
- Considerar publicacion segura del caso como parte de la cadena DevSecOps.
- Exigir backlog accionable con criticidad, evidencia y criterio de cierre.

## Decisiones pendientes para versiones futuras

- Crear checklist ASVS/API Top 10 adaptado a Spotybank.
- Agregar ejemplo resuelto de threat modeling para MFA.
- Definir plantilla de ticket de seguridad con evidencia de cierre.
- Revisar controles con perfil de seguridad externo antes de una edicion formal.
