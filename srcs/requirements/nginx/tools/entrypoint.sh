#! /bin/bash

openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout /etc/ssl/private/inception.key -out /etc/ssl/certs/inception.crt -subj "/C=KR/ST=GN/L=SEOUL/O=42/OU=INCEPTION"

chmod 600 /etc/ssl/private/inception.key /etc/ssl/certs/inception.crt

chown -R www-data:www-data /var/www

cp /etc/ssl/certs/inception.crt /ssl/jaekpark
cp /etc/ssl/private/inception.key /ssl/jaekpark

nginx -g "daemon off;"
