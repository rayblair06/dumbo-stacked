<?php

use App\Http\Controllers\ApiController;
use App\Http\Controllers\IndexController;

$router->get("/", $container->get(IndexController::class));
$router->get("/api", $container->get(ApiController::class));
