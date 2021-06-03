FROM debian:buster

RUN apt-get update && apt-get -y upgrade &&\
	apt-get install -y curl wget vim php-fpm php-mysqli &&\
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar &&\
	chmod +x wp-cli.phar &&\
	mv wp-cli.phar /usr/local/bin/wp &&\
	mkdir -p /var/www/wordpress


