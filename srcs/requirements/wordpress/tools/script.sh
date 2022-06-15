cd /var/www/wordpress

sleep 10

wp core install --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_MAIL --url=$DOMAIN_NAME --allow-root
wp user create $WP_USER $WP_USER_MAIL --role=author --user_pass=$WP_USER_PASSWORD --allow-root
cd -

php-fpm7.3 -F
