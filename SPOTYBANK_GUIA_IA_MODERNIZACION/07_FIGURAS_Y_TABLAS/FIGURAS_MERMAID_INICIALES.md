# Figuras Mermaid iniciales

Estas figuras son borradores editoriales. Pueden usarse en Markdown, exportarse a SVG/PNG o reemplazarse luego por piezas graficas finales.

## FIG_001 - Spotybank como caso educativo

```mermaid
flowchart LR
  A[Fuentes saneadas] --> B[Documentacion tecnica]
  B --> C[Obra literaria tecnica]
  C --> D[Fasciculos por perfil]
  D --> E[Laboratorios]
  E --> F[Proyecto educativo]
  F --> G[Mejora continua]
```

Uso editorial: capitulo 1.

## FIG_002 - Inventario tecnico desde fuentes

```mermaid
flowchart TB
  A[Workspace Spotybank] --> B[POMs]
  A --> C[Codigo Java]
  A --> D[Properties]
  A --> E[Dockerfiles]
  A --> F[YAML]
  B --> G[Stack y dependencias]
  C --> H[Servicios y adapters]
  D --> I[Configuracion]
  E --> J[Contenedores]
  F --> K[Despliegue]
  G --> L[Mapa de evidencia]
  H --> L
  I --> L
  J --> L
  K --> L
```

Uso editorial: capitulo 2.

## FIG_003 - Saneamiento de identidad

```mermaid
flowchart LR
  A[Material historico] --> B[Deteccion de identidad]
  B --> C[Reemplazo por Spotybank]
  C --> D[Credenciales ficticias]
  D --> E[Escaneo de seguridad]
  E --> F[Material publicable]
  E --> G[Correccion si hay hallazgos]
  G --> C
```

Uso editorial: capitulo 3.

## FIG_004 - Documentacion viva

```mermaid
flowchart TB
  A[Codigo y configuracion] --> B[Extraccion automatizada]
  B --> C[README por servicio]
  B --> D[Catalogos tecnicos]
  B --> E[Diagramas]
  C --> F[Revision]
  D --> F
  E --> F
  F --> G[Status actualizado]
  G --> H[Backlog tecnico]
  H --> A
```

Uso editorial: capitulo 4.

## FIG_005 - Dominios y fronteras Spotybank

```mermaid
flowchart LR
  A[spotybank-auth] --> B[Identidad y acceso]
  C[spotybank-accounts] --> D[Cuentas]
  E[spotybank-core-ledger] --> F[Ledger propuesto]
  G[MFA] --> B
  H[Notificaciones] --> I[Canales]
  J[Adapters externos] --> K[Capa anticorrupcion]
  K --> B
  K --> D
  K --> F
```

Uso editorial: capitulo 5.

## FIG_006 - Modernizacion por oleadas

```mermaid
flowchart LR
  A[Baseline] --> B[Pruebas]
  B --> C[Seguridad]
  C --> D[Observabilidad]
  D --> E[Runtime]
  E --> F[Contratos]
  F --> G[Cloud native]
  G --> H[Performance]
  H --> I[Supply chain]
```

Uso editorial: capitulo 6.

## FIG_007 - DevSecOps educativo

```mermaid
flowchart TB
  A[Commit educativo] --> B[Escaneo de secretos]
  B --> C[Revision de dependencias]
  C --> D[Pruebas]
  D --> E[SBOM]
  E --> F[Artefacto publicable]
  B --> G[Bloqueo]
  C --> G
  G --> H[Correccion]
  H --> A
```

Uso editorial: capitulo 7.

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
