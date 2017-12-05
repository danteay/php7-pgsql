FROM php:7-alpine

RUN apk update
RUN apk add postgresql-dev 
#libzip-dev libicu-dev libpng12-dev libjpeg62-turbo-dev
RUN docker-php-ext-install opcache pdo pdo_pgsql pgsql

CMD ["php", "-a"] 