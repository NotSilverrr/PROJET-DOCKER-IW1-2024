FROM php:8.0.2-fpm

RUN apt-get update \
 && apt-get install -y curl libpng-dev libjpeg-dev libfreetype6-dev libonig-dev libxml2-dev zip unzip git nano \
 && curl -sL https://deb.nodesource.com/setup_18.x | bash - \
 && apt-get install -y nodejs \
 && docker-php-ext-configure gd --with-freetype --with-jpeg \
 && docker-php-ext-install pdo pdo_mysql mbstring exif pcntl bcmath gd

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY ./composer.json /var/www/html/app2/composer.json
COPY ./package.json /var/www/html/app2/package.json

WORKDIR /var/www/html/app2

RUN chown -R www-data:www-data /var/www

USER www-data

COPY ./run.sh /tmp

EXPOSE 9000
ENTRYPOINT ["/tmp/run.sh"]
