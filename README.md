# Desarrollo

## Preparación inicial del entorno

### Configuración local de docker

Para que compose tome automáticamente la configuración de desarrollo ejecutar:

```
ln -s compose.develop.yml compose.override.yml
```

Docker compose toma el `compose.override.yml` automáticamente, por lo que no debe commitearse porque estaría modificando el comportamiento de los scripts en producción.

### Comunicación con la API

Para comunicarse con la API de Strapi se necesita un API Token.
Para ello:

- Ingresar al Strapi, de ser necesario seguir todos los pasos para obtener un usuario administrador por primera vez.
- Generar un API Token desde el menú de administración.
- Crear un archivo .env.local en el repositorio UI, registrando la API key bajo la variable VUE_APP_STRAPI_API_TOKEN.

El archivo `.env.local` no debe ser agregado al repositorio git, esto ocurrirá automáticamente porque está en el `.gitignore`.

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

# Tests de integración

## Obtención de secretos

1. Para testear la obtención de secretos en el ambiente local se necesita:
   Instalar AWS CLI:
   Si no lo tienes instalado, sigue las instrucciones para tu sistema operativo desde la documentación oficial de AWS CLI.

2. Configurar las credenciales de AWS:
   Ejecuta el siguiente comando y sigue las indicaciones para ingresar tu AWS Access Key ID y AWS Secret Access Key.

`aws configure`

Este comando te pedirá: - AWS Access Key ID - AWS Secret Access Key - Default region name - Default output format

Estas credenciales se guardarán en el archivo ~/.aws/credentials.

3. Desde la consola de gestión de AWS, registrar la clave local de API key de Strapi bajo el nombre `mmbu/uiy/test`
4. Ejecutar un contenedor de ui en modo test, mediante `dcr -e NODE_ENV=test -p 8080:8080 ui`

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
