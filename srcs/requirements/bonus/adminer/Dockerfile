FROM debian:buster
RUN apt-get update && apt-get -y upgrade 
RUN	apt-get install -y nginx \
	php-fpm \
	php-mysql \
	wget

COPY ./conf/index.php ./
RUN	mkdir -p /var/www/adminer &&\
	mkdir -p /run/php &&\
	mkdir -p /run/nginx &&\
	mkdir -p /ssl/jaekpark &&\
	mv index.php /var/www/adminer/index.php &&\
	chown -R www-data:www-data /var/www/* &&\
	chown -R www-data:www-data /run/nginx

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY ./conf/adminer /etc/nginx/sites-available/
COPY ./tools/entrypoint.sh ./
COPY ./conf/php.ini /etc/php/7.3/fpm/
RUN ln -s /etc/nginx/sites-available/adminer /etc/nginx/sites-enabled/ &&\
	ln -sf /dev/stdout /var/log/nginx/access.log &&\
	ln -sf /dev/stdout /var/log/nginx/error.log &&\
	mkdir -p /run/nginx && chown -R www-data:www-data /run/nginx
EXPOSE 4242
ENTRYPOINT ["bash", "entrypoint.sh"]
