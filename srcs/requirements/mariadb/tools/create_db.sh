#!/bin/sh

service mysql start --skip-networking

echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" > db1.sql
echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" >> db1.sql
echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" >> db1.sql
echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';" >> db1.sql
echo " FLUSH PRIVILEGES;" >> db1.sql


mysql < db1.sql

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld

# if [ ! -d "/var/lib/mysql/mysql" ]; then

#         chown -R mysql:mysql /var/lib/mysql

#         # init database
# 		echo "IN THE FIRST IF@@@@@@@@@@@@@@@@@@@"
#         mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm

#         tfile=`mktemp`
#         if [ ! -f "$tfile" ]; then
#                 return 1
#         fi
# fi

# if [ ! -d "/var/lib/mysql/wordpress" ]; then
# 		echo "IN THE SECOND $MYSQL_DATABASE $MYSQL_USER IF@@@@@@@@@@@@@@@@@@@@@@@@"
#         cat << EOF > /tmp/create_db.sql
# USE mysql;
# FLUSH PRIVILEGES;
# DELETE FROM mysql.user WHERE User='';
# DROP DATABASE IF EXISTS test;
# DELETE FROM mysql.db WHERE Db='test';
# DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
# ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
# CREATE DATABASE $MYSQL_DATABASE CHARACTER SET utf8 COLLATE utf8_general_ci;
# CREATE USER '$MYSQL_USER'@'%' IDENTIFIED by '$MYSQL_PASSWORD';
# GRANT ALL PRIVILEGES ON wordpress.* TO '$MYSQL_USER'@'%';
# FLUSH PRIVILEGES;
# EOF
#         # run init.sql
# 		echo "RIGHT BEFORE THE END@@@@@@@@@@@@@@@@@@@@@"
#         /usr/sbin/mysqld --user=mysql --bootstrap < /tmp/create_db.sql
#         # rm -f /tmp/create_db.sql
# fi

# mysql_install_db

# /etc/init.d/mysql start

# if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ];
# then
# 		echo "Database already exists $MYSQL_DATABASE here"
# else
# mysql_secure_installation << _EOF_
# Y
# $MYSQL_ROOT_PASSWORD
# $MYSQL_ROOT_PASSWORD
# Y
# n
# Y
# Y
# _EOF_

# 	echo "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'; FLUSH PRIVILEGES;" | mysql -uroot
# 	echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE; GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'; FLUSH PRIVILEGES;" | mysql -uroot
# fi

# /etc/init.d/mysql stop
# # exec "$@"