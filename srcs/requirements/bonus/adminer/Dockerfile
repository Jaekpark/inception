FROM debian:buster
MAINTAINER jaekpark@student.42seoul.kr
RUN apt-get update && apt-get -y upgrade 
RUN	apt-get install -y nginx \
	php-fpm \
	php-mysql \
	php-common \
	php-gmp \
	php-curl \
	php-intl \
	php-mbstring \
	php-xmlrpc \
	php-gd \
	php-xml \
	php-cli \
	php-soap \
	php-imap \
	wget
RUN mkdir -p /var/www/adminer
RUN wget https://github.com/vrana/adminer/releases/download/v4.7.7/adminer-4.7.7.php -O /var/www/adminer/index.php &&\
	chmod -R 755  /var/www &&\
	mkdir -p /run/nginx &&\
	mkdir -p /ssl/jaekpark &&\
	chown -R www-data:www-data /var/www/* &&\
	chown -R www-data:www-data /run/nginx

COPY ./conf/adminer /etc/nginx/sites-available/default
COPY ./tools/entrypoint.sh ./
RUN	ln -sf /dev/stdout /var/log/nginx/access.log &&\
	ln -sf /dev/stdout /var/log/nginx/error.log
EXPOSE 8080
ENTRYPOINT ["bash", "entrypoint.sh"]
