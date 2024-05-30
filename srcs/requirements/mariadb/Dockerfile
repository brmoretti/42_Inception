FROM	debian:oldstable

ARG WORDPRESS_DATABASE
ARG WORDPRESS_USER
ARG WORDPRESS_PASSWORD

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install mariadb-server -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY conf/my.cnf /etc/mysql/my.cnf

RUN service mariadb start && \
    mariadb -u root -e \
	"CREATE DATABASE IF NOT EXISTS $WORDPRESS_DATABASE; \
	CREATE USER '$WORDPRESS_USER'@'%' identified by '$WORDPRESS_PASSWORD'; \
	GRANT ALL ON wordpress_db.* TO '$WORDPRESS_USER'@'%' IDENTIFIED BY '$WORDPRESS_PASSWORD'; \
	FLUSH PRIVILEGES;" && \
    service mariadb stop

EXPOSE 3306

CMD ["mysqld_safe", "--user=mysql", "--init-file=/tmp/init.sql"]

