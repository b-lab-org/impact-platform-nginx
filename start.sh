#!/bin/bash
cp /opt/etc/nginx.conf /etc/nginx/nginx.conf
sed -i "s/PHP_PORT_9000_TCP_ADDR/$PHP_PORT_9000_TCP_ADDR/" /etc/nginx/nginx.conf

nginx -t

sudo service nginx restart
exec "$@"
