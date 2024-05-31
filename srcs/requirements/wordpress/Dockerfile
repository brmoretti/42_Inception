FROM debian:oldstable

EXPOSE 9000

ARG WORDPRESS_DATABASE
ARG WORDPRESS_USER
ARG WORDPRESS_PASSWORD

WORKDIR /var/www/html/

RUN apt update -y && \
    apt upgrade -y && \
    apt install php-fpm php-mysql mariadb-client wget -y

RUN sed -i.default "/^listen\s=.*/c\listen = 0.0.0.0:9000" \
	/etc/php/[0-9]*.[0-9]*/fpm/pool.d/www.conf

RUN wget https://wordpress.org/latest.tar.gz && \
	tar -xzf latest.tar.gz && \
	mv wordpress/* . && \
	chown -R www-data:www-data /var/www/html && \
	chmod 755 /var/www/html && \
	rm -rf wordpress && \
	rm -rf latest.tar.gz

RUN cp wp-config-sample.php wp-config.php && \
	sed -i "s/database_name_here/${WORDPRESS_DATABASE}/g" wp-config.php && \
	sed -i "s/username_here/${WORDPRESS_USER}/g" wp-config.php && \
	sed -i "s/password_here/${WORDPRESS_PASSWORD}/g" wp-config.php
	# sed -i "s/localhost/mariadb/g" wp-config.php

# Create the directory where php-fpm will store the pid file
RUN mkdir -p /run/php

# An alias to call php-fpm without specifying the version on the CMD below
RUN ln -s $(find /usr/sbin -name 'php-fpm*') /usr/bin/php-fpm

# Start php-fpm in foreground
CMD ["php-fpm", "-F"]
