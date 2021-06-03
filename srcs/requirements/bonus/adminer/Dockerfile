FROM debian:buster
RUN apt-get update && apt-get -y upgrade &&\
	apt-get -y install nginx php-fpm php-mysqli php-session

RUN wget -O index.php https://github.com/vrana/adminer/releases/download/v4.8.0/adminer-4.8.0-mysql.php &&\
	mkdir -p /var/www/adminer &&\
	mv index.php /var/www/adminer/
