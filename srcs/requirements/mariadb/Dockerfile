FROM debian:buster

# ARG MYSQL_DATABASE \
	# MYSQL_USER \
	# MYSQL_PASSWORD \
	# MYSQL_ROOT_PASSWORD

RUN apt-get update && apt-get -y install mariadb-server 
	# { echo '[mysqld]'; \
	# 	# echo 'datadir=/var/lib/mysql';\
	# 	echo 'skip-host-cache'; \
	# 	echo 'skip-name-resolve'; \
	# 	echo 'bind-address=0.0.0.0'; \
	# } | tee  /etc/mysql/mariadb.conf.d/50-server.cnf;

COPY /requirements/mariadb/tools//50-server.cnf /etc/mysql/mariadb.conf.d/


COPY /requirements/mariadb/tools/create_db.sh /

RUN chmod 777 /create_db.sh
CMD ["/create_db.sh"]
	# CMD ['/create_db.sh', '$MYSQL_DATABASE', '$MYSQL_USER', '$MYSQL_PASSWORD', '$MYSQL_ROOT_PASSWORD']
# FROM debian:buster




# RUN groupadd -r mysql && useradd -r -g mysql mysql

# RUN apt-get update && apt-get install -y mariadb-server mariadb-client \
# 	# &&	rm -rf var/lib/apt/lists/* \
# 	&& rm -rf /var/lib/mysql \
# 	&& mkdir -p /var/run/mysqld /var/lib/mysql; \
# 	# && chown -R mysql:mysql /var/run/mysqld /var/lib/mysql \
# 	# && chgrp -R mysql /var/lib/mysql\
# 	# && chmod 755 /var/run/mysqld;
# 	{ echo '[mysqld]'; \
# 		# echo 'datadir=/var/lib/mysql';\
# 		# echo 'skip-host-cache'; \
# 		# echo 'skip-name-resolve'; \
# 		echo 'bind-address=0.0.0.0'; \
# 	} | tee  /etc/mysql/mariadb.conf.d/50-server.cnf;
# 	# sed -i "s|skip-networking|skip-networking=0|g" \
# 	# 	/etc/mysql/mariadb.cnf

# EXPOSE 3306

# COPY ./requirements/mariadb/tools/create_db.sh /usr/local/bin/create_db.sh
# RUN chmod +x /usr/local/bin/create_db.sh
# RUN /usr/local/bin/create_db.sh ${MYSQL_DATABASE} ${MYSQL_USER} ${MYSQL_ROOT_PASSWORD} ${MYSQL_PASSWORD}
# # RUN chown mysql:mysql /var/lib/mysql/
# USER mysql
# CMD ["service","mysql","start"]
# CMD ["tail", "-f", "/dev/null"]
# CMD ["mysqld", "--bind-address=0.0.0.0"]

# CMD ["mysqld", "--bind-address=0.0.0.0"]
# FROM debian:buster

# # ARG MYSQL_DATABASE \
# # 	MYSQL_USER \
# # 	MYSQL_ROOT_PASSWORD\
# # 	MYSQL_PASSWORD

# RUN apt-get update && apt-get install -y mariadb-server mariadb-client \
# 	&&	rm -rf var/lib/apt/lists/* \
# 	&& mkdir -p /var/run/mysqld \
# 	&& chown -R mysql:mysql /var/run/mysqld \
# 	&& chmod 777 /var/run/mysqld

# # RUN mkdir /var/run/mysqld; \
# # 	chmod 777 /var/run/mysqld; \
# # 	{ echo '[mysqld]'; \
#			datadir=/var/lib/mysql  
# # 		echo 'skip-host-cache'; \
# # 		echo 'skip-name-resolve'; \
# # 		echo 'bind-address=0.0.0.0'; \
# # 	} | tee  /etc/mysql/mariadb.conf.d/50-server.cnf; \
# # 	sed -i "s|skip-networking|skip-networking=0|g" \
# # 		/etc/mysql/mariadb.cnf
# 	# this might not be needed the sed part

# EXPOSE 3306

# # RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql
# COPY ./requirements/mariadb/tools/create_db.sh /usr/local/bin/
# # ENTRYPOINT ["create_db.sh"]
# RUN bash create_db.sh
# # USER mysql
# # CMD [ "/usr/sbin/mysqld", "--skip-log-error"]
