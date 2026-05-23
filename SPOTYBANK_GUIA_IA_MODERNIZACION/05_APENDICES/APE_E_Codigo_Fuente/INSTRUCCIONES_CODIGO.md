# APENDICE E - Codigo fuente

## Instrucciones de uso

1. El codigo incluido o referenciado es complementario a los capitulos de modernizacion, pruebas, seguridad, nube y performance.
2. Los ejemplos deben ejecutarse solo con datos sinteticos, secretos ficticios y entornos educativos.
3. Requisitos de entorno recomendados: Java, Maven, Git, Docker o Podman, y un entorno local de Kubernetes como Kind, Minikube u OpenShift Local si el laboratorio lo requiere.
4. Como ejecutar:

```bash
# Revisar primero las instrucciones del laboratorio asociado.
mvn test
```

## Estructura del codigo

```text
APE_E_Codigo_Fuente/
|-- README.md
|-- ejemplos/
|-- laboratorios/
|-- scripts/
`-- tests/
```

## Licencia del codigo

Los ejemplos de codigo propios se publican bajo Apache License 2.0, salvo que un archivo indique una licencia distinta.

## Regla de seguridad

No incluir secretos reales, tokens, passwords, certificados, dominios privados, nombres de entidades reales ni datos personales en ningun ejemplo, script o salida de laboratorio.
