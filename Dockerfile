FROM php:7-alpine

RUN apk update
RUN apk add postgresql-dev pcre-dev
RUN apk add --no-cache bash build-base wget curl m4 autoconf libtool imagemagick imagemagick-dev zlib zlib-dev libcurl curl-dev libevent libevent-dev libidn libidn-dev
#libzip-dev libicu-dev libpng12-dev libjpeg62-turbo-dev
RUN printf "\n" | pecl install 'pecl/raphf' 'pecl/propro'
RUN docker-php-ext-enable raphf propro
RUN printf "\n" | pecl install pecl_http 
RUN echo -e "extension=raphf.so\nextension=propro.so\nextension=http.so" > /usr/local/etc/php/conf.d/docker-php-ext-http.ini
RUN rm -rf /usr/local/etc/php/conf.d/docker-php-ext-raphf.ini
RUN rm -rf /usr/local/etc/php/conf.d/docker-php-ext-propro.ini
RUN docker-php-ext-install opcache pdo pdo_pgsql pgsql

CMD ["php", "-a"] 