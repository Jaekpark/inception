#! /bin/bash

status=0

wp_install()
{
	wp core install --allow-root --path=/var/www/wordpress --url=${WORDPRESS_DOMAIN} --title=My_inception --admin_user=${WORDPRESS_DB_USER} --admin_password=${WORDPRESS_DB_PASSWORD} --admin_email=${WORDPRESS_ADMIN_EMAIL} --skip-email
}

connect_db()
{
	while ! mysql -hmariadb -P3306 -u$WORDPRESS_DB_USER -p$WORDPRESS_DB_PASSWORD ; do
		if [ $status -ge 30 ]; then
			printf "FAILED connect to db\n"
			exit 1
		fi
		printf "Trying to connect to db ($status/30)\n"
		status=$((status+1))
		sleep 1
	done
}

check()
{
	[[$? -eq 0]] && echo -e "OK" || echo -e "KO"
}


connect_db()
if [ mysql -hmariadb 

if ! wp core --allow-root is-installed; then
	wp_install
	check
fi
php-fpm7.3 -F
