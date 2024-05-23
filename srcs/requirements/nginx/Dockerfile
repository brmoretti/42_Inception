FROM debian:oldstable

EXPOSE 443

# Install Nginx
RUN apt-get update && apt-get install -y nginx openssl

# Copy Nginx configuration
COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY tools/start_nginx.sh /var/www/

RUN chmod +x /var/www/nginx_start.sh

ENTRYPOINT ["/var/www/nginx_start.sh"]

CMD ["nginx", "-g", "daemon off;"]
