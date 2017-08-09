FROM php:5.6-fpm

RUN apt-get update \
    && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libicu-dev \
        libmcrypt-dev \
        libpng12-dev \
        libxml2-dev \
        libsasl2-dev \
        libbz2-dev \
        libmemcached-dev \
        libssl-dev libc-client2007e-dev libkrb5-dev \
        locales \
        g++

RUN docker-php-ext-install iconv mcrypt mysql \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd \
    && docker-php-ext-install zip \
    && docker-php-ext-install pdo \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install soap \
    && docker-php-ext-install shmop \
    && docker-php-ext-install sockets \
    && docker-php-ext-install sysvmsg \
    && docker-php-ext-install sysvsem \
    && docker-php-ext-install sysvshm \
    && docker-php-ext-install pcntl \
    && docker-php-ext-install mbstring \
    && docker-php-ext-install gettext \
    && docker-php-ext-install exif \
    && docker-php-ext-install dba \
    && docker-php-ext-install bcmath \
    && docker-php-ext-install calendar \
    && docker-php-ext-install bz2 \
    && docker-php-ext-install opcache


# xdebug, memcached, imap mailparse
RUN yes '' | pecl install -f xdebug \
    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_handler=dbgp" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_connect_back=1" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_autostart=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_port=9004" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && pecl install memcached-2.2.0 && docker-php-ext-enable memcached \
    && docker-php-ext-configure imap --with-imap-ssl --with-kerberos  \
    && docker-php-ext-install imap \
    && pecl install mailparse-2.1.6 && docker-php-ext-enable mailparse 

RUN apt-get remove --purge -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng12-dev \
        libicu-dev \
        libmcrypt-dev \
        libxml2-dev \
        libsasl2-dev \
        libbz2-dev \
        libmemcached-dev \
        libssl-dev libc-client2007e-dev libkrb5-dev \
    && apt-get install -y \
        libfreetype6 \
        libjpeg62-turbo \
        libpng12-0 \
        libicu52 libltdl7 \
        libmcrypt4 \
        libxml2 \
        libsasl2-2 \
        libbz2-1.0 \
        libmemcached11 libmemcachedutil2 \
        libc-client2007e libkdb5-7 \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/*

EXPOSE 9004
EXPOSE 9000

