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
sed -i -- 's/user = nobody/user = nginx/g' /etc/php7/fpm/php-fpm.d/www.conf
#group = nobody -> group = nginx
sed -i -- 's/group = nobody/group = nginx/g' /etc/php7/fpm/php-fpm.d/www.conf

systemctl enable php-fpm
systemctl start php-fpm

#todo, include nginx.conf
zypper in php-pgsql

#PostgreSQL
zypper in postgresql-server

#ident -> password
sed -i -- 's/host    all             all             127.0.0.1/32            ident/host    all             all             127.0.0.1\/32            password/g' /etc/postgresql/8.4/main/pg_hba.conf
sed -i -- 's/host    all             all             ::1/128                 ident/host    all             all             ::1/128                 password/g' /etc/postgresql/8.4/main/pg_hba.conf

systemctl enable postgresql
systemctl start postgresql
#user pg, password pg
su - postgres -c "psql -U postgres -d postgres -c \"CREATE USER pg SUPERUSER CREATEDB CREATEROLE INHERIT LOGIN PASSWORD 'pg';\""

#now you can connect using pg user trouth localhost using -> psql -h localhost -U pg -W postgres
#but you can use psql directely using -> sudo -u postgres psql 
