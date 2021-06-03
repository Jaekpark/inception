FROM debian:buster

RUN apt-get update && apt-get -y upgrade &&\
	apt-get install -y redis vim wget curl

COPY ./tools/entrypoint.sh ./
COPY ./conf/redis.conf /etc/redis/

EXPOSE 6379
ENTRYPOINT ["bash", "entrypoint.sh"]
