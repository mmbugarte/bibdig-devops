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

Para desplegar, es necesario contar con la clave `docker-uqbar.pem`, solicitar a los administradores.

Teniendo ese pre-requisito se ejecuta:

```
./upload.sh
```
