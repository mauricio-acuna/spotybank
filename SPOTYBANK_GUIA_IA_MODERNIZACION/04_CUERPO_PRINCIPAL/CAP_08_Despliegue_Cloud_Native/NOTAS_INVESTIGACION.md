# Notas de investigacion - Capitulo 08

## Fuentes revisadas

- `Documentacion/arquitectura/despliegue-nube.md`
- `Documentacion/arquitectura/matriz-despliegue.md`
- `Documentacion/arquitectura/escalamiento-performance.md`
- `Documentacion/arquitectura/seguridad-y-riesgos.md`
- `Documentacion/runbooks/incidentes-comunes.md`
- `SPOTYBANK_GUIA_IA_MODERNIZACION/02_PLANIFICACION/MAPA_MODERNIZACION_DESDE_FUENTES.md`
- `SPOTYBANK_GUIA_IA_MODERNIZACION/02_PLANIFICACION/FASCICULOS_EJECUTABLES_POR_PERFIL.md`
- `SPOTYBANK_GUIA_IA_MODERNIZACION/04_CUERPO_PRINCIPAL/CAP_07_Conclusiones/CAP_07_BORRADOR.md`

## Ideas clave

- Estar containerizado no equivale a operar cloud native.
- Cada servicio necesita un contrato de runtime: imagen, puerto, config, secretos, probes, recursos, red y rollback.
- Los escenarios educativos deben diferenciar local, laboratorio, staging y produccion simulada.
- Probes, requests, limits y HPA requieren semantica y medicion.
- GitOps convierte plataforma en estado deseado revisable.
- Continuidad requiere restauracion probada; un backup no probado no es garantia.

## Argumento editorial

El capitulo debe mostrar la distancia entre ejecutar contenedores y operar microservicios. Spotybank funciona como caso para ensenar que cloud native es disciplina operativa: declarar runtime, controlar cambios, observar flujos, proteger secretos y probar recuperacion.

La obra debe evitar prometer produccion real. Los escenarios propuestos son educativos y simulados; produccion bancaria requeriria validaciones externas, compliance, soporte y decision institucional.

## Decisiones cerradas

- Mantener Kubernetes/OpenShift como plataforma educativa principal.
- Separar escenarios: local, laboratorio educativo, staging educativo y produccion simulada.
- Incluir unidad minima de despliegue por servicio.
- Reforzar probes, resources, HPA, GitOps y network policies como controles operativos.
- Mantener datos sinteticos como regla para ambientes educativos.
- Cerrar el capitulo con contrato runtime, criterios de HPA, rollout, GitOps, continuidad y ficha de despliegue verificable.
- Registrar que no quedan pendientes editoriales internos para el capitulo 8 en el ciclo `v0.2-editorial`.

## Mejoras futuras no bloqueantes

- Definir laboratorio concreto con OpenShift Local, Kind o Minikube.
- Crear figura de unidad minima de despliegue.
- Agregar manifiesto modelo con probes, resources y secretos ficticios.
- Revisar runbooks con perfil DevOps/SRE externo.
