# Select mysql database
USE mysql;
FLUSH PRIVILEGES;

# create database for wp service.
CREATE DATABASE IF NOT EXISTS ;

CREATE USER IF NOT EXISTS ''@'%' IDENTIFIED BY '';
GRANT ALL PRIVILEGES ON *.* TO ''@'%';

# Apply Changes
FLUSH PRIVILEGES;
