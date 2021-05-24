# Select mysql database
USE mysql;
FLUSH PRIVILEGES;

# init root user password && create an root user for external host and grant authority.

GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '' WITH GRANT OPTION;

# create database for wp service.
CREATE DATABASE IF NOT EXISTS ;

# Create wp users and grant authority.
CREATE USER IF NOT EXISTS ''@'%' IDENTIFIED BY '';
GRANT ALL PRIVILEGES ON .* TO ''@'%' IDENTIFIED BY '' WITH GRANT OPTION;

# Apply Changes
FLUSH PRIVILEGES;
