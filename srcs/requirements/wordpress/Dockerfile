FROM debian:oldstable

ARG WORDPRESS_DATABASE
ARG WORDPRESS_USER
ARG WORDPRESS_PASSWORD

WORKDIR /var/www/html/

RUN apt update -y && \
    apt upgrade -y && \
    apt install php-fpm php-mysql mariadb-client wget -y

RUN wget https://wordpress.org/latest.tar.gz && \
	tar -xzf latest.tar.gz && \
	mv wordpress/* . && \
	rm -rf wordpress && \
	rm -rf latest.tar.gz

RUN cp wp-config-sample.php wp-config.php && \
	sed -i "s/database_name_here/${WORDPRESS_DATABASE}/g" wp-config.php && \
	sed -i "s/username_here/${WORDPRESS_USER}/g" wp-config.php && \
	sed -i "s/password_here/${WORDPRESS_PASSWORD}/g" wp-config.php
	# sed -i "s/localhost/mariadb/g" wp-config.php

EXPOSE 9000

CMD ["php", "-S", "0.0.0.0:9000", "-t", "/var/www/html/"]
