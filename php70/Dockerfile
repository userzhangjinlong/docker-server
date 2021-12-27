FROM php:7.0-fpm

COPY phpredis-3.1.3.tar.gz libzip-1.2.0.tar.gz /

COPY apt-sources.list /etc/apt/sources.list

RUN groupadd -g 1133 lazy && useradd -g lazy -u 1133 lazy

RUN set -ex \
    && apt-get update \
    # install git
    && apt-get install -y git\
    # install cron
    && apt-get install -y cron\
    # install zip unzip
    && apt-get install -y zip unzip\
    # install supervisor
    && echo "Yes, do as I say!" | apt-get install libncursesw5 libreadline7 libtinfo5 libpython3.5-stdlib python3.5 \
    && apt-get install -y python:any supervisor \
    # install ncurses-base procps
    && apt-get install -y ncurses-base procps \
    # install zlib1g-dev
    && apt-get install -y --allow-downgrades zlib1g=1:1.2.8.dfsg-5 \
    && apt-get install -y zlib1g-dev \
    # install libpng-dev
    #&& apt-get install -y libpng-dev libjpeg62-turbo-dev libfreetype6-dev libmcrypt-dev \
    && apt-get install -y libwebp-dev libjpeg-dev libpng-dev libfreetype6-dev libmcrypt-dev \
    && docker-php-source extract \
    && cd /usr/src/php/ext/gd \
    && docker-php-ext-configure gd \
        --with-webp-dir=/usr/include \
        --with-jpeg-dir=/usr/include \
        --with-freetype-dir=/usr/include \
    && docker-php-ext-install gd \
    && docker-php-ext-install mcrypt \
    && cd /

RUN pecl install xdebug-2.9.0 \
    && pecl install swoole-4.3.5 \
    && docker-php-ext-enable swoole

RUN mkdir -p /usr/src/php/ext/redis \
    && cd / \
    && tar zxf phpredis-3.1.3.tar.gz -C /usr/src/php/ext/redis --strip-components 1 \
    && rm -rf phpredis-3.1.3.tar.gz \
    && cd / \

RUN cd / \
    && tar -zxvf libzip-1.2.0.tar.gz \
    && cd libzip-1.2.0 \
    && ./configure \
    && make \
    && make install \
    && export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig/"

RUN docker-php-ext-install zip pdo_mysql bcmath sockets gd opcache redis mysqli

COPY composer docker-entrypoint.sh phpunit /usr/local/bin/

RUN chmod +x /usr/local/bin/composer /usr/local/bin/docker-entrypoint.sh  /usr/local/bin/phpunit

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["supervisord"]