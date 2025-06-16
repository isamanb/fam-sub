FROM php:8.2-apache

RUN apt-get update && apt-get install -y \
    unzip \
    libpng-dev \
    libjpeg-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    libzip-dev \
    && docker-php-ext-install mysqli pdo pdo_mysql

RUN a2enmod rewrite

COPY ./sub /var/www/html/

RUN chown -R www-data:www-data /var/www/html

CMD ["apache2-foreground"]
