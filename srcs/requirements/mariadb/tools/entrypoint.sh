#! /bin/bash

./setup.sh
service mysql start
mysql -u root --password=$MYSQL_ROOT_PASSWORD < setup.sql
/usr/bin/mysqld_safe --user=root --datadir=/var/lib/mysql/ --general-log-file=/dev/stderr
