#! /bin/bash

status=0

cat << EOF > exit.sql
exit
EOF

check()
{
[[ $? -eq 0 ]] && echo -e "OK" || echo -e "KO"
}

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
	echo -e "Success."
}

redis_install()
{
	wp plugin install --allow-root --activate redis-cache --path=/var/www/wordpress
	wp plugin activate --allow-root redis-cache --path=/var/www/wordpress
	wp plugin update --all --allow-root --path=/var/www/wordpress
}

redis_status=0
connect_redis()
{
	while [ "$(redis-cli -h ${REDIS_HOST} -p ${REDIS_PORT} ping 2> /dev/null)" != "PONG" ]; do
		if [ $redis_status -ge 30 ]; then
			printf "No response from the redis server.\n"
			exit 1
		fi
		printf "Waiting for response from redis server ($redis_status/30).\n"
		redis_status=$((redis_status + 1))
		sleep 1
	done
}

connect_db
wp_install
redis_install
connect_redis
chown -R www-data:www-data /var/www/
wp redis enable --allow-root --path=/var/www/wordpress
php-fpm7.3 -F
