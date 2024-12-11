#!/bin/bash

mkdir -p /var/www/html

while ! nc -z mariadb 3306; do
    sleep 1
done
if [ ! -f "/var/www/html/wp-config.php" ]; then
    cd /var/www/html
    rm -rf *

    wp core download --locale=es_ES --allow-root

    wp --path=/var/www/html  config create --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --dbhost=${MYSQL_HOST} --locale=es_ES --allow-root --skip-check
    
    wp core install --path=/var/www/html --url=${DOMAIN_NAME} --title="INCEPTION del Orto" --admin_name=${WP_ADMIN_USER} --admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASSWORD} --admin_email="jgoikoet@student.42urduliz.com" --skip-email --allow-root 
    wp user create ${WP_USER2} ${WP_USER2}@example.com --role=author --user_pass=${WP_PASSWORD2} --allow-root --path=/var/www/html

fi

/usr/sbin/php-fpm7.4 -F