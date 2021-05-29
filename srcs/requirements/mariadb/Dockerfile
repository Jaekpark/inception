FROM debian:buster
MAINTAINER jaekpark@student.42seoul.kr
RUN apt-get update && apt-get -y upgrade &&\
	apt-get install -y mariadb-server mariadb-client

COPY ./tools/setup.sh ./setup.sh
COPY ./tools/entrypoint.sh ./entrypoint.sh

RUN mkdir -p /run/mysql
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

EXPOSE 3306
ENTRYPOINT ["sh", "entrypoint.sh"]
