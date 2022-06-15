FROM debian:buster

EXPOSE 9000

RUN apt-get update && apt-get install -y \
    php7.3-fpm \
    php7.3-mysql \
	mariadb-client \ 
	curl && \
	rm -rf /var/lib/apt/lists/*

COPY ./tools/www.conf /etc/php/7.3/fpm/pool.d
ADD https://wordpress.org/latest.tar.gz /var/www/latest.tar.gz

RUN cd /var/www && \
	tar -xvf latest.tar.gz && \
	rm -rf latest.tar.gz

RUN	curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --output /usr/bin/wp --silent
RUN	chmod +x ./usr/bin/wp

RUN mkdir /run/php

COPY ./tools/script.sh /var/www/wordpress/script.sh
COPY ./tools/wp-config.php /var/www/wordpress/
RUN rm -f /var/www/wordpress/wp-config-sample.php

RUN chmod +x /var/www/wordpress/script.sh
RUN chown -R www-data:www-data /var/www/wordpress
CMD ["bash", "/var/www/wordpress/script.sh"]
