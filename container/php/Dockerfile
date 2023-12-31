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
    && docker-php-ext-enable xdebug

COPY ./container/php/php.ini /usr/local/etc/php/php.ini
COPY ./container/php/www.conf /usr/local/etc/php-fpm.d/ZZZ-www.conf
COPY ./app /var/www/app

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
COPY --from=node:current-bookworm /usr/local/bin/node /usr/local/bin/
COPY --from=node:current-bookworm /opt/yarn-* /opt/yarn
COPY --from=node:current-bookworm /usr/local/lib/node_modules/ /usr/local/lib/node_modules/
RUN ln -fs /usr/local/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npm \
    && ln -fs /usr/local/lib/node_modules/npm/bin/npx-cli.js /usr/local/bin/npx \
    && ln -fs /opt/yarn/bin/yarn /usr/local/bin/yarn \
    && ln -fs /opt/yarn/bin/yarnpkg /usr/local/bin/yarnpkg

WORKDIR /var/www
