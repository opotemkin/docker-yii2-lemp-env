FROM mysql:5.7

MAINTAINER Mahmoud Zalt <mahmoud@zalt.me>

ADD start.sh /docker-entrypoint-initdb.d/
RUN chmod 0755 /docker-entrypoint-initdb.d/start.sh

ADD 002_dump_structure.sql.gz /tmp/
RUN chmod 700 /tmp/002_dump_structure.sql.gz

ADD 001_startup.sql /tmp/
RUN chmod 700 /tmp/001_startup.sql
RUN chown mysql:root /tmp/001_startup.sql

ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_ROOT_PASSWORD

ENV MYSQL_DATABASE=$MYSQL_DATABASE
ENV MYSQL_USER=$MYSQL_USER
ENV MYSQL_PASSWORD=$MYSQL_PASSWORD
ENV MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD

RUN sed -i 's/MYSQL_DATABASE/'$MYSQL_DATABASE'/g' /tmp/001_startup.sql && \
    sed -i 's/MYSQL_USER/'$MYSQL_USER'/g' /tmp/001_startup.sql && \
    sed -i 's/MYSQL_PASSWORD/'$MYSQL_PASSWORD'/g' /tmp/001_startup.sql

RUN sed -i 's/MYSQL_DATABASE/'$MYSQL_DATABASE'/g' /docker-entrypoint-initdb.d/start.sh

RUN chown -R mysql:root /docker-entrypoint-initdb.d/
RUN chown -R mysql:root /tmp/
RUN chown -R mysql:root /var/lib/mysql/

EXPOSE 3306
