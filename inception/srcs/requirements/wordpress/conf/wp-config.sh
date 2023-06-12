#!/bin/bash
MYSQL_DATABASE=$1
MYSQL_USER=$2
MYSQL_PASSWORD=$3

if [ ! -f "/var/www/wp-config.php" ]; then
 	mkdir -p /var/www
	echo "THESE ARE THE ENV VARS  ${MYSQL_DATABASE} and ${MYSQL_USER}"
	cat << EOF > /var/www/wp-config.php
<?php
define( 'DB_NAME', '$MYSQL_DATABASE' );
define( 'DB_USER', '$MYSQL_USER' );
define( 'DB_PASSWORD', '$MYSQL_PASSWORD' );
define( 'DB_HOST', 'mariadb' );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );
define( 'FS_METHOD', 'direct' );
\$table_prefix = 'wp_';
define( 'WP_DEBUG', false );
if ( ! defined( 'ABSPATH' ) ) {
define( 'ABSPATH', __DIR__ . '/' );}
require_once ABSPATH . 'wp-settings.php';
EOF
fi
