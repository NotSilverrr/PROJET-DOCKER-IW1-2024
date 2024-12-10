FROM php:8.0.2-fpm

RUN composer install
RUN npm run build
RUN php artisan key:generate
RUN php artisan migrate:fresh —seed

CMD php artisan serve