FROM php:8.2-fpm-bookworm

ENV TZ Assia/Tokyo

RUN apt-get update \
    && apt-get install -y \
        curl \
        git \
        libicu-dev \
        libonig-dev \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libzip-dev \
        unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install \
        bcmath \
        mbstring \
        pdo \
        pdo_mysql \
        zip \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug \
    && adduser laravel-user
COPY ./docker/php/php.ini /usr/local/etc/php/php.ini
COPY ./docker/php/www.conf /usr/local/etc/php-fpm.d/ZZZ-www.conf

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /home/laravel-user/app
