FROM	debian:oldstable

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install mariadb-server -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY conf/my.cnf /etc/mysql/my.cnf
COPY conf/init.sql /tmp/init.sql

EXPOSE 3306

CMD ["mysqld_safe", "--user=mysql", "--init-file=/tmp/init.sql"]

