chmod -R 775 /var/www/html/app2/storage /var/www/html/app2/bootstrap/cache
chmod -R 775 /var/www
composer update && composer install --no-dev --optimize-autoloader
php artisan key:generate

npm install
npm run build

php artisan migrate:fresh --seed
php-fpm