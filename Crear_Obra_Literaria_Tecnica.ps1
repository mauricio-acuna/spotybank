# =============================================================================
#  GENERADOR DE ESTRUCTURA PARA OBRA LITERARIA TÉCNICA DE ÉXITO
#  Autor: Plantilla profesional
#  Uso:   Ejecutar en PowerShell como Administrador (o usuario normal)
#         .\Crear_Obra_Literaria_Tecnica.ps1
# =============================================================================

$titulo = "SPOTYBANK_GUIA_IA_MODERNIZACION"   # Proyecto editorial del caso educativo Spotybank
$base   = Join-Path $PSScriptRoot $titulo

function Nueva-Carpeta ($ruta) {
    if (-not (Test-Path $ruta)) {
        New-Item -ItemType Directory -Path $ruta | Out-Null
    }
}

function Nuevo-Fichero ($ruta, $contenido) {
    if (-not (Test-Path $ruta)) {
        Set-Content -Path $ruta -Value $contenido -Encoding UTF8
    }
}

# ─────────────────────────────────────────────────────────────────────────────
# ÁRBOL DE CARPETAS
# ─────────────────────────────────────────────────────────────────────────────
$carpetas = @(
    "00_GESTION_PROYECTO",
    "01_INVESTIGACION\fuentes_primarias",
    "01_INVESTIGACION\fuentes_secundarias",
    "01_INVESTIGACION\notas_campo",
    "01_INVESTIGACION\referencias_bibliograficas",
    "02_PLANIFICACION",
    "03_PARTES_PRELIMINARES",
    "04_CUERPO_PRINCIPAL\CAP_01_Introduccion",
    "04_CUERPO_PRINCIPAL\CAP_02_Marco_Teorico",
    "04_CUERPO_PRINCIPAL\CAP_03_Metodologia",
    "04_CUERPO_PRINCIPAL\CAP_04_Desarrollo",
    "04_CUERPO_PRINCIPAL\CAP_05_Resultados",
    "04_CUERPO_PRINCIPAL\CAP_06_Discusion",
    "04_CUERPO_PRINCIPAL\CAP_07_Conclusiones",
    "05_APENDICES\APE_A_Datos_Complementarios",
    "05_APENDICES\APE_B_Glosario_Tecnico",
    "05_APENDICES\APE_C_Acronimos",
    "05_APENDICES\APE_D_Tablas_Extendidas",
    "05_APENDICES\APE_E_Codigo_Fuente",
    "06_PARTES_FINALES",
    "07_FIGURAS_Y_TABLAS\figuras",
    "07_FIGURAS_Y_TABLAS\tablas",
    "07_FIGURAS_Y_TABLAS\graficos",
    "08_BORRADORES",
    "09_REVISIONES\revision_01",
    "09_REVISIONES\revision_02",
    "09_REVISIONES\revision_final",
    "10_PUBLICACION\formatos_entrega",
    "10_PUBLICACION\materiales_promocionales"
)

foreach ($c in $carpetas) {
    Nueva-Carpeta (Join-Path $base $c)
}

# =============================================================================
# 00 — GESTIÓN DEL PROYECTO
# =============================================================================
Nuevo-Fichero (Join-Path $base "00_GESTION_PROYECTO\LEEME_PRIMERO.md") @"
# LEEME PRIMERO — Guía rápida del proyecto

## ¿Por dónde empezar?

1. Lee ``02_PLANIFICACION\GUIA_ESTRUCTURA_OBRA.md`` — el mapa completo de la obra.
2. Rellena ``00_GESTION_PROYECTO\FICHA_PROYECTO.md`` con los datos de tu libro.
3. Consulta ``02_PLANIFICACION\CHECKLIST_ETAPAS.md`` para seguir el progreso.
4. Escribe cada capítulo en su carpeta ``04_CUERPO_PRINCIPAL\CAP_XX_...``.

## Convención de nombres de fichero

- Borradores  : ``CAP_01_v01_BORRADOR.md``
- Revisiones  : ``CAP_01_v02_REVISION.md``
- Definitivo  : ``CAP_01_DEFINITIVO.md``
- Figuras     : ``FIG_01_descripcion.png``
- Tablas      : ``TAB_01_descripcion.xlsx``
"@

Nuevo-Fichero (Join-Path $base "00_GESTION_PROYECTO\FICHA_PROYECTO.md") @"
# FICHA DEL PROYECTO

| Campo                     | Valor                              |
|---------------------------|------------------------------------|
| Título provisional        |                                    |
| Subtítulo                 |                                    |
| Autor/es                  |                                    |
| Institución / Editorial   |                                    |
| Fecha de inicio           |                                    |
| Fecha objetivo entrega    |                                    |
| Público objetivo          |                                    |
| Idioma principal          |                                    |
| Extensión estimada (págs) |                                    |
| ISBN / DOI (si aplica)    |                                    |
| Versión actual            | 0.1                                |
| Estado                    | INVESTIGACIÓN / REDACCIÓN / EDICIÓN|

## Palabras clave (SEO / indexación)



## Resumen ejecutivo (≤ 200 palabras)


"@

Nuevo-Fichero (Join-Path $base "00_GESTION_PROYECTO\REGISTRO_CAMBIOS.md") @"
# REGISTRO DE CAMBIOS (Changelog)

## Formato de entrada
``[FECHA] [VERSIÓN] [SECCIÓN] — Descripción del cambio``

---

## Historial

"@

# =============================================================================
# 01 — INVESTIGACIÓN
# =============================================================================
Nuevo-Fichero (Join-Path $base "01_INVESTIGACION\referencias_bibliograficas\PLANTILLA_REFERENCIA.md") @"
# Plantilla de Referencia Bibliográfica

## Libro
**Autor(es):** Apellido, N. (Año). *Título del libro* (X.ª ed.). Editorial. DOI/URL

## Artículo de revista
**Autor(es):** Apellido, N. (Año). Título del artículo. *Nombre de la Revista*, volumen(número), páginas. https://doi.org/...

## Sitio web / recurso online
**Autor/Organización:** (Año, día mes). *Título de la página*. Sitio Web. URL

## Norma / estándar técnico
**Organismo:** (Año). *Código y Título de la norma* (Número de edición). Editorial.

---

## Mis referencias (ordenar por apellido)

| ID | Tipo | Cita corta | Referencia completa | Ubicación física |
|----|------|------------|---------------------|------------------|
| R01|      |            |                     |                  |
"@

Nuevo-Fichero (Join-Path $base "01_INVESTIGACION\notas_campo\PLANTILLA_NOTA.md") @"
# NOTA DE CAMPO

**Fecha:**
**Fuente / Entrevistado:**
**Tema:**
**Referencia cruzada:**

---

## Contenido


---

## Observaciones propias


"@

# =============================================================================
# 02 — PLANIFICACIÓN
# =============================================================================
Nuevo-Fichero (Join-Path $base "02_PLANIFICACION\GUIA_ESTRUCTURA_OBRA.md") @"
# GUÍA COMPLETA — Estructura de una Obra Literaria Técnica de Éxito

---

## ❶ PARTES PRELIMINARES  (carpeta: 03_PARTES_PRELIMINARES)

Las partes preliminares preceden al texto principal. Dan contexto,
legitimidad y orientan al lector antes de que empiece a leer.

### 1.1 Portada (obligatoria)
- Título principal: claro, específico, con palabras clave.
- Subtítulo: amplía o acota el alcance.
- Autor/es con afiliación institucional.
- Edición, año y sello editorial / institución.
- Logotipos si aplica.

### 1.2 Página de créditos / Copyright (obligatoria)
- Copyright © Año Autor.
- ISBN / ISSN / DOI.
- Datos de la editorial.
- Aviso legal, derechos de reproducción.
- Primera edición / reimpresión.
- Lugar de impresión.

### 1.3 Dedicatoria (opcional)
- Breve, personal. Máximo 3-4 líneas.

### 1.4 Epígrafe (opcional)
- Cita relevante de un autor reconocido. Máximo 2 estrofas o párrafo.

### 1.5 Tabla de Contenidos / Índice General (obligatoria)
- Hasta nivel 3 de profundidad (capítulo › sección › subsección).
- Numeración coherente con el texto.
- Números de página.

### 1.6 Lista de Figuras (obligatoria si hay figuras)
- Número de figura, título, página.

### 1.7 Lista de Tablas (obligatoria si hay tablas)
- Número de tabla, título, página.

### 1.8 Lista de Abreviaturas y Siglas (recomendada)
- Ordenada alfabéticamente.

### 1.9 Prólogo (opcional, escrito por tercero)
- 1-3 páginas. Firma una autoridad del campo.
- Valida el libro, da contexto histórico o personal.

### 1.10 Prefacio (escrito por el autor)
- Motivación para escribir el libro.
- Alcance, limitaciones, audiencia.
- Guía de uso del libro.
- Reconocimientos.

### 1.11 Agradecimientos (opcional, puede ir al final)
- Personas e instituciones que apoyaron la obra.

---

## ❷ CUERPO PRINCIPAL  (carpeta: 04_CUERPO_PRINCIPAL)

### FORMATO GENERAL DEL CAPÍTULO (aplicar a todos)

``````
┌─────────────────────────────────────────────────┐
│  Número y título del capítulo                   │
│  Epígrafe del capítulo (opcional)               │
│  Objetivos del capítulo (bullet 3-5 puntos)     │
│─────────────────────────────────────────────────│
│  INTRODUCCIÓN AL CAPÍTULO (≈ 5 % del texto)    │
│  › Por qué es importante este capítulo          │
│  › Qué cubre y qué no cubre                     │
│  › Cómo se relaciona con los demás capítulos    │
│─────────────────────────────────────────────────│
│  SECCIONES (≈ 80 % del texto)                   │
│  1. Sección principal                           │
│     1.1 Subsección                              │
│         1.1.1 Sub-subsección (máx. nivel 3)     │
│  [Figuras, tablas, ecuaciones numeradas]        │
│  [Cuadros de nota / advertencia / tip]          │
│  [Ejemplos y casos de uso]                      │
│─────────────────────────────────────────────────│
│  RESUMEN DEL CAPÍTULO (≈ 5 % del texto)        │
│  › Puntos clave en bullet                       │
│─────────────────────────────────────────────────│
│  PREGUNTAS / EJERCICIOS (opcional)              │
│─────────────────────────────────────────────────│
│  REFERENCIAS DEL CAPÍTULO (si no van al final) │
└─────────────────────────────────────────────────┘
``````

### CAPÍTULO 1 — Introducción (carpeta: CAP_01_Introduccion)
**Propósito:** Orientar al lector y plantear el problema o tema central.
- Contexto y antecedentes.
- Declaración del problema (problem statement).
- Justificación e importancia.
- Objetivos generales y específicos.
- Alcance y limitaciones.
- Estructura del libro (breve descripción de cada capítulo).
- Definiciones fundamentales.
*Extensión recomendada:* 5-10 % del total.

### CAPÍTULO 2 — Marco Teórico (carpeta: CAP_02_Marco_Teorico)
**Propósito:** Situar la obra dentro del conocimiento existente.
- Revisión de literatura relevante.
- Teorías, modelos y conceptos fundacionales.
- Estado del arte (qué se sabe hoy, qué gaps existen).
- Posicionamiento del libro respecto a obras anteriores.
*Extensión recomendada:* 10-20 %.

### CAPÍTULO 3 — Metodología (carpeta: CAP_03_Metodologia)
**Propósito:** Describir el enfoque y los métodos empleados.
- Diseño de la investigación o del desarrollo.
- Materiales, herramientas, software, entornos.
- Procedimientos paso a paso.
- Criterios de validación y calidad.
*Extensión recomendada:* 10-15 %.

### CAPÍTULO 4 — Desarrollo (carpeta: CAP_04_Desarrollo)
**Propósito:** Núcleo técnico de la obra.
- Puede dividirse en múltiples capítulos según la complejidad.
- Exposición detallada con ejemplos, código, diagramas.
- Comparativas, benchmarks, tablas de datos.
- Casos de estudio.
*Extensión recomendada:* 30-50 %.

### CAPÍTULO 5 — Resultados (carpeta: CAP_05_Resultados)
**Propósito:** Presentar lo obtenido de forma objetiva.
- Resultados cuantitativos y cualitativos.
- Figuras, gráficos, tablas de resultados.
- Sin interpretación (esa va en Discusión).
*Extensión recomendada:* 10-15 %.

### CAPÍTULO 6 — Discusión (carpeta: CAP_06_Discusion)
**Propósito:** Interpretar, contextualizar y debatir los resultados.
- Significado de los resultados.
- Comparación con trabajos previos.
- Implicaciones prácticas y teóricas.
- Limitaciones del trabajo.
- Líneas futuras de investigación.
*Extensión recomendada:* 10-15 %.

### CAPÍTULO 7 — Conclusiones (carpeta: CAP_07_Conclusiones)
**Propósito:** Cerrar la obra de forma contundente.
- Síntesis de los hallazgos principales.
- Respuesta explícita a los objetivos planteados.
- Aportación original al campo.
- Recomendaciones prácticas.
- Perspectivas futuras.
*Extensión recomendada:* 5 %.

---

## ❸ APÉNDICES  (carpeta: 05_APENDICES)

Los apéndices amplían o documentan sin interrumpir el flujo del texto.
Se numeran con letras: Apéndice A, B, C…

### Apéndice A — Datos Complementarios
Tablas, datos crudos, datasets, logs que complementan el cuerpo.

### Apéndice B — Glosario Técnico
Definiciones precisas de todos los términos especializados.
Formato: **Término:** Definición clara y concisa. (Referencia si aplica.)

### Apéndice C — Lista de Acrónimos y Abreviaturas
| Sigla / Acrónimo | Significado completo |
|------------------|----------------------|

### Apéndice D — Tablas Extendidas
Tablas demasiado grandes para el cuerpo principal.

### Apéndice E — Código Fuente / Algoritmos
Scripts, fragmentos de código documentados, pseudocódigo.

---

## ❹ PARTES FINALES  (carpeta: 06_PARTES_FINALES)

### 4.1 Bibliografía / Referencias (obligatoria)
- Estilo APA 7.ª ed. (ciencias sociales y aplicadas).
- IEEE (ingeniería y tecnología).
- Chicago (humanidades).
- Vancouver (ciencias de la salud).
Ordenada alfabéticamente (APA/Chicago) o por orden de cita (IEEE/Vancouver).

### 4.2 Índice Analítico / Temático (recomendado)
- Términos, conceptos, autores, organizaciones → página.
- Generado con herramienta tras la maquetación final.

### 4.3 Sobre el autor/es (recomendado)
- Biografía profesional breve (150-250 palabras por autor).
- Foto institucional opcional.
- Contacto profesional / web / ORCID / LinkedIn.

### 4.4 Contraportada (obligatoria en edición impresa)
- Sinopsis del libro (150-200 palabras).
- Público al que va dirigido.
- Reseña/s de expertos.
- ISBN / código de barras.
- Precio (si aplica).

---

## ❺ FORMATO Y ESTILO

### Tipografía
- Cuerpo de texto: 11-12 pt, interlineado 1.15-1.5.
- Títulos capítulo: 18-24 pt, negrita.
- Subtítulos: 14-16 pt, negrita.
- Código fuente: fuente monoespaciada (Consolas, Courier New) 10 pt.
- Notas al pie: 9-10 pt.

### Márgenes (A4 / Letter)
- Superior: 2.5 cm | Inferior: 2.5 cm
- Interior/Izquierdo: 3.0 cm (para encuadernación)
- Exterior/Derecho: 2.5 cm

### Numeración de páginas
- Partes preliminares: números romanos (i, ii, iii…).
- Cuerpo y siguientes: números arábigos (1, 2, 3…).

### Figuras
- Numeración: Figura X.Y (capítulo.número). Ej.: Figura 3.2.
- Pie de figura DEBAJO de la imagen.
- Resolución mínima: 300 dpi para imprenta, 72-150 dpi para pantalla.
- Formato preferido: SVG (vectorial), TIFF o PNG de alta resolución.

### Tablas
- Numeración: Tabla X.Y.
- Título ENCIMA de la tabla.
- Fuente DEBAJO si los datos son de terceros.

### Ecuaciones
- Numeradas al margen derecho: (X.Y).
- Editor de ecuaciones LaTeX o MathML.

### Citas y referencias en texto
- APA: (Apellido, Año, p. XX).
- IEEE: [1], [2]…
- Notas al pie: número superíndice¹.

### Cuadros especiales (usar con moderación)
``````
┌──────────────────┐
│ 📌 NOTA          │  Información importante pero no crítica.
│ ⚠️ ADVERTENCIA   │  Riesgo de error o daño si se ignora.
│ 💡 CONSEJO       │  Buena práctica recomendada.
│ 🔬 CASO DE ESTUDIO│ Ejemplo real aplicado.
└──────────────────┘
``````

---

## ❻ CHECKLIST DE CALIDAD ANTES DE ENVIAR A EDITORIAL

- [ ] Ortografía y gramática revisada (herramienta + revisor humano).
- [ ] Coherencia terminológica (mismo término = misma palabra en todo el libro).
- [ ] Todas las figuras/tablas referenciadas en el texto.
- [ ] Todas las referencias bibliográficas completas y en el estilo correcto.
- [ ] Numeración de páginas, figuras y tablas correcta.
- [ ] Tabla de contenidos actualizada y consistente con el texto.
- [ ] Resumen/Abstract escrito (si aplica).
- [ ] Palabras clave definidas.
- [ ] Permisos de reproducción de figuras/textos de terceros obtenidos.
- [ ] Declaración de conflicto de intereses (si aplica).
- [ ] Carta de cesión de derechos firmada (si es para editorial).
"@

Nuevo-Fichero (Join-Path $base "02_PLANIFICACION\CHECKLIST_ETAPAS.md") @"
# CHECKLIST DE ETAPAS DEL PROYECTO

## FASE 1 — Preparación y Planificación
- [ ] Definir título provisional y público objetivo.
- [ ] Establecer alcance y limitaciones de la obra.
- [ ] Seleccionar estilo bibliográfico (APA, IEEE, Chicago…).
- [ ] Diseñar estructura de capítulos (índice provisional).
- [ ] Estimar extensión total y por capítulo.
- [ ] Definir calendario de escritura (fecha entrega por capítulo).

## FASE 2 — Investigación
- [ ] Revisión bibliográfica exhaustiva.
- [ ] Organizar referencias en gestor bibliográfico (Zotero, Mendeley…).
- [ ] Identificar y obtener permisos de figuras/datos de terceros.
- [ ] Tomar notas organizadas en ``01_INVESTIGACION``.

## FASE 3 — Redacción (borrador)
- [ ] Partes preliminares (borrador).
- [ ] Capítulo 1 — Introducción.
- [ ] Capítulo 2 — Marco Teórico.
- [ ] Capítulo 3 — Metodología.
- [ ] Capítulo 4 — Desarrollo.
- [ ] Capítulo 5 — Resultados.
- [ ] Capítulo 6 — Discusión.
- [ ] Capítulo 7 — Conclusiones.
- [ ] Apéndices.
- [ ] Bibliografía.

## FASE 4 — Revisión Interna
- [ ] Autocorrección capítulo por capítulo.
- [ ] Revisión de coherencia global.
- [ ] Verificar referencias cruzadas (figuras, tablas, secciones).
- [ ] Revisión ortográfica/gramatical.
- [ ] Enviar a revisor/es de confianza.
- [ ] Incorporar feedback de revisores.

## FASE 5 — Revisión Externa / Peer Review
- [ ] Enviar borrador a expertos del campo.
- [ ] Responder a comentarios de revisores.
- [ ] Segunda ronda de revisión si es necesario.

## FASE 6 — Maquetación
- [ ] Aplicar estilos de la plantilla editorial.
- [ ] Generar tabla de contenidos definitiva.
- [ ] Generar índice analítico.
- [ ] Ajustar figuras y tablas.
- [ ] Revisión de maqueta (galeras).

## FASE 7 — Entrega y Publicación
- [ ] Entregar ficheros finales a editorial / plataforma.
- [ ] Revisión de pruebas de imprenta.
- [ ] Aprobación definitiva.
- [ ] Publicación.
- [ ] Acciones de difusión y marketing.

---

## REGISTRO DE HITOS

| Hito                        | Fecha prevista | Fecha real | Estado |
|-----------------------------|----------------|------------|--------|
| Índice provisional aprobado |                |            |        |
| Borrador completo           |                |            |        |
| Revisión interna completa   |                |            |        |
| Peer review completo        |                |            |        |
| Maqueta aprobada            |                |            |        |
| Entrega a editorial         |                |            |        |
| Publicación                 |                |            |        |
"@

Nuevo-Fichero (Join-Path $base "02_PLANIFICACION\INDICE_PROVISIONAL.md") @"
# ÍNDICE PROVISIONAL

> Instrucción: Define aquí todos los capítulos y secciones antes de escribir.
> Un buen índice es el 30 % del libro escrito.

---

## Partes Preliminares
- Portada
- Créditos / Copyright
- Dedicatoria
- Tabla de Contenidos
- Lista de Figuras
- Lista de Tablas
- Prefacio
- Agradecimientos

## Capítulo 1 — [Título]
  1.1 [Sección]
  1.2 [Sección]
  1.3 [Sección]
  Resumen del capítulo

## Capítulo 2 — [Título]
  2.1
  2.2
  Resumen del capítulo

## Capítulo 3 — [Título]
  ...

## Apéndice A — [Título]
## Apéndice B — Glosario
## Apéndice C — Acrónimos

## Partes Finales
- Bibliografía
- Índice Analítico
- Sobre el autor
"@

# =============================================================================
# 03 — PARTES PRELIMINARES
# =============================================================================
Nuevo-Fichero (Join-Path $base "03_PARTES_PRELIMINARES\PORTADA.md") @"
# PORTADA — Plantilla

---

# [TÍTULO PRINCIPAL]
## [Subtítulo descriptivo y con palabras clave]

---

**Autor/es:**
[Nombre completo, Título académico]
[Afiliación institucional]

---

[Nombre de la Editorial / Institución]
[Ciudad, País]
[Año]

[Edición: Primera edición]

---

> **Instrucciones:**
> - El título debe ser específico, no genérico. Evita títulos como "Introducción a...".
> - Incluye la palabra clave más importante en las primeras 3 palabras.
> - El subtítulo puede ser más largo y descriptivo.
> - Si es una obra académica, incluye afiliación y número de proyecto si aplica.
"@

Nuevo-Fichero (Join-Path $base "03_PARTES_PRELIMINARES\PREFACIO.md") @"
# PREFACIO

> El prefacio lo escribe el autor. Es tu voz directa al lector.
> Extensión recomendada: 2-4 páginas.

---

## Estructura recomendada del Prefacio

### ¿Por qué escribí este libro?
[Motivación personal y profesional. Qué problema o necesidad observaste.]

### ¿A quién va dirigido?
[Público primario y secundario. Nivel de conocimiento previo recomendado.]

### ¿Qué encontrarás en este libro?
[Descripción breve de cada capítulo. Guía de lectura.]

### ¿Qué NO cubre este libro?
[Establece límites claros para gestionar expectativas.]

### Cómo usar este libro
[¿Debe leerse de principio a fin? ¿Puede consultarse por capítulos?
¿Hay ejercicios? ¿Recursos online complementarios?]

### Agradecimientos
[Personas e instituciones que hicieron posible la obra.]

---

[Ciudad, Mes Año]
[Firma del autor]
"@

# =============================================================================
# PLANTILLAS DE CAPÍTULOS
# =============================================================================
$caps = @{
    "CAP_01_Introduccion"   = "Introducción"
    "CAP_02_Marco_Teorico"  = "Marco Teórico"
    "CAP_03_Metodologia"    = "Metodología"
    "CAP_04_Desarrollo"     = "Desarrollo"
    "CAP_05_Resultados"     = "Resultados"
    "CAP_06_Discusion"      = "Discusión"
    "CAP_07_Conclusiones"   = "Conclusiones"
}

$n = 1
foreach ($key in ($caps.Keys | Sort-Object)) {
    $num  = $n.ToString("D2")
    $name = $caps[$key]
    Nuevo-Fichero (Join-Path $base "04_CUERPO_PRINCIPAL\$key\CAP_${num}_BORRADOR.md") @"
# Capítulo $num — $name

> **EPÍGRAFE (opcional):**
> "Cita inspiradora relacionada con el capítulo."
> — Autor de la cita

---

## Objetivos del capítulo

Al finalizar este capítulo, el lector será capaz de:
- Objetivo 1.
- Objetivo 2.
- Objetivo 3.

---

## $num.1 Introducción al capítulo

[5 % del capítulo. Explica por qué este capítulo es importante,
qué cubre y cómo se relaciona con los anteriores y siguientes.]

---

## $num.2 [Título de la primera sección]

[Desarrollo del contenido.]

### $num.2.1 [Subsección]

[Contenido detallado.]

> 📌 **NOTA:** [Información relevante que el lector no debe pasar por alto.]

---

## $num.3 [Título de la segunda sección]

[Desarrollo del contenido.]

> ⚠️ **ADVERTENCIA:** [Riesgo de error o malentendido frecuente.]

---

## $num.4 [Título de la tercera sección]

[Desarrollo del contenido.]

> 💡 **CONSEJO:** [Buena práctica recomendada por el autor.]

---

## Resumen del capítulo

Los puntos clave de este capítulo son:

- **Punto 1:** [Síntesis.]
- **Punto 2:** [Síntesis.]
- **Punto 3:** [Síntesis.]

---

## Preguntas de revisión

1. [Pregunta conceptual]
2. [Pregunta de aplicación]
3. [Ejercicio práctico]

---

## Referencias del capítulo

[Lista de referencias citadas en este capítulo en el estilo elegido.]
"@
    Nuevo-Fichero (Join-Path $base "04_CUERPO_PRINCIPAL\$key\NOTAS_INVESTIGACION.md") @"
# Notas de investigación — Capítulo $num

## Fuentes a revisar
-

## Ideas clave
-

## Borradores de argumentos
-

## Preguntas pendientes
-
"@
    $n++
}

# =============================================================================
# 05 — APÉNDICES
# =============================================================================
Nuevo-Fichero (Join-Path $base "05_APENDICES\APE_B_Glosario_Tecnico\GLOSARIO.md") @"
# APÉNDICE B — Glosario Técnico

> Ordenar alfabéticamente. Incluir todos los términos especializados
> que se usen en el libro, especialmente los que pueden ser ambiguos.

---

**Término:** Definición precisa y completa en una o dos oraciones.
*(Referencia: Autor, Año, p. XX si la definición es de terceros.)*

---

| Término | Definición | Referencia |
|---------|------------|------------|
|         |            |            |
"@

Nuevo-Fichero (Join-Path $base "05_APENDICES\APE_C_Acronimos\ACRONIMOS.md") @"
# APÉNDICE C — Lista de Acrónimos y Abreviaturas

> Incluir TODOS los acrónimos usados en el texto, incluso los comunes.
> Ordenar alfabéticamente.

---

| Sigla / Acrónimo | Significado completo | Primera aparición (Capítulo/Página) |
|------------------|----------------------|-------------------------------------|
| API              | Application Programming Interface | Cap. 1, p. X |
|                  |                      |                                     |
"@

Nuevo-Fichero (Join-Path $base "05_APENDICES\APE_E_Codigo_Fuente\INSTRUCCIONES_CODIGO.md") @"
# APÉNDICE E — Código Fuente

## Instrucciones de uso

1. El código incluido es complementario al Capítulo X.
2. Requisitos de entorno: [SO, versión del lenguaje, dependencias].
3. Cómo ejecutar:

``````bash
# Instrucción de ejecución
``````

## Estructura del código

``````
APE_E_Codigo_Fuente/
├── src/
│   ├── modulo_principal.ext
│   └── utilidades.ext
├── tests/
└── README.md
``````

## Licencia del código

[MIT / Apache 2.0 / GPL / Propietaria]
"@

# =============================================================================
# 06 — PARTES FINALES
# =============================================================================
Nuevo-Fichero (Join-Path $base "06_PARTES_FINALES\BIBLIOGRAFIA.md") @"
# BIBLIOGRAFÍA

> **Estilo seleccionado:** [APA 7.ª / IEEE / Chicago / Vancouver]
> Ordenar según el estilo: alfabéticamente (APA) o por orden de cita (IEEE).

---

## Libros


## Artículos de revista


## Conferencias / Congresos


## Informes técnicos / Normas


## Recursos en línea


## Tesis y disertaciones

"@

Nuevo-Fichero (Join-Path $base "06_PARTES_FINALES\SOBRE_EL_AUTOR.md") @"
# SOBRE EL AUTOR

## [Nombre completo del autor]

[Párrafo 1: Cargo actual, institución, país. Especialidad principal.
Extensión: 2-3 oraciones.]

[Párrafo 2: Trayectoria académica y profesional relevante.
Principales publicaciones, proyectos, premios. 3-4 oraciones.]

[Párrafo 3: Líneas de investigación actuales. Proyectos en curso.
1-2 oraciones.]

**Contacto:**
- Web: https://
- ORCID: https://orcid.org/
- LinkedIn: https://linkedin.com/in/
- Email profesional: autor@institucion.edu

---

*(Foto institucional: insertar imagen en alta resolución — mínimo 300 dpi)*
"@

Nuevo-Fichero (Join-Path $base "06_PARTES_FINALES\CONTRAPORTADA.md") @"
# CONTRAPORTADA

> Extensión: 150-200 palabras. Es la primera lectura de quien hojea el libro.
> Debe responder: ¿Qué aprenderé? ¿Por qué este libro y no otro?

---

## Sinopsis del libro

[2-3 párrafos que resuman el contenido, el enfoque y el valor único de la obra.
Sin tecnicismos excesivos. Orientado al beneficio del lector.]

---

## Público al que va dirigido

- [Perfil 1: ej. Ingenieros de software con 2+ años de experiencia.]
- [Perfil 2: ej. Estudiantes de último año de carrera técnica.]
- [Perfil 3: ej. Gestores de proyectos tecnológicos.]

---

## Reseñas de expertos

> "Cita de un experto reconocido sobre el libro."
> — Nombre, Cargo, Institución

---

**ISBN:** 978-X-XXXXX-XXX-X

[Logo editorial]        [Código de barras ISBN]        [Precio si aplica]
"@

# =============================================================================
# 07 — FIGURAS Y TABLAS
# =============================================================================
Nuevo-Fichero (Join-Path $base "07_FIGURAS_Y_TABLAS\REGISTRO_FIGURAS_TABLAS.md") @"
# REGISTRO DE FIGURAS Y TABLAS

## Figuras

| ID      | Capítulo | Número | Título / Descripción | Origen | Permiso | Archivo |
|---------|----------|--------|----------------------|--------|---------|---------|
| FIG_001 | 1        | 1.1    |                      | Propio | N/A     |         |

## Tablas

| ID      | Capítulo | Número | Título               | Origen | Permiso | Archivo |
|---------|----------|--------|----------------------|--------|---------|---------|
| TAB_001 | 1        | 1.1    |                      | Propio | N/A     |         |

---

## Instrucciones de nombrado de archivos

- Figuras:  ``FIG_[cap].[num]_[descripcion_corta].[ext]``
  Ejemplo:  ``FIG_3.2_diagrama_arquitectura.svg``
- Tablas:   ``TAB_[cap].[num]_[descripcion_corta].[xlsx|csv]``
  Ejemplo:  ``TAB_5.1_resultados_benchmark.xlsx``
"@

# =============================================================================
# 09 — REVISIONES
# =============================================================================
Nuevo-Fichero (Join-Path $base "09_REVISIONES\PLANTILLA_REVISION.md") @"
# PLANTILLA DE REVISIÓN

**Revisor:**
**Fecha:**
**Versión revisada:**
**Ronda de revisión:** 1 / 2 / Final

---

## EVALUACIÓN GLOBAL

| Criterio                        | Puntuación (1-5) | Comentario |
|---------------------------------|------------------|------------|
| Claridad y legibilidad          |                  |            |
| Rigor técnico / científico      |                  |            |
| Estructura y organización       |                  |            |
| Pertinencia de figuras/tablas   |                  |            |
| Calidad de referencias          |                  |            |
| Originalidad / Aportación       |                  |            |

**Recomendación:**
- [ ] Aceptar sin cambios
- [ ] Aceptar con cambios menores
- [ ] Revisar y reenviar
- [ ] Rechazar

---

## COMENTARIOS POR SECCIÓN

### Partes Preliminares


### Capítulo 1


### Capítulo 2


### (continuar por cada capítulo)


### Apéndices


### Bibliografía


---

## COMENTARIOS GENERALES


"@

# =============================================================================
# 10 — PUBLICACIÓN
# =============================================================================
Nuevo-Fichero (Join-Path $base "10_PUBLICACION\formatos_entrega\REQUISITOS_EDITORIAL.md") @"
# REQUISITOS DE ENTREGA A EDITORIAL

> Completa con los requisitos específicos de tu editorial o plataforma.

---

## Formato de los ficheros
- Texto: [ ] .docx  [ ] .odt  [ ] LaTeX  [ ] Markdown
- Imágenes: mínimo ___ dpi, formato ___
- Tamaño máximo de fichero adjunto: ___

## Estilo bibliográfico requerido
- [ ] APA 7.ª  [ ] IEEE  [ ] Chicago  [ ] Vancouver  [ ] Otro: ___

## Extensión
- Mínimo: ___ palabras / páginas
- Máximo: ___ palabras / páginas

## Metadatos requeridos
- Título y subtítulo definitivos
- Palabras clave (mínimo ___, máximo ___)
- Resumen / Abstract (máximo ___ palabras)
- Clasificación temática: ___

## Declaraciones requeridas
- [ ] Declaración de originalidad
- [ ] Declaración de conflicto de intereses
- [ ] Cesión de derechos
- [ ] Financiación y agradecimientos

## Contacto editorial
- Nombre del editor/a responsable:
- Email:
- Portal de envío:
"@

Nuevo-Fichero (Join-Path $base "10_PUBLICACION\materiales_promocionales\PLAN_DIFUSION.md") @"
# PLAN DE DIFUSIÓN Y MARKETING DE LA OBRA

---

## 1. Propuesta de valor única (UVP)
[En 2-3 frases: ¿Por qué ESTE libro y no los existentes?]

## 2. Audiencias objetivo
- **Primaria:** [Descripción detallada]
- **Secundaria:** [Descripción detallada]

## 3. Canales de distribución
- [ ] Venta directa en web propia
- [ ] Amazon / eBooks
- [ ] Google Play Books
- [ ] ResearchGate / Academia.edu (acceso abierto parcial)
- [ ] Librerías técnicas especializadas
- [ ] Editorial universitaria

## 4. Acciones previas al lanzamiento (pre-launch)
- [ ] Landing page o página de pre-venta.
- [ ] Lista de correo / newsletter para anunciar el lanzamiento.
- [ ] Advance Reader Copies (ARCs) a influencers del sector.
- [ ] Artículo de blog o podcast anunciando la obra.

## 5. Acciones en el lanzamiento
- [ ] Nota de prensa.
- [ ] Webinar / presentación online.
- [ ] Posts en LinkedIn, Twitter/X, ResearchGate.
- [ ] Email a la lista de suscriptores.

## 6. Acciones post-lanzamiento
- [ ] Artículos derivados en revistas o blogs.
- [ ] Curso o taller basado en el libro.
- [ ] Ponencias en congresos referenciando la obra.
- [ ] Reseñas en plataformas especializadas.
"@

# =============================================================================
# FICHERO RAÍZ DE BIENVENIDA
# =============================================================================
Nuevo-Fichero (Join-Path $base "README.md") @"
# $titulo — Proyecto de Obra Literaria Técnica

## Estructura del proyecto

``````
$titulo/
│
├── 00_GESTION_PROYECTO/       → Ficha, changelog, instrucciones generales
├── 01_INVESTIGACION/          → Fuentes, notas, bibliografía
├── 02_PLANIFICACION/          → Guía completa, checklist, índice provisional
├── 03_PARTES_PRELIMINARES/    → Portada, prefacio, etc.
├── 04_CUERPO_PRINCIPAL/       → Un subcarpeta por capítulo
│   ├── CAP_01_Introduccion/
│   ├── CAP_02_Marco_Teorico/
│   ├── CAP_03_Metodologia/
│   ├── CAP_04_Desarrollo/
│   ├── CAP_05_Resultados/
│   ├── CAP_06_Discusion/
│   └── CAP_07_Conclusiones/
├── 05_APENDICES/              → Apéndices A-E
├── 06_PARTES_FINALES/         → Bibliografía, sobre el autor, contraportada
├── 07_FIGURAS_Y_TABLAS/       → Registro y archivos de figuras y tablas
├── 08_BORRADORES/             → Borradores libres, ideas sueltas
├── 09_REVISIONES/             → Plantillas y rondas de revisión
└── 10_PUBLICACION/            → Requisitos editoriales, plan de difusión
``````

## Punto de partida recomendado

1. ``00_GESTION_PROYECTO\LEEME_PRIMERO.md``
2. ``02_PLANIFICACION\GUIA_ESTRUCTURA_OBRA.md``
3. ``02_PLANIFICACION\CHECKLIST_ETAPAS.md``
4. ``00_GESTION_PROYECTO\FICHA_PROYECTO.md``
"@

# =============================================================================
# RESUMEN FINAL
# =============================================================================
Write-Host ""
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host "  ESTRUCTURA CREADA CORRECTAMENTE" -ForegroundColor Green
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Proyecto : $titulo" -ForegroundColor Yellow
Write-Host "  Ubicacion: $base" -ForegroundColor Yellow
Write-Host ""
Write-Host "  Carpetas principales creadas:" -ForegroundColor White
Get-ChildItem $base -Directory | ForEach-Object { Write-Host "   ✓ $($_.Name)" -ForegroundColor Green }
Write-Host ""
Write-Host "  Empieza por:" -ForegroundColor White
Write-Host "   → $base\00_GESTION_PROYECTO\LEEME_PRIMERO.md" -ForegroundColor Cyan
Write-Host "   → $base\02_PLANIFICACION\GUIA_ESTRUCTURA_OBRA.md" -ForegroundColor Cyan
Write-Host ""
Write-Host "============================================================" -ForegroundColor Cyan
