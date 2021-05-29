#! /bin/bash

wp core install --path=/var/www/wordpress --admin_user=$MYSQL_ADMIN \
	--admin-password=$MYSQL_ADMIN_PASSWORD --admin_email=$WORDPRESS_ADMIN_EMAIL \
	--url=https://$WORDPRESS_DOMAIN --title='INCEPTION'

