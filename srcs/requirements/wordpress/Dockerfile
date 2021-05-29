FROM debian:buster
MAINTAINER jaekpark@student.42seoul.kr
RUN apt-get update && apt-get -y upgrade &&\
	apt-get install -y mariadb-client php-fpm\
	php-curl\
	php-exif\
	php-fileinfo\
	php-json\
	php-mbstring\
	php-mysqli\
	php-xml\
	php-common

RUN mkdir -p /var/www &&\
	mkdir -p /run/php/
COPY ./tools/latest.tar.gz ./
RUN tar -xvf latest.tar.gz &&\
	mv wordpress /var/www/wordpress/
COPY ./tools/www.conf /etc/php/7.3/fpm/pool.d
COPY ./tools/wp-config.php /var/www/wordpress/

RUN chown -R www-data:www-data /var/www/*
RUN echo "error_log = /dev/stderr" >> /etc/php/7.3/fpm/php.ini

EXPOSE 9000
ENTRYPOINT ["php-fpm7.3", "--nodaemonize"]
