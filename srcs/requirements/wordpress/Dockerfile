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
	wget curl\
	php-common

RUN mkdir -p /var/www &&\
	mkdir -p /run/php/

COPY ./tools/latest.tar.gz ./
COPY ./tools/entrypoint.sh ./

RUN tar -xvf latest.tar.gz &&\
	mv wordpress /var/www/wordpress/ &&\
	rm latest.tar.gz

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d
COPY ./conf/wp-config.php /var/www/wordpress/

RUN chown -R www-data:www-data /var/www/* &&\
	echo "error_log = /dev/stderr" >> /etc/php/7.3/fpm/php.ini &&\
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar &&\
	chmod +x wp-cli.phar &&\
	mv wp-cli.phar /usr/local/bin/wp 
EXPOSE 9000
ENTRYPOINT ["./entrypoint.sh"]
