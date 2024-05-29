FROM debian:oldstable

# Install Nginx
RUN apt-get update -y
RUN apt-get install -y
RUN apt-get install nginx -y
RUN apt-get install openssl -y

# Generate a keys and certificates (SSL/TLS)
RUN openssl req -x509 -sha256 -nodes -newkey rsa:2048 -days 365 \
-keyout /etc/ssl/certs/localhost.key \
-out /etc/ssl/certs/localhost.crt \
-subj "/C=BR/ST=SP/L=Sao Paulo/O=42sp/CN=bmoretti.42.fr"

# Copy Nginx configuration
# a configuracao tem que ser copiada pra pasta conf.d do nginx
COPY ./conf/nginx.conf /etc/nginx/conf.d

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]