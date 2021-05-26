FROM debian:buster
MAINTAINER jaekpark@student.42seoul.kr
RUN apt-get update && apt-get -y upgrade &&\
	apt-get install -y mariadb-server mariadb-client

COPY ./tools/setup.sh ./setup.sh

ARG MYSQL_DATABASE
ARG MYSQL_ADMIN
ARG MYSQL_ADMIN_PASSWORD
ARG MYSQL_ROOT_PASSWORD

RUN mkdir -p /run/mysql
RUN service mysql start && sh ./setup.sh && mysql -u root -password=$MYSQL_ROOT_PASSWORD < setup.sql
RUN rm setup.sh setup.sql
COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d/

EXPOSE 3306
CMD ["/usr/bin/mysqld_safe", "--user=root", "--datadir=/var/lib/mysql/", "--general-log-file=/dev/stderr"]
