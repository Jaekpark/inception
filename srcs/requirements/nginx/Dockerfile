FROM debian:buster
MAINTAINER jaekpark@student.42seoul.kr
RUN apt-get update && apt-get -y upgrade &&\
	apt-get install -y nginx openssl vim

RUN openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout\
	/etc/ssl/private/inception.key -out /etc/ssl/certs/inception.crt\
	-subj "/C=KR/ST=GN/L=SEOUL/O=42/OU=INCEPTION"

COPY tools/nginx.conf /etc/nginx/
COPY tools/inception.conf /etc/nginx/sites-available/default

#RUN ln -s /etc/nginx/sites_available/inception /etc/nginx/sites-enabled/inception
RUN ln -sf /dev/stdout /var/log/nginx/access.log &&\
	ln -sf /dev/stderr /var/log/nginx/error.log

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]
