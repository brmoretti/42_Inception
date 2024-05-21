FROM	debian:oldstable

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y mariadb-server mariadb-client && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN groupadd -r user42 && useradd -r -g user42 user42
RUN chown -R user42:user42 /var/lib/mysql

COPY conf/my.cnf /etc/mysql/my.cnf

ENTRYPOINT [ "mysqld" ]

EXPOSE 3306
