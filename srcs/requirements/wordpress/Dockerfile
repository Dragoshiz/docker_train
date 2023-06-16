FROM debian:buster

ARG MYSQL_DATABASE \
	MYSQL_USER \
	MYSQL_PASSWORD

RUN apt update && apt upgrade && apt install -y \
	php \
	php-fpm \
	php-mysqli \
	php-json \
	php-curl \
	php-dom \
	php-exif \
	php-fileinfo \
	php-mbstring \
	# php-openssl \
	php-xml \
	php-zip \
	wget \
	unzip && \
	sed -i "s|listen = /run/php/php7.3-fpm.sock|listen = 9000|g" \
		/etc/php/7.3/fpm/pool.d/www.conf && \
	sed -i "s|listen.owner = www-data|listen.owner = nobody|g" \
		/etc/php/7.3/fpm/pool.d/www.conf && \
	sed -i "s|listen.group = www-data|listen.group = nobody|g" \
		/etc/php/7.3/fpm/pool.d/www.conf && \
	rm -rf /var/cache/apt/*
WORKDIR /var/www
RUN wget https://wordpress.org/latest.zip && \
	unzip latest.zip && \
	cp -rf wordpress/* . && \
	rm -rf wordpress latest.zip &&\
	mkdir /run/php

COPY requirements/wordpress/conf/wp-config.sh ../
RUN chmod 777 ../wp-config.sh
# COPY requirements/wordpress/conf/wp-config.sh /var/www/
# CMD ["bash", "../wp-config.sh", "${MYSQL_DATABASE}", "${MYSQL_USER}", "${MYSQL_PASSWORD}"]
# RUN rm wp-config.sh && chmod -R 0777 wp-content/
# RUN cp ../../wp-config.sh /var/www/ &&  bash wp-config.sh && chmod -R 0777 wp-content/
# CMD ["/usr/sbin/php-fpm7.3", "-F"]
RUN ../wp-config.sh ${MYSQL_DATABASE} ${MYSQL_USER} ${MYSQL_PASSWORD}
CMD ["/usr/sbin/php-fpm7.3", "-F"]

# CMD [ "tail", "-f", "/dev/null"]