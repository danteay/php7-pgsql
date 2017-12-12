FROM php:7-alpine

RUN apk update
RUN apk add postgresql-dev
RUN docker-php-ext-install opcache pdo pdo_pgsql pgsql

CMD ["php", "-a"] 