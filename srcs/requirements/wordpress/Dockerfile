FROM debian:buster

RUN apt update && apt upgrade
RUN apt install -y curl php-fpm php-mysql

WORKDIR /var/www

COPY requirements/wordpress/conf/wp-config.sh ../
RUN chmod 777 ../wp-config.sh

CMD ["../wp-config.sh"]