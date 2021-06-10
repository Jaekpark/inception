FROM debian:buster
MAINTAINER jaekpark@student.42seoul.kr
RUN apt-get update && apt-get -y upgrade &&\
	apt-get install -y nginx openssl vim

RUN mkdir -p /ssl/jaekpark

COPY ./conf conf/
COPY ./tools/entrypoint.sh ./
RUN	mv conf/nginx.conf /etc/nginx/nginx.conf
RUN	mv conf/jaekpark.42.fr.conf /etc/nginx/sites-available/jaekpark.42.fr
RUN	ln -s /etc/nginx/sites-available/jaekpark.42.fr /etc/nginx/sites-enabled/
RUN ln -sf /dev/stdout /var/log/nginx/access.log &&\
	ln -sf /dev/stderr /var/log/nginx/error.log

ENTRYPOINT ["bash", "entrypoint.sh"]
