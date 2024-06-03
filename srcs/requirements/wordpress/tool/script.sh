#!/usr/bin/env bash

wp --allow-root config create \
	--dbname="$WORDPRESS_DATABASE" \
	--dbuser="$WORDPRESS_USER" \
	--dbpass="$WORDPRESS_PASSWORD" \
	--dbhost=mariadb \
	--dbprefix="wp_"

wp core install --allow-root \
	--path=/var/www/wordpress \
	--title="Incept time" \
	--url=bmoretti.42.fr \
	--admin_user=$WORDPRESS_USER \
	--admin_password=$WORDPRESS_PASSWORD \
	--admin_email=bmoretti@42.fr

# Activate the Twenty Twenty-Two theme.
wp --allow-root theme activate twentytwentytwo

# Bonus part redis
wp plugin install redis-cache --activate --allow-root --path=/var/www/wordpress/
wp redis enable --allow-root --path=/var/www/wordpress/

# configure redis cache
wp config set WP_REDIS_PORT 6379 --add --type=constant --allow-root --path=/var/www/wordpress/
wp config set WP_REDIS_HOST redis --add --type=constant --allow-root --path=/var/www/wordpress/

# configure wordpress
wp config set WP_CACHE true --add --type=constant --allow-root --path/var/www/wordpress/

exec php-fpm7.4 -F
