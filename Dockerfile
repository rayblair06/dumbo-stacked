# Use a specific version of composer to ensure reproducibility
FROM composer:2.2 as builder

WORKDIR /app

# Copying only the composer files first to leverage Docker cache
COPY composer.json composer.lock ./

# Install composer dependencies, skipping scripts to speed up build and avoid potential security risks
RUN composer install --ignore-platform-reqs --no-scripts --no-progress --no-ansi --no-dev

# Copy the rest of the application code
COPY . .

# Use a specific version of the PHP image for consistency
FROM php:8.3-apache

# Combine RUN commands to reduce the number of layers and overall size
RUN docker-php-ext-install mysqli pdo pdo_mysql && \
    docker-php-ext-enable mysqli pdo pdo_mysql && \
    a2enmod rewrite

# Consider adding any required custom PHP configuration
# COPY ./docker/php/php.ini /usr/local/etc/php/

# Apache configuration
COPY ./docker/apache/000-default.conf /etc/apache2/sites-enabled/000-default.conf

# Copy the application code with installed dependencies
COPY --from=builder /app /var/www/html

# Correct ownership to the Apache user and group
# This may vary depending on your base image; www-data is typical for Apache on Debian-based images
RUN chown -R www-data:www-data /var/www/html

# Optionally, specify a custom entrypoint or CMD if your application requires initialization scripts

WORKDIR /var/www/html

# Expose port 80 is optional since the base image already exposes it
# EXPOSE 80

# The base PHP Apache image uses Apache as the default command, so no need to re-specify CMD unless customizing
