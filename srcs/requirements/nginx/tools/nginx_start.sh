#!/bin/bash

if [ ! -f /etc/ssl/certs/private.crt ]; then
echo "Nginx: setting up ssl ...";
openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout /etc/ssl/private/nginx.key \
# especifica o path que as chaves privadas geradas devet ser salvas
-keyout /etc/ssl/certs/private.crt \
# a mesma coisa do comando acima, porem para os certificados
-out /et/ssl/certs/certificate.crt \
-subj"/C=BR/ST=SP/L=Sao_Paulo/O=42SP/CN=bmoretti.42.fr"
echo "Nginx: ssl is set up!";
fi

exec "$@"
