FROM debian:bullseye

COPY ./conf/*  /tmp/

RUN apt-get update
RUN apt-get -y install mariadb-server
RUN chmod +x /tmp/create.sh
RUN chmod +x /tmp/init.sh
RUN /tmp/init.sh


CMD [ "sh", "-c", "./tmp/create.sh > /tmp/create.sql && service mariadb stop && mysqld --init-file=/tmp/create.sql"]