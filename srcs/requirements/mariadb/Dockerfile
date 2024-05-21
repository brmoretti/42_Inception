FROM	debian:oldstable

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y mariadb-server mariadb-client && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN chown -R mysql:mysql /var/lib/mysql

COPY conf/my.cnf /etc/mysql/my.cnf
COPY conf/init.sql /tmp/init.sql

EXPOSE 3306

CMD ["mysqld", "--user=mysql", "--init-file=/tmp/init.sql"]
