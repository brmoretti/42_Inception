# # Base image
# FROM debian:oldstable
#
# # Update and upgrade system
# RUN apt update &&  apt upgrade -y
# RUN apt install -y nginx openssl
# RUN rm -rf /var/lib/apt/lists/*
#
# # Generate self-signed certificate
# RUN openssl req -x509 -sha256 -nodes -newkey rsa:2048 -days 365 \
# 	-keyout /etc/ssl/private/private.key \
# 	-out /etc/ssl/certs/certificate.crt \
# 	-subj "/C=BR/ST=SP/L=Sao Paulo/O=42sp/CN=bmoretti.42.fr"
#
# # Copy the package nginx file
# COPY ./tools/index.html /usr/share/nginx/html
# COPY ./tools/script.js /usr/share/nginx/html
# COPY ./tools/style.css /usr/share/nginx/html
# COPY ./tools/mediaqueries.css /usr/share/nginx/html
# COPY ./tools/assets/ /usr/share/nginx/html/assets
# COPY ./conf/nginx.conf /etc/nginx/conf.d
#
# # Permissions
# RUN chmod 755 /var/www/html
# RUN chown -R www-data:www-data /var/www/html
#
# # Expose port
# EXPOSE 3000
#
# # Run the application
# ENTRYPOINT	["nginx", "-g", "daemon off;"]

FROM alpine:3.16
RUN	apk update && apk upgrade && apk add --no-cache nginx

RUN echo "server {" > /etc/nginx/http.d/default.conf && \
    echo "root    /var/www;" >> /etc/nginx/http.d/default.conf && \
    echo "location / {" >> /etc/nginx/http.d/default.conf && \
    echo "    try_files \$uri /index.html;" >> /etc/nginx/http.d/default.conf && \
    echo "}}" >> /etc/nginx/http.d/default.conf

COPY requirements/static-website/tools/* /var/www/

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
