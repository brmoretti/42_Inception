FROM debian:oldstable

ARG WORDPRESS_DATABASE
ARG WORDPRESS_USER
ARG WORDPRESS_PASSWORD

WORKDIR /var/www/wordpress/

RUN apt update -y && \
    apt upgrade -y && \
    apt install php7.4 php-fpm php-mysql mariadb-client wget -y

RUN wget -O /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x /usr/local/bin/wp \
	&& wp core download --allow-root --path=/var/www/wordpress

# Create the directory where php-fpm will store the pid file
RUN mkdir /run/php

RUN chown -R www-data:www-data /var/www/wordpress \
	&& chmod 755 /var/www/wordpress

RUN	cp wp-config-sample.php wp-config.php && \
	sed -i "s/database_name_here/$WORDPRESS_DATABASE/g" wp-config.php && \
	sed -i "s/username_here/$WORDPRESS_USER/g" wp-config.php && \
	sed -i "s/password_here/$WORDPRESS_PASSWORD/g" wp-config.php && \
	sed -i "s/localhost/mariadb/g" wp-config.php

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

CMD ["php-fpm7.4", "-F"]