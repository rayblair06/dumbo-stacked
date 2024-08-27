<?php

declare(strict_types=1);

define('APP_START', microtime(true));

/**
 * Bootstrap Application
 */
require_once __DIR__ . '/../app/bootstrap.php';

/**
 * Initialize and Run Router
 */
try {
    $router = $container->get('Router');

    require_once BASE_PATH . '/routes/web.php';

    $router->run();
} catch (Exception $e) {
    http_response_code(500);

    echo 'An error occurred while processing your request. Please try again later.';
    die();
}
