FROM debian:oldstable

RUN apt-get update && apt-get install -y php php-mysql

RUN apt-get install -y wget unzip
RUN wget -q https://wordpress.org/latest.zip && unzip latest.zip -d /var/www/html/
RUN rm -f latest.zip

RUN chown -R www-data:www-data /var/www/html/
RUN chmod -R 755 /var/www/html/

EXPOSE 9000

CMD ["php", "-S", "0.0.0.0:9000", "-t", "/var/www/html/"]
