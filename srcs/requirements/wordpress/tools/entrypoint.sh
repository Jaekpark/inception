#! /bin/bash

status=0

cat << EOF > exit.sql
exit
EOF

wp_install()
{
	wp core install --allow-root --path=/var/www/wordpress --url=${WORDPRESS_DOMAIN} --title=My_inception --admin_user=${WORDPRESS_DB_USER} --admin_password=${WORDPRESS_DB_PASSWORD} --admin_email=${WORDPRESS_ADMIN_EMAIL} --skip-email
}

connect_db()
{
	while ! mysql -hmariadb -P3306 -u$WORDPRESS_DB_USER -p$WORDPRESS_DB_PASSWORD < exit.sql ; do
		if [ $status -ge 30 ]; then
			printf "FAILED connect to db\n"
			exit 1
		fi
		printf "Trying to connect to db ($status/30)\n"
		status=$((status+1))
		sleep 1
	done
}

conf_file=/var/www/wordpress/wp_config.php
redis_install()
{
	wp plugin install --allow-root --activate redis-cache
	if [ $(cat "$conf_file" | grep "#define( 'WP_REDIS_HOST', getenv('REDIS_HOST') );" | -eq 0 ]; then
		sed -i "s/#define( 'WP_REDIS_HOST', getenv('REDIS_HOST') );/define( 'WP_REDIS_HOST', getenv('REDIS_HOST') );" $conf_file
		sed -i "s/#define( 'WP_REDIS_PORT', getenv('REDIS_PORT') );/define( 'WP_REDIS_PORT', getenv('REDIS_PORT') );" $conf_file
}

status=0
connect_redis()
{
	while [ "$(redis-cli -h ${REDIS_HOST} -p ${REDIS_PORT} pint 2> /dev/null)" != "PONG" ]; do
		if [ $status -ge 30 ]; then
			printf "No response from the redis server.\n"
			exit 1
		fi
		printf "Waiting for response from redis server ($status/30).\n"
		status=(($status + 1))
		sleep 1
	done
}

connect_db
wp_install
redis_install
connect_redis
wp redis --allow-root enable
php-fpm7.3 -F
