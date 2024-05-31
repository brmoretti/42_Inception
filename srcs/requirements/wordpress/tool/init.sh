#!/bin/bash



wp core install --allow-root \
	--path=/var/www/wordpress \
	--title="TESTESSSSSSSSETETSDFGSKFGJKSFDJGSJFKDG" \
	--url=bmoretti.42.fr \
	--admin_user=admin \
	--admin_password=admin \
	--admin_email=email@email.com

# wp core install --allow-root \
# 	--path=/var/www/wordpress \
# 	--title="$TITLE" \
# 	--url=$LOGIN.42.fr \
# 	--admin_user=$WORDPRESS_USER \
# 	--admin_password=$WORDPRESS_PASSWORD \
# 	--admin_email=email@email.com

wp user create --allow-root	\
	--path=/var/www/wordpress \
	"user" "user" \
	--user_pass="user" \
	--role='author'

# Activate the Twenty Twenty-Two theme.
wp --allow-root theme activate twentytwentytwo

exec 