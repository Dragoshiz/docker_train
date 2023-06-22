FROM debian:buster

RUN apt-get update && apt-get -y install mariadb-server

RUN sed -i 's/^#port\s*=\s*\(.*\)$/port = \1/' /etc/mysql/mariadb.conf.d/50-server.cnf && \
	sed -i 's/^bind-address\s*=\s*127\.0\.0\.1$/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

COPY /requirements/mariadb/tools/create_db.sh /

RUN chmod 777 /create_db.sh

CMD ["/create_db.sh"]