#!/bin/bash
mkdir /var/www/
mkdir /var/www/html

cd /var/www/html


rm -rf *

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 

chmod +x wp-cli.phar 

mv wp-cli.phar /usr/local/bin/wp


wp core download --allow-root

mv wp-config-sample.php wp-config.php

# mv /wp-config.php /var/www/html/wp-config.php

sed -i -r "s/database_name_here/$MYSQL_DATABASE/1"   wp-config.php
sed -i -r "s/username_here/$MYSQL_USER/1"   wp-config.php
sed -i -r "s/password_here/$MYSQL_PASSWORD/1"     wp-config.php
sed -i -r "s/localhost/mariadb/1"     wp-config.php


wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$MYSQL_USER --admin_password=$MYSQL_PASSWORD --admin_email=$WP_EMAIL --skip-email --allow-root




wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_PASSWD --allow-root


wp theme install astra --activate --allow-root


wp plugin install redis-cache --activate --allow-root

wp plugin update --all --allow-root


 
sed -i "s|listen = /run/php/php7.3-fpm.sock|listen = 9000|g" \
		/etc/php/7.3/fpm/pool.d/www.conf && \
sed -i "s|listen.owner = www-data|listen.owner = nobody|g" \
		/etc/php/7.3/fpm/pool.d/www.conf && \
sed -i "s|listen.group = www-data|listen.group = nobody|g" \
		/etc/php/7.3/fpm/pool.d/www.conf && \
rm -rf /var/cache/apt/*

mkdir /run/php



wp redis enable --allow-root

/usr/sbin/php-fpm7.3 -F