# Plan de Fasciculos por Perfil

Este plan permite publicar la obra como un libro unico o como entregas independientes. La recomendacion inicial es trabajar por fasciculos: facilita revisar, validar y usar el material en contextos educativos distintos.

| Fasciculo | Perfil principal | Tema | Resultado esperado |
|---|---|---|---|
| 0 | Direccion academica / lideres tecnicos | Presentacion del caso Spotybank | Entender alcance, valor educativo y reglas de uso |
| 1 | Backend / onboarding tecnico | Inventario del sistema | Reconocer servicios, dependencias, stack y deuda inicial |
| 2 | Arquitectura | Dominios y fronteras | Proponer mapa de dominios, servicios canonicos y contratos |
| 3 | Seguridad / DevSecOps | Anonimizacion, secretos y hardening | Publicar un caso seguro, sin identidad ni secretos reales |
| 4 | Backend senior | Modernizacion Java/Spring/Maven | Disenar una ruta de upgrade incremental |
| 5 | QA / testing | Pruebas, contratos y datos de prueba | Definir piramide de pruebas y estrategia de regresion |
| 6 | DevOps / SRE | Nube, despliegue y observabilidad | Disenar escenarios Kubernetes/OpenShift y SLIs/SLOs |
| 7 | Performance | Escalamiento y resiliencia | Medir, perfilar y escalar servicios criticos |
| 8 | Docentes / formadores | Diseno curricular | Convertir Spotybank en curso, taller o proyecto final |

## Secuencia recomendada

1. Publicar primero los fasciculos 0, 1 y 3 para fijar contexto y seguridad.
2. Continuar con arquitectura y backend: fasciculos 2 y 4.
3. Sumar QA, operacion y performance: fasciculos 5, 6 y 7.
4. Cerrar con el fasciculo 8 para empaquetar el material como producto educativo.

## Ventajas de publicar por fasciculos

- Permite validar con lectores reales antes de cerrar el libro completo.
- Facilita vender o distribuir modulos por perfil.
- Reduce el riesgo de mezclar temas demasiado amplios en una unica entrega.
- Permite que docentes adopten solo las unidades que necesitan.

## Cuando conviene libro unico

Conviene un libro unico cuando el objetivo es presentar Spotybank como obra de referencia integral, con una narrativa completa desde el diagnostico hasta el roadmap. En ese caso, los fasciculos funcionan como capitulos o partes internas.

## Version ejecutable

La version operativa de estos fasciculos, con practicas, entregables y criterios de evaluacion, esta en:

- `FASCICULOS_EJECUTABLES_POR_PERFIL.md`
