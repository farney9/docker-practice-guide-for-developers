docker container run \
-dp 3306:3306 --name world-db \
--env MARIADB_USER=example-user \
--env MARIADB_PASSWORD=user-password \
--env MARIADB_ROOT_PASSWORD=root-secret-password \
--env MARIADB_DATABASE=world-db \
--volume world-db:/var/lib/mysql \
--network world-app \
mariadb:lts-jammy



phpmyadmin:5.2.0-apache
phpmyadmin:5.2.1-apache

docker container rm -f $(docker container ls -q)


docker container run \
--name phpmyadmin \
-d \
-e PMA_ARBITRARY=1 \
-e PMA_HOST=world-db \
-p 8080:80 \
--network world-app \
phpmyadmin:5.2.1-apache

# Ejercicio Bind Volumes

# solucion error de rutas docker: Error response from daemon: the working directory 'C:/Program Files/Git/app' is invalid, it needs to be an absolute path.

# Solución Contenedores muy lentos en windows

# https://github.com/irradev/docker-windows-helps/blob/main/contenedores-muy-lentos.md#4-copia-tu-proyecto-local-hacia-la-carpeta-de-tu-distro
# \\wsl$

export MSYS_NO_PATHCONV=1

docker container run \
--name nest-app \
-w /app \
-d \
-p 80:3000 \
-v "/home/far/desarrollo/nest-graphql":/app \
node:18-alpine3.16 \
sh -c "yarn install && yarn start:dev"


# Busca dentro de la carpeta bin del contenedor y ejecuta el comando sh
# ae9 es el id del contenedor obtenido con el comando docker container ls

docker exec -it ae9 /bin/sh

#Laboratorio

# Paso 1 Crer volumen para la base de datos  postgres

docker volume create postgres-db

# Paso 2 descargar y montar  de la imagen de postgres

docker container run \
-d \
--name postgres-db \
-e POSTGRES_PASSWORD=123456 \
-v postgres-db:/var/lib/postgresql/data \
postgres:15.1

# paso 3 descargar y montar la imagen de pgAdmin

docker container run \
--name pgAdmin \
-e PGADMIN_DEFAULT_PASSWORD=123456 \
-e PGADMIN_DEFAULT_EMAIL=superman@google.com \
-dp 8080:80 \
dpage/pgadmin4:8.6

# paso 4 crear la red
docker network create postgres-net

# paso 5 Intentar crear la conexión a la base de datos
Click en Servers
Click en Register > Server
Colocar el nombre de: "SuperHeroesDB" (el nombre no importa)
Ir a la pestaña de connection
Colocar el hostname "postgres-db" (el mismo nombre que le dimos al contenedor)
Username es "postgres" y el password: 123456
Probar la conexión
Ohhh no!, no vemos la base de datos, se nos olvidó la red

# paso 6 conectar la red
docker network connect postgres-net ID contenedor 1
docker network connect postgres-net ID contenedor 2


# Ejecutar docker-compose.yml
docker compose up -d