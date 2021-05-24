#! /bin/sh

cat << EOF > setup.sql
# Select mysql database
USE mysql;
FLUSH PRIVILEGES;

# init root user password && create an root user for external host and grant authority.

GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION;

# create database for wp service.
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;

# Create wp users and grant authority.
CREATE USER IF NOT EXISTS '$MYSQL_ADMIN'@'%' IDENTIFIED BY '$MYSQL_ADMIN_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_ADMIN'@'%' IDENTIFIED BY '$MYSQL_ADMIN_PASSWORD' WITH GRANT OPTION;

# Apply Changes
FLUSH PRIVILEGES;
EOF
