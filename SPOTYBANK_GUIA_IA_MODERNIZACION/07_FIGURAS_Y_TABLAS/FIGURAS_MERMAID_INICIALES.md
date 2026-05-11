# Figuras Mermaid iniciales

Estas figuras son borradores editoriales. Pueden usarse en Markdown, exportarse a SVG/PNG o reemplazarse luego por piezas graficas finales.

## FIG_008 - Unidad minima de despliegue cloud native

```mermaid
flowchart LR
  A[Codigo fuente] --> B[Build Maven]
  B --> C[Imagen de contenedor]
  C --> D[Deployment]
  E[ConfigMap] --> D
  F[Secrets ficticios] --> D
  D --> G[Service]
  G --> H[Ingress o Route]
  D --> I[Liveness]
  D --> J[Readiness]
  D --> K[Logs, metricas y trazas]
```

Uso editorial: capitulo 8.

## FIG_009 - Flujo de observabilidad para performance

```mermaid
flowchart TB
  A[Request o mensaje] --> B[Servicio Spotybank]
  B --> C[Logs estructurados]
  B --> D[Metricas]
  B --> E[Trazas distribuidas]
  B --> F[Eventos de broker]
  C --> G[Analisis de incidente]
  D --> G
  E --> G
  F --> G
  G --> H[Mejora o runbook]
```

Uso editorial: capitulo 9.

## FIG_010 - Ciclo de trabajo con IA y validacion humana

```mermaid
flowchart LR
  A[Inspeccion local] --> B[Sintesis asistida por IA]
  B --> C[Clasificar evidencia e inferencia]
  C --> D[Revision humana]
  D --> E[Backlog o documento]
  E --> F[Validacion con prueba u owner]
  F --> G[Publicacion segura]
  G --> A
```

Uso editorial: capitulo 10.

## FIG_011 - Rutas formativas por perfil

```mermaid
mindmap
  root((Spotybank))
    Backend
      Inventario
      Pruebas
      Modernizacion
    Arquitectura
      Dominios
      Contratos
      ADR
    Seguridad
      Saneamiento
      Threat model
      DevSecOps
    DevOps/SRE
      Despliegue
      Observabilidad
      Resiliencia
    QA
      Datos sinteticos
      Contratos
      Carga
    Docencia
      Clase
      Rubrica
      Proyecto final
```

Uso editorial: capitulo 11.

## FIG_012 - Roadmap de evolucion por fases

```mermaid
timeline
  title Roadmap Spotybank
  Fase 0 : Saneamiento e identidad educativa
  Fase 1 : MVP educativo
  Fase 2 : Version docente
  Fase 3 : Version tecnica ejecutable
  Fase 4 : Plataforma cloud native
  Fase 5 : Seguridad y DevSecOps
  Fase 6 : Performance y resiliencia
```

Uso editorial: capitulo 12.
