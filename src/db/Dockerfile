# DockerFile to build my sql image

FROM mysql:latest

EXPOSE 3306

# Set environment variables
ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_DATABASE=calculator

ADD init.sql /docker-entrypoint-initdb.d/init.sql