# Use a specific version of composer to ensure reproducibility
FROM composer:2.2 as builder

WORKDIR /app/public

# Copying only the composer files first to leverage Docker cache
COPY composer.json composer.lock ./

# Install composer dependencies, skipping scripts to speed up build and avoid potential security risks
RUN composer install --ignore-platform-reqs --no-scripts --no-progress --no-ansi --no-dev

COPY . .

# Use a specific version of the PHP image for consistency
FROM dunglas/frankenphp:builder-php8.3-alpine

# Copy the rest of the application code
COPY . .

# add additional extensions here:
RUN install-php-extensions \
    pdo \
    pdo_mysql \
    opcache

# Set the FRANKENPHP_CONFIG environment variable to start FrankenPHP with a worker script:
# ENV FRANKENPHP_CONFIG="worker ./public/index.php"
