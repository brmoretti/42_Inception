FROM debian:oldstable

EXPOSE 443

# Install Nginx
RUN apt-get update -y && apt-get install -y nginx openssl

# Copy Nginx configuration
# a configuracao tem que ser copiada pra pasta conf.d do nginx
COPY ./conf/nginx.conf /etc/nginx/conf.ds
COPY ./tools/nginx_start.sh /var/www/nginx_start.sh

RUN chmod +x /var/www/nginx_start.sh

ENTRYPOINT ["/var/www/nginx_start.sh"]

CMD ["nginx", "-g", "daemon off;"]
