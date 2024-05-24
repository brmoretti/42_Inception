FROM debian:oldstable

# dizer qual diretorio os comandos vao rodar
WORKDIR /var/www/wordpress

# php-fpm para que ele funcione isolado do servidor
RUN apt-get update && apt-get install -y php-fpm php-mysql

# falta configurar o wordpress via linha de comando
# e configurar o php para escutar a porta do world press 9000


RUN apt-get install -y wget unzip
RUN wget -q https://wordpress.org/latest.zip && unzip latest.zip -d /var/www/html/
RUN rm -f latest.zip

RUN chown -R www-data:www-data /var/www
RUN chmod -R 755 /var/www

EXPOSE 9000

CMD ["php", "-S", "0.0.0.0:9000", "-t", "/var/www/html/"]
