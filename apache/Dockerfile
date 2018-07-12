FROM php:7.2-apache

# Add postgress support
RUN apt-get -y update
RUN apt-get -y install libpq-dev
RUN docker-php-ext-install opcache pdo pdo_pgsql pgsql

CMD ["apache2-foreground"]