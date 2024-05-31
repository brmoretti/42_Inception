#!/usr/bin/env bash

wp --allow-root config create \
	--dbname="$WORDPRESS_DATABASE" \
	--dbuser="$WORDPRESS_USER" \
	--dbpass="$WORDPRESS_PASSWORD" \
	--dbhost=mariadb \
	--dbprefix="wp_"

wp core install --allow-root \
	--path=/var/www/wordpress \
	--title="Será queo largatu mama?" \
	--url=bmoretti.42.fr \
	--admin_user=$WORDPRESS_USER \
	--admin_password=$WORDPRESS_PASSWORD \
	--admin_email=bmoretti@42.fr

# Activate the Twenty Twenty-Two theme.
wp --allow-root theme activate twentytwentytwo

exec php-fpm7.4 -F
