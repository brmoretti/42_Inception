FROM debian:oldstable

RUN apt update -y && apt upgrade -y && \ 
    apt install nginx openssl -y

RUN openssl req -x509 -sha256 -nodes -newkey rsa:2048 -days 365 \
-keyout /etc/ssl/certs/localhost.key \
-out /etc/ssl/certs/localhost.crt \
-subj "/C=BR/ST=SP/L=Sao Paulo/O=42sp/CN=bmoretti.42.fr"

COPY ./conf/nginx.conf /etc/nginx/conf.d

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]