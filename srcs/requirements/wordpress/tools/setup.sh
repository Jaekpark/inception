#! /bin/sh

wp core install --allow-root --path='/var/www/wordpress' \
	--url=$WORDPRESS_DOMAIN \
    --title=My_inception \
    --admin_user=$MYSQL_ADMIN \
    --admin_password=$MYSQL_ADMIN_PASSWORD \
    --admin_email=$WORDPRESS_ADMIN_EMAIL
