# Use a specific version of the PHP image for consistency
FROM dunglas/frankenphp:builder-php8.3-alpine

# Be sure to replace "your-domain-name.example.com" by your domain name
# ENV SERVER_NAME=your-domain-name.example.com

# If you want to disable HTTPS, use this value instead:
ENV SERVER_NAME=:80

# Enable PHP production settings
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

# Copy the whole project
COPY . /app

WORKDIR /app

# Get composer
COPY --from=composer:2.2 /usr/bin/composer /usr/bin/composer

# Install composer dependencies, skipping scripts to speed up build and avoid potential security risks
RUN composer install --ignore-platform-reqs --no-scripts --no-progress --no-ansi --no-dev

# add additional extensions here:
RUN install-php-extensions \
    pdo \
    pdo_mysql \
    opcache

# Set the FRANKENPHP_CONFIG environment variable to start FrankenPHP with a worker script:
# ENV FRANKENPHP_CONFIG="worker ./public/index.php"
