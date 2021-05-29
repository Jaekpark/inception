#! /bin/sh
./setup.sh
rm setup.sh
php-fpm7.3 --nodaemonize
