FROM debian:buster

RUN apt-get update && apt-get -y upgrade &&\
	apt-get install -y mariadb-server mariadb-client\
	vim curl wget

COPY ./tools/setup.sh ./setup.sh
#COPY ./tools/50-server.cnf /etc/mysql/mysql/mariadb.conf.d/50-server.cnf

ARG MYSQL_DATABASE
ARG MYSQL_ADMIN
ARG MYSQL_ADMIN_PASSWORD
ARG MYSQL_ROOT_PASSWORD
ARG MYSQL_USER
ARG MYSQL_USER_PASSWORD

RUN mkdir -p /run/mysql
RUN service mysql start && sh ./setup.sh && mysql -u root -password=$MYSQL_ROOT_PASSWORD < setup.sql
RUN rm setup.sh setup.sql

EXPOSE 3306
CMD ["/usr/bin/mysqld_safe", "--user=root", "--datadir=/var/lib/mysql/", "--general-log-file=/dev/stderr"]
