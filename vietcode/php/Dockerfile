FROM ubuntu:16.04
ENV LOG_LEVEL debug
ENV DOCUMENT_ROOT debug
ENV SERVER_NAME localhost
ENV ALLOW_OVERRIDE all

RUN apt-get update -y \
  && apt-get install -y wget zip unzip apache2 \
       php7.0 \
       php7.0-cli \
       libapache2-mod-php7.0 \
       php7.0-gd \
       php7.0-json \
       php7.0-ldap \
       php7.0-mbstring \
       php7.0-mysql \
       php7.0-pgsql \
       php7.0-sqlite3 \
       php7.0-xml \
       php7.0-xsl \
       php7.0-zip \
       php7.0-soap \
       php7.0-zip \
       php7.0-curl \
  && wget https://getcomposer.org/composer.phar \
  && mv composer.phar /usr/local/bin/composer \
  && chmod +x /usr/local/bin/composer \
  && apt-get  purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false wget
RUN a2enmod rewrite

ENTRYPOINT ["entrypoint.sh"]