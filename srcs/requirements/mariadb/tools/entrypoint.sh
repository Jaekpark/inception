#! /bin/bash

create_sql()
{
	./setup.sh
}

create_db()
{
	service mysql start
	mysql -u root -p$MYSQL_ROOT_PASSWORD < setup.sql
}

kill_db()
{
	kill -9 `ps -ef | grep mysql | awk '{print $2}'`
}

create_sql
create_db
kill_db
sleep 1
/usr/bin/mysqld_safe --user=root --datadir=/var/lib/mysql/ --general-log-file=/dev/stderr
