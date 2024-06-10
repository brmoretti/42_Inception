FROM alpine:3.17

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /var/www/site
COPY ./tools/ /var/www/site/

RUN apk update && apk add --no-cache nginx

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]