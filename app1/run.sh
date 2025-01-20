chmod -R 775 /var/www/html/app1/storage /var/www/html/app1/bootstrap/cache
chmod -R 775 /var/www
composer update && composer install --no-dev --optimize-autoloader
php artisan key:generate

npm install
npm run build

php artisan migrate:fresh --seed
php-fpm