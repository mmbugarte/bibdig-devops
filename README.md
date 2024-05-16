# Desarrollo

## Preparación inicial del entorno

Para que compose tome automáticamente la configuración de desarrollo ejecutar:

```
ln -s compose.develop.yml compose.override.yml
```

Docker compose toma el `compose.override.yml` automáticamente, por lo que no debe commitearse porque estaría modificando el comportamiento de los scripts en producción.

## Ejecución por primera vez

Debido a que la base mysql demora en su setup inicial, requiere ser iniciada por separado la primera vez:

```
docker compose up database
docker compose up
```

## Ejecución normal en desarrollo

```
docker compose up
```

# Despliegue productivo

## Claves para conexión ssh

Para desplegar, es necesario contar con la clave `docker-uqbar.pem`, solicitar a los administradores.

## Preparación del servidor productivo

No tengo un script para esto por ahora, hay que instalar docker, unzip y make en el servidor.
Está probado con un servidor con 4gb de RAM y 40GB de disco.

## Upload y make

Teniendo esos pre-requisitos y parado en la carpeta que contenga el directorio devops se ejecuta:

```
devops/upload.sh
```
