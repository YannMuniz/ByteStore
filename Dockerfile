FROM php:8.3-fpm

RUN apt-get update && apt-get install -y \
    git curl zip unzip libpq-dev libonig-dev libxml2-dev \
    && docker-php-ext-install pdo pdo_mysql mbstring exif pcntl bcmath gd

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs

WORKDIR /var/www

COPY . .

RUN composer install --optimize-autoloader && \
    mkdir -p storage/framework/cache storage/framework/sessions storage/framework/views storage/logs && \
    chmod -R 777 storage bootstrap/cache && \
    if [ ! -f .env ]; then cp .env.example .env; fi && \
    php artisan key:generate --force

RUN npm install
RUN npm install tailwindcss @tailwindcss/vite

RUN chown -R www-data:www-data /var/www

EXPOSE 9000
CMD ["php-fpm"]
