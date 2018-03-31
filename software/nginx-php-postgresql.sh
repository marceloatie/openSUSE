#!/bin/sh

# - NGINX
zypper in nginx
systemctl enable nginx
systemctl start nginx

# - PHP
zypper in php php-fpm
cp /etc/php7/fpm/php-fpm.conf.default /etc/php7/fpm/php-fpm.conf
cp /etc/php7/fpm/php-fpm.d/www.conf.default /etc/php7/fpm/php-fpm.d/www.conf
#user = nobody -> user = nginx
sed -i -- 's/user = nobody/\nuser = nginx/g' /etc/php7/fpm/php-fpm.d/www.conf
#group = nobody -> group = nginx
sed -i -- 's/group = nobody/group = nginx/g' /etc/php7/fpm/php-fpm.d/www.conf

systemctl enable php-fpm
systemctl start php-fpm

#todo, include nginx.conf
zypper in php-pgsql

#PostgreSQL
zypper in postgresql-server
systemctl enable postgresql
systemctl start postgresql
