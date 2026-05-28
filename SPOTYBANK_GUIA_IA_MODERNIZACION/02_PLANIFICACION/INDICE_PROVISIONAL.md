# Indice Provisional

Estado de consistencia: alineado con capitulos 1 a 12 en `CERRADO_TECNICO`.

Este indice mantiene el nombre historico de trabajo, pero funciona como mapa tecnico-editorial de lectura para el ciclo `v0.2-editorial`.

## Partes preliminares

- Portada.
- Prefacio: por que Spotybank como caso testigo.
- Como usar esta obra en universidad, empresa o centro de formacion.

## Parte I - El Caso Spotybank

## Capitulo 1 - Introduccion

1.1 Que es Spotybank
1.2 Por que un sistema legacy es valioso para aprender
1.3 El rol de la IA como copiloto de diagnostico y modernizacion
1.4 Alcance, limites y supuestos del caso
1.5 Perfiles de lectura
1.6 Como leer esta guia
1.7 Actividad inicial: abrir el caso sin romperlo

## Capitulo 2 - Inventario tecnico inicial

2.1 Por que empezar por inventario
2.2 Evidencia disponible en Spotybank
2.3 Microservicios, librerias y artefactos Maven
2.4 Stack tecnologico detectado
2.5 Configuracion, secretos y riesgos de exposicion
2.6 Dependencias entre servicios
2.7 Evidencia local contra validacion externa
2.8 Uso de IA durante el inventario
2.9 Ejercicio practico

## Parte II - Limpieza, Identidad y Documentacion

## Capitulo 3 - Anonimizacion y rebranding seguro

3.1 Anonimizar antes de ensenar
3.2 Tres niveles de limpieza
3.3 Amenazas editoriales de un caso tecnico
3.4 Identidad tecnica nueva
3.5 Paquetes, namespaces y trazabilidad
3.6 Configuracion, secretos y placeholders
3.7 Dominios, endpoints, colas y ambientes
3.8 Datos, tablas y prefijos
3.9 Artefactos no inspeccionados
3.10 Scripts historicos de refactor
3.11 Evidencia, inferencia y decision pendiente
3.12 Uso de IA durante el saneamiento

## Capitulo 4 - Documentacion viva de microservicios

4.1 Documentar no es decorar
4.2 Tres tipos de documentacion
4.3 README por microservicio
4.4 Documentacion por funcionalidad
4.5 Matriz central de relaciones
4.6 Catalogo de endpoints y rutas
4.7 Catalogo de mensajeria
4.8 Documentacion operacional
4.9 Definicion de done documental
4.10 Gobernanza documental
4.11 Uso de IA para documentacion viva
4.12 Calidad documental

## Parte III - Arquitectura y modernizacion

## Capitulo 5 - Dominios bancarios y fronteras de servicio

5.1 Por que hablar de dominios
5.2 Evidencia, inferencia y frontera
5.3 Zonas visibles en Spotybank
5.4 Servicio desplegable no es dominio
5.5 `spotybank-auth`
5.6 `spotybank-accounts`
5.7 MFA como subdominio critico
5.8 Notificaciones como dominio asincronico
5.9 Integraciones y anti-corruption layer
5.10 Commons: ayuda y riesgo
5.11 La pieza de diseno: `spotybank-core-ledger`
5.12 Propuesta de frontera canonica
5.13 Criterios para mover fronteras

## Capitulo 6 - Modernizacion de backend

6.1 Modernizar no es reescribir
6.2 Punto de partida tecnologico
6.3 Separar capas de cambio
6.4 Baseline antes del upgrade
6.5 Estrategia de oleadas
6.6 Elegir un piloto
6.7 Maven y parents educativos
6.8 Java LTS y runtime
6.9 Spring Boot, Spring MVC y configuracion
6.10 Camel, Fuse, SOAP y adapters
6.11 Swagger, OpenAPI y contratos
6.12 Testing como red de seguridad
6.13 Resiliencia y retiro de deuda
6.14 Observabilidad durante la migracion
6.15 Rollback y criterios de salida
6.16 Roadmap recomendado para Spotybank

## Parte IV - Nube, seguridad y operacion

## Capitulo 7 - Seguridad y DevSecOps

7.1 Seguridad como condicion de aprendizaje
7.2 Tres niveles de seguridad
7.3 Modelo de amenazas minimo
7.4 Gestion de secretos
7.5 Endpoints, Actuator y superficie expuesta
7.6 Autenticacion y autorizacion
7.7 Seguridad en MFA
7.8 Datos, logs y privacidad
7.9 Dependencias, SBOM y supply chain
7.10 Seguridad de contenedores y despliegue
7.11 Mensajeria segura
7.12 DevSecOps en el pipeline
7.13 Publicacion segura del caso educativo
7.14 Uso de IA en seguridad
7.15 Backlog de seguridad para Spotybank

## Capitulo 8 - Despliegue cloud native

8.1 Desplegar no es solo levantar contenedores
8.2 Escenarios de despliegue
8.3 Kubernetes u OpenShift como plataforma educativa
8.4 Unidad minima de despliegue
8.5 Configuracion externa
8.6 Secrets y entornos educativos
8.7 Probes reales
8.8 Resources, capacity y HPA
8.9 Pipeline CI/CD
8.10 GitOps como disciplina
8.11 Estrategias de rollout
8.12 Observabilidad desde el despliegue
8.13 Network policies y comunicacion
8.14 Respaldo y continuidad
8.15 Ambientes y datos sinteticos
8.16 Backlog cloud native para Spotybank

## Capitulo 9 - Performance, escalamiento y resiliencia

9.1 Performance como comportamiento observable
9.2 SLIs, SLOs y presupuesto de error
9.3 Latencia, throughput y concurrencia
9.4 Percentiles y promedios
9.5 Pools y limites invisibles
9.6 Escalamiento horizontal
9.7 Escalamiento vertical y resources
9.8 HPA y metricas adecuadas
9.9 Colas, reintentos y DLQ
9.10 Resiliencia y patrones
9.11 Pruebas de carga con hipotesis
9.12 Pruebas de resiliencia
9.13 Observabilidad para performance
9.14 Capacity planning educativo
9.15 Backlog de performance y resiliencia

## Parte V - IA aplicada, curso y roadmap

## Capitulo 10 - IA como acelerador de modernizacion

10.1 La IA no moderniza sola
10.2 Un nuevo modo de leer sistemas heredados
10.3 La regla de evidencia
10.4 Prompt seguro para diagnostico
10.5 Documentacion asistida
10.6 IA para mapas de arquitectura
10.7 IA para detectar deuda tecnica
10.8 IA para backlog accionable
10.9 IA para pruebas y calidad
10.10 IA y refactorizacion
10.11 IA en seguridad
10.12 IA para escritura tecnica
10.13 Flujo de trabajo recomendado
10.14 Riesgos y controles
10.15 Antipatrones

## Capitulo 11 - Spotybank como curso

11.1 De repositorio a producto educativo
11.2 Principio de aprendizaje situado
11.3 Resultados de aprendizaje
11.4 Rutas por perfil
11.5 Formato por fasciculos
11.6 Rutas por duracion
11.7 Laboratorios por dificultad
11.8 Laboratorio 1: inventario de microservicio
11.9 Laboratorio 2: frontera de dominio
11.10 Laboratorio 3: saneamiento y publicacion segura
11.11 Laboratorio 4: despliegue educativo
11.12 Laboratorio 5: performance y resiliencia
11.13 Revision por pares
11.14 Rubrica general
11.15 Proyecto final por equipos
11.16 Uso en universidad
11.17 Uso en empresas
11.18 Uso en institutos y centros profesionales

## Capitulo 12 - Roadmap de evolucion

12.1 Roadmap como narrativa tecnica
12.2 Principios de priorizacion
12.3 Versiones de evolucion
12.4 Fase 0: saneamiento y base editorial
12.5 Fase 1: MVP educativo
12.6 Fase 2: version docente
12.7 Fase 3: version tecnica ejecutable
12.8 Fase 4: plataforma cloud native
12.9 Fase 5: seguridad y DevSecOps
12.10 Fase 6: performance y resiliencia
12.11 `spotybank-core-ledger`
12.12 Eventos y arquitectura evolutiva
12.13 Roadmap de 90 dias
12.14 Version empresarial
12.15 Version academica
12.16 Metricas de avance
12.17 Riesgos del roadmap
12.18 Criterios de salida para `v0.2`
12.19 Cierre de la obra

## Apendices

- Apendice B - Glosario tecnico.
- Apendice C - Acronimos.
- Apendice E - Codigo fuente e instrucciones de uso.
- Apendice F - Ejercicios, laboratorios y rubricas.

## Partes finales

- Bibliografia.
- Sobre el autor.
- Contraportada.

## Revisiones y publicacion

- Cierre tecnico de capitulos `v0.2-editorial`.
- Validacion integral de cierre tecnico.
- Checklist de salida `v0.2-editorial`.
- Release notes draft `v0.2-editorial`.
