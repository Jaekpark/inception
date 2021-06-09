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
	wget curl vim\
	redis\
	php-common

RUN mkdir -p /var/www/wordpress &&\
	mkdir -p /run/php/

COPY ./tools/entrypoint.sh ./
RUN	echo "error_log = /dev/stderr" >> /etc/php/7.3/fpm/php.ini &&\
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar &&\
	chmod +x wp-cli.phar &&\
	mv wp-cli.phar /usr/local/bin/wp

RUN wp core download --version=5.7.1 --locale=ko_KR --allow-root --path=/var/www/wordpress
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d
COPY ./conf/wp-config.php /var/www/wordpress/

EXPOSE 9000
ENTRYPOINT ["bash","entrypoint.sh"]
