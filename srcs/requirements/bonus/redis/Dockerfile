FROM debian:oldstable

RUN apt -y update && apt -y upgrade
RUN apt -y install redis-server redis-tools

EXPOSE 6379

RUN mkdir -p /run/redis
RUN chmod 755 /run/redis

RUN cp /etc/redis/redis.conf /etc/redis/redis.conf.bak
RUN sed -i 's/bind 127.0.0.1/#bind 127.0.0.1/' /etc/redis/redis.conf

ENTRYPOINT [ "redis-server", "--protected-mode", "no" ]
