#! /bin/sh

wp core install --path=/var/www/wordpress --admin_user=${MYSQL_ADMIN} \
	--admin_password=${MYSQL_ADMIN_PASSWORD} --admin_email=${WORDPRESS_ADMIN_EMAIL} \
	--url=${WORDPRESS_DOMAIN} --title=INCEPTION --allow-root

php-fpm7.3 --nodaemonize
