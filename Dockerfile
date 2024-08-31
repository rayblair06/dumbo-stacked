# Use a specific version of the PHP image for consistency and reliability
FROM dunglas/frankenphp:builder-php8.3-alpine

# Set the server name, replace "your-domain-name.example.com" with your actual domain
# If using HTTP only, set to ":80"
ENV SERVER_NAME=:80

# Enable PHP production settings for optimized performance and security
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

# Set the working directory for the application
WORKDIR /app

# Copy the entire project directory to the container's working directory
COPY . /app

# Retrieve Composer from the official Composer image
COPY --from=composer:2.2 /usr/bin/composer /usr/bin/composer

# Install Composer dependencies
# - --ignore-platform-reqs: Bypasses platform requirements, allowing the build on any environment
# - --no-scripts: Skips Composer scripts to speed up the build process and reduce security risks
# - --no-progress: Disables the progress display for a cleaner build log
# - --no-ansi: Disables ANSI colors in the output
# - --no-dev: Excludes development dependencies for a leaner production build
RUN composer install --ignore-platform-reqs --no-scripts --no-progress --no-ansi --no-dev

# Install additional PHP extensions required by the application
RUN install-php-extensions \
    pdo \
    pdo_mysql \
    opcache

# Uncomment and set the FRANKENPHP_CONFIG environment variable if starting FrankenPHP with a worker script
# ENV FRANKENPHP_CONFIG="worker ./public/index.php"
