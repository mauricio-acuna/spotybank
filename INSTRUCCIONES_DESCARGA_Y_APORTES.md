# Instrucciones de descarga y aportes desde otro ordenador

Este documento explica como descargar la obra literaria tecnica Spotybank desde GitHub y continuar aportando desde otro ordenador.

El repositorio publicado contiene solo la obra literaria. No debe usarse para subir microservicios, configuraciones privadas, archivos `.env`, credenciales, zips originales ni material con identidad de entidades reales.

## Repositorio

- URL: `https://github.com/mauricio-acuna/spotybank.git`
- Rama principal: `main`
- Contenido esperado: obra literaria tecnica Spotybank, scripts editoriales y tablero de estado de la obra.

## Requisitos del ordenador nuevo

1. Tener Git instalado.
2. Tener acceso al repositorio GitHub.
3. Tener credenciales GitHub configuradas en Git Credential Manager o usar un token personal.
4. Tener PowerShell disponible si se van a usar los scripts de publicacion.

Validar Git:

```powershell
git --version
git config --global user.name
git config --global user.email
```

Si falta identidad Git:

```powershell
git config --global user.name "Tu Nombre"
git config --global user.email "tu-email@example.com"
```

## Descargar la obra en otro ordenador

Elegir una carpeta de trabajo y clonar el repo:

```powershell
mkdir D:\j\Spotybank
cd D:\j\Spotybank
git clone https://github.com/mauricio-acuna/spotybank.git ObraLiteraria
cd ObraLiteraria
```

Validar que el clon quedo bien conectado:

```powershell
git status -sb
git remote -v
```

Resultado esperado:

```text
## main...origin/main
origin  https://github.com/mauricio-acuna/spotybank.git (fetch)
origin  https://github.com/mauricio-acuna/spotybank.git (push)
```

## Continuar aportando

Antes de editar, traer la ultima version:

```powershell
git pull --rebase origin main
```

Luego editar los documentos Markdown de la obra. Los lugares mas comunes para continuar son:

- `SPOTYBANK_GUIA_IA_MODERNIZACION/00_GESTION_PROYECTO/statusObraLiteraria.md`
- `SPOTYBANK_GUIA_IA_MODERNIZACION/02_PLANIFICACION/INDICE_PROVISIONAL.md`
- `SPOTYBANK_GUIA_IA_MODERNIZACION/04_CUERPO_PRINCIPAL/`
- `SPOTYBANK_GUIA_IA_MODERNIZACION/07_FIGURAS_Y_TABLAS/`

## Publicar aportes con el script recomendado

Desde la raiz del repo clonado:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\Publicar_ObraLiteraria_Spotybank.ps1
```

El script realiza estas tareas:

1. Verifica que se este trabajando dentro del repo de la obra.
2. Ejecuta un escaneo basico para evitar referencias no publicables.
3. Agrega cambios.
4. Crea un commit si hay cambios.
5. Trae cambios remotos con `git pull --rebase origin main`.
6. Publica en GitHub con `git push`.
7. Deja logs locales en `_logs/`, carpeta ignorada por Git.

## Publicar aportes manualmente

Usar este flujo si no se quiere ejecutar el script:

```powershell
git pull --rebase origin main
git status -sb
git add -A
git commit -m "docs: actualiza obra literaria Spotybank"
git push origin main
```

Si no hay cambios, `git commit` indicara que no hay nada para confirmar.

## Activar actualizacion automatica en el ordenador nuevo

La actualizacion automatica es opcional. Conviene activarla solo en ordenadores que realmente se usen para editar la obra.

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\Instalar_Tareas_Actualizacion_Obra.ps1
```

Horarios configurados por defecto:

- 09:00
- 14:00
- 19:00

Para quitar la tarea:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\Desinstalar_Tareas_Actualizacion_Obra.ps1
```

## Trabajo desde dos ordenadores

Regla simple: antes de escribir, ejecutar `git pull --rebase origin main`.

Si dos ordenadores publican cambios en los mismos archivos, Git puede pedir resolver conflictos. En ese caso:

```powershell
git pull --rebase origin main
```

Editar los archivos marcados en conflicto, dejar la version correcta, y continuar:

```powershell
git add -A
git rebase --continue
git push origin main
```

Si el conflicto es complejo, detenerse y revisar el capitulo completo antes de elegir que texto conservar.

## Que no debe subirse

- Material de microservicios reales fuera de la obra literaria.
- `settings.xml`, `.env`, credenciales, tokens, passwords o llaves.
- Archivos `.zip`, `.rar`, `.7z` con contenido historico no saneado.
- Referencias a entidades financieras reales.
- Nombres de personas desarrolladoras previas.
- Dominios corporativos antiguos.

La identidad publica del caso debe mantenerse como `Spotybank`.

## Recuperacion rapida

Ver cambios locales:

```powershell
git status -sb
git diff
```

Descartar cambios de un archivo concreto, solo si se esta seguro:

```powershell
git restore ruta\del\archivo.md
```

Volver a la ultima version publicada, solo para archivos no confirmados:

```powershell
git restore .
```

Evitar comandos destructivos como `git reset --hard` salvo que exista una copia o se entienda exactamente que se perdera.
