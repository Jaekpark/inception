FROM debian:buster

RUN apt-get update && apt-get -y upgrade &&\
	apt-get install -y curl wget php-fpm vim \
	php-curl\
	php-dom\
	php-exif\
	php-fileinfo\
	php-json\
	php-mbstring\
	php-mysqli\
	php-xml\
	php-common\
	php-zip

#ENV WORDPRESS_DB_HOST=mariadb
#ENV WORDPRESS_DB_NAME=wordpress
#ENV WORDPRESS_DB_USER=jaekpark
#ENV WORDPRESS_DB_PASSWORD=jaekpark

RUN mkdir -p /var/www &&\
	mkdir -p /run/php/
COPY ./tools/latest.tar.gz ./
RUN tar -xvf latest.tar.gz &&\
	mv wordpress /var/www/wordpress/
#COPY ./tools/wordpress/ /var/www/wordpress
#COPY ./tools/fpm/php.ini /etc/php/7.3/fpm/php.ini
#COPY ./tools/cli/php.ini /etc/php/7.3/cli/php.ini
COPY ./tools/www.conf /etc/php/7.3/fpm/pool.d
#COPY ./tools/wp-config.php /var/www/wordpress/

RUN chown -R www-data:www-data /var/www/*

RUN echo "error_log = /dev/stderr" >> /etc/php/7.3/fpm/php.ini
EXPOSE 9000
CMD ["php-fpm7.3", "--nodaemonize"]
