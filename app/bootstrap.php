<?php

use DI\ContainerBuilder;

/**
 * Define Global Constants
 */
define('BASE_PATH', realpath(__DIR__ . '/../'));

/**
 * Start the session
 */
session_start();

/**
 * Autoload dependencies
 */
require BASE_PATH . '/vendor/autoload.php';

/**
 * Configure Dependency Injection Container
 */
$containerDefinitions = require_once(BASE_PATH . '/app/config/definitions.php');

$builder = new ContainerBuilder();
$builder->addDefinitions($containerDefinitions);

$container = $builder->build();
