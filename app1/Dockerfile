FROM php:8.0.2-fpm

RUN apt-get update \
 && apt-get install -y curl libpng-dev libjpeg-dev libfreetype6-dev libonig-dev libxml2-dev zip unzip git nano \
 && curl -sL https://deb.nodesource.com/setup_18.x | bash - \
 && apt-get install -y nodejs \
 && docker-php-ext-configure gd --with-freetype --with-jpeg \
 && docker-php-ext-install pdo pdo_mysql mbstring exif pcntl bcmath gd

COPY --from=composer:2.6 /usr/bin/composer /usr/bin/composer

COPY . /var/www/html/app1

WORKDIR /var/www/html/app1

RUN chown -R www-data:www-data /var/www/html/app1 \
 && chmod -R 775 /var/www/html/app1/storage /var/www/html/app1/bootstrap/cache \
 && chown -R www-data:www-data /var/www \
 && chmod -R 775 /var/www

USER www-data

RUN composer update && composer install --no-dev --optimize-autoloader

RUN php artisan key:generate

RUN npm install
RUN npm run build

EXPOSE 9000
CMD ["php-fpm"]
